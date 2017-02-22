import pandas as pd
import numpy as np
import math
import matplotlib.pylab as plt
from CollaborativeRecommendation import CollaborativeRecommendationUserBased, CollaborativeRecommendationItemBased
from Similarity import SimPearsonUser

# Load Data set
u_cols = ['user_id', 'age', 'sex', 'occupation', 'zip_code']
users = pd.read_csv('ml-100k/u.user', sep='|', names=u_cols)

r_cols = ['user_id', 'movie_id', 'rating', 'unix_timestamp']
ratings = pd.read_csv('ml-100k/u.data', sep='\t', names=r_cols)

m_cols = ['movie_id', 'title', 'release_date']
movies = pd.read_csv('ml-100k/u.item', sep='|', names=m_cols, usecols=range(3))

# Build the DataFrame
data = pd.merge(pd.merge(ratings, users), movies)
data = data[['user_id','title', 'movie_id','rating','release_date','sex','age']]

dataSmall = data[data['user_id'] < 100] # make smaller dataset to reduce computational cost

# recommendation = CollaborativeRecommendationUserBased(dataSmall)
# recommendation.learn()
# print recommendation.estimate(user_id=2, movie_id=1)

recommendation = CollaborativeRecommendationItemBased(dataSmall)
recommendation.learn()
print recommendation.estimate(user_id=2, movie_id=1)