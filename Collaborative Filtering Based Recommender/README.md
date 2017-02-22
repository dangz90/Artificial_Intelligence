# Collaborative Filtering Recommender System
The intention of this project is to take a dataset (Movilens) and create a simple recommender system using collaborative filtering  method to calculate the rating of a given product by an user.

## Collaborative filtering
Recommender systems are tools designed for interacting with large and complex information spaces and providing information or items that are likely to be of interest to the user, in an automated fashion. 

Collaborative filtering methods are based on collecting and analyzing a large amount of information on users’ behaviors, activities or preferences and predicting what users will like based on their similarity to other users. 
Hyphothesis: Similar users tend to like similar items. 
Requires a user community. 

Collaborative filtering can be of two types: User-based and Item-based.
User-based CF works like this: take a user U and a set of other users D whose ratings are similar to the ratings of the selected user U and use the ratings from those like-minded users to calculate a prediction for the selected user U.

In Item-based CF you build an item-item matrix determining relationships between pairs of items and using this matrix and data on the current user, infer the user’s taste. Typicaly used in the domain: people who buy x also buy y

## Dataset
Movilens Database: I used the 100k ratings dataset. It can be downloaded from this link: http://grouplens.org/datasets/movielens/
