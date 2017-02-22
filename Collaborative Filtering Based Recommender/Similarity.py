from scipy.stats import pearsonr
from math import isnan
import pandas as pd

# Returns a PearsonCorrealation-based similarity score for user1 and user2
def SimPearsonUser(DataFrame, User1, User2, min_common_items=1):
    # GET MOVIES OF USER1
    movies_user1=DataFrame[DataFrame['user_id'] ==User1 ]
    # GET MOVIES OF USER2
    movies_user2=DataFrame[DataFrame['user_id'] ==User2 ]
    
    # FIND SHARED FILMS
    rep=pd.merge(movies_user1 ,movies_user2,on='movie_id',)
    if len(rep)==0:
        return 0    
    if(len(rep)<min_common_items):
        return 0    
    result = pearsonr(rep['rating_x'],rep['rating_y'])[0]
    if(isnan(result)):
        return 0
    return result

# Returns a PearsonCorrealation-based similarity score for user1 and user2
def SimCosineItem(DataFrame, Product1, Product2, min_common_items=1):
    # GET MOVIES OF USER1
    movies_user1=DataFrame[DataFrame['movie_id'] ==Product1 ]
    # GET MOVIES OF USER2
    movies_user2=DataFrame[DataFrame['movie_id'] ==Product2 ]
    
    # FIND SHARED FILMS
    rep=pd.merge(movies_user1 ,movies_user2,on='movie_id',)
    if len(rep)==0:
        return 0    
    if(len(rep)<min_common_items):
        return 0    
    res=pearsonr(rep['rating_x'],rep['rating_y'])[0]
    if(isnan(res)):
        return 0
    return res    