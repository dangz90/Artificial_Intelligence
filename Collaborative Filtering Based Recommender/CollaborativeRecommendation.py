from Similarity import SimPearsonUser, SimCosineItem
import pandas as pd
import numpy as np

############################################################
# Collaborative recommendation user based recommender system
############################################################
class CollaborativeRecommendationUserBased:

	def __init__(self, DataFrame, similarity=SimPearsonUser, min_common_items=1, max_sim_users=10):
		""" Constructor """
		self.sim_method=similarity
		self.df=DataFrame
		# self.sim = pd.DataFrame(np.sum([0]),columns=data_train.user_id.unique(), index=data_train.user_id.unique())
		self.min_common_items = min_common_items

	def learn(self):
		""" Similarity matrix for users """
		allUsers=set(self.df['user_id'])
		self.sim = {}

		for person1 in allUsers:
			self.sim.setdefault(person1, {})
			a = self.df[self.df['user_id']==person1][['movie_id']]			# All movies seen by person1
			data_reduced = pd.merge(self.df, a, on='movie_id')
			for person2 in allUsers:
				if person1 == person2: continue								# If same person don't calculate anything
				self.sim.setdefault(person2, {})
				if(self.sim[person2].has_key(person1)): continue 			# Since is a simetric matrix
				sim=self.sim_method(data_reduced,person1,person2)
				if(sim < 0):
					self.sim[person1][person2] = 0
					self.sim[person2][person1] = 0
				else:
					self.sim[person1][person2] = sim
					self.sim[person2][person1] = sim

	def estimate(self, user_id, movie_id):
		max_sim_users=10
		totals={}
		movie_users=self.df[self.df['movie_id'] == movie_id]
		rating_num=0.0
		rating_den=0.0
		allUsers=set(movie_users['user_id'])
		ra = self.df[self.df.user_id==user_id].rating.mean()        
		listOrdered = sorted([(self.sim[user_id][other], other) for other in allUsers if user_id!=other],reverse=True)

		for item in range(min(len(listOrdered), max_sim_users)):
			other=listOrdered[item][1]
			rating_num += self.sim[user_id][other] * (float(movie_users[movie_users['user_id']==other]['rating']) - self.df[self.df.user_id==other].rating.mean())
			rating_den += self.sim[user_id][other]
		if rating_den==0: 
			if self.df.rating[self.df['movie_id']==movie_id].mean()>0:
				# return the mean movie rating if there is no similar for the computation
				return self.df.rating[self.df['movie_id']==movie_id].mean()
			else:
				# else return mean user rating 
				return self.df.rating[self.df['user_id']==user_id].mean()
		return rating_num/rating_den + ra

############################################################
# Collaborative recommendation item based recommender system
############################################################
class CollaborativeRecommendationItemBased:

    def __init__(self, DataFrame, similarity=SimCosineItem, min_common_items=1, max_sim_users=10):
        """ Constructor """
        self.sim_method=similarity
        self.df=DataFrame
        # self.sim = pd.DataFrame(np.sum([0]),columns=data_train.user_id.unique(), index=data_train.user_id.unique())
        self.min_common_items = min_common_items

    def learn(self):
        """ Similarity matrix for product """
        allMovies=set(self.df['movie_id'])
        self.sim = {}
        for movie1 in allMovies:
            self.sim.setdefault(movie1, {})
            a=self.df[self.df['movie_id']==movie1][['user_id']]
            data_reduced=pd.merge(self.df,a,on='user_id')
            for movie2 in allMovies:
                if movie1==movie2: continue
                self.sim.setdefault(movie2, {})
                if(self.sim[movie2].has_key(movie1)):continue 
                sim = self.sim_method(data_reduced,movie1,movie2)
                if(sim<0):
                    self.sim[movie1][movie2]=0
                    self.sim[movie2][movie1]=0
                else:
                    self.sim[movie1][movie2]=sim
                    self.sim[movie2][movie1]=sim

    def estimate(self, user_id, movie_id):
        max_sim_users=10
        totals={}
        movie_users=self.df[self.df['movie_id'] == movie_id]
        rating_num=0.0
        rating_den=0.0
        allUsers=set(movie_users['user_id'])
        ra = self.df[self.df.user_id==user_id].rating.mean()        
        listOrdered = sorted([(self.sim[user_id][other], other) for other in allUsers if user_id!=other],reverse=True)

        for item in range(min(len(listOrdered), max_sim_users)):
            other=listOrdered[item][1]
            rating_num += self.sim[user_id][other] * (float(movie_users[movie_users['user_id']==other]['rating']) - self.df[self.df.user_id==other].rating.mean())
            rating_den += self.sim[user_id][other]
        if rating_den==0: 
            if self.df.rating[self.df['movie_id']==movie_id].mean()>0:
                # return the mean movie rating if there is no similar for the computation
                return self.df.rating[self.df['movie_id']==movie_id].mean()
            else:
                # else return mean user rating 
                return self.df.rating[self.df['user_id']==user_id].mean()
        return rating_num/rating_den + ra	