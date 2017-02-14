import pandas as pd
import numpy as np
import itertools
from numpy import linalg
from math import exp
from random import sample

###########################################################
#	FUNCTIONS
###########################################################
gaussian = lambda x1, x2, sigma: exp(- (np.linalg.norm(x1 - x2, 2) / sigma) )				#GAUSSIAN

decision = lambda y: 1 if y > 0 else -1

def gradient(v, evaluation, y, k, C):
	return v if evaluation > 1 else v - C * (y*k)

def svm(evaluation, sv, samples):
	False if evaluation > 1 else sv.append(samples)

def getAccuracy(predictions, Y):
	d = [1 if decision(p) == y else 0 for p, y in zip(predictions, Y)]
	accuracy = sum(d)/float(len(d))
	return accuracy

###########################################################
#	PREPROCESS
###########################################################
# IMPORT CSV
churn = pd.read_csv('churn.csv')

#### CONVERT BOOLEAN VALUES
# INTL PLAN
churn.loc[churn["Int'l Plan"] == 'no', "Int'l Plan"] = 0
churn.loc[churn["Int'l Plan"] == 'yes', "Int'l Plan"] = 1

# VMAIL PLAN
churn.loc[churn['VMail Plan'] == 'no', 'VMail Plan'] = 0
churn.loc[churn['VMail Plan'] == 'yes', 'VMail Plan'] = 1

# CHURN
churn.loc[churn['Churn?'] == 'False.', 'Churn?'] = -1
churn.loc[churn['Churn?'] == 'True.', 'Churn?'] = 1

# STATES
for i, state in enumerate(churn['State'].unique()):
	churn.loc[churn['State'] == state, 'State'] = i

# PHONE
churn['Phone'] = churn['Phone'].str.replace('-','')
churn['Phone'] = churn['Phone'].astype(int)

# CONVERT DATA TO FLOAT
churn = churn.astype('float32')

###########################################################
#	DROP COLUMNS
###########################################################
churn = churn.drop(['State', 'Area Code', 'Phone'], axis=1)

###########################################################
#	DATA SPLIT
###########################################################
split_size = int(len(churn))

training = churn.loc[:split_size,:]
test = churn.loc[split_size:,:]
###########################################################
#	INITIALIZATION
###########################################################
sigma = 0.1											# SIGMA FOR GAUSSIAN

# Y TRAINING
Y = training['Churn?'].as_matrix()					# CONVERTO TO NUMPY
# X TRAINING
X = training.drop(['Churn?'], axis=1)
X = (X - X.min()) / (X.max() - X.min())				# NORMALIZE
X = X.as_matrix()									# CONVERTO TO NUMPY

###########################################################
#	GRADIENT DESCENT 
###########################################################
### Kernels
kernels = np.array([gaussian(x1, x2, sigma) for x1, x2 in itertools.product(X,X)])
kernels = kernels.reshape(split_size , split_size )			# RESHAPE

### GET Support Vectors
sv = []
sv.append(training[training['Churn?'] == 1].index.tolist()[0])
sv.append(training[training['Churn?'] == -1].index.tolist()[0])

# Stochastic Gradient Descent
def stochasticGradientDescent(k, y, v, alpha, C, epochs):
	for epoch in range(0,epochs):
		samples = sample(range(0,split_size),1)			# OBTAIN SAMPLE
		evaluation = C * y[samples] * np.dot( np.transpose(v), k[samples][0][sv] )

		# Update
		la = 1 / float(alpha*(epoch+1))
		v = (1 - alpha) * gradient(v, evaluation, y[samples], k[samples][0][sv], C)
		
		if evaluation < 1:
			sv.append(samples[0])
			v = list(v)
			v.append( (C*alpha*Y[samples])[0] )
			v = np.asarray(v)

	return v

# Parameters
epochs = 100
alpha = 0.005
C = 10

# WEIGHTS INITIALIZATION
v = [C*alpha*Y[i] for i in sv]

# OPTIMAL KERNEL WEIGHTS
w = stochasticGradientDescent(kernels, Y, v, alpha, C, epochs)

### PREDICTION ###
predictions = np.dot(np.dot(np.diag(w), np.diag(Y[sv])).diagonal(), kernels[sv])

print 'Accuracy', getAccuracy(predictions, Y)

###########################################################
#	6. CONFUSION MATRIX
###########################################################
from sklearn.metrics import confusion_matrix

print '\nConfusion Matrix:'
pred = [decision(p) for p in predictions]
print 'SGD: '
print confusion_matrix(pred,Y)