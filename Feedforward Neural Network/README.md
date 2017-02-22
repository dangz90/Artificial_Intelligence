# Feedforward Neural Network

We investigate the use of feedforward neural networks as a CI approach for non-linear regression on a large clinical dataset. 
We show that the inherent grouping structure of the data by patients suggest standardization by subject for preprocessing, 
and perform model selection on different network architectures and training algorithms. The process and analysis can be found on the Final_Report.pdf.

## Problem statement and goals
The goal of this work is to predict indicator scores for Parkinson's disease (PD) as accurately as possible. In particular, we attempt to predict the total- and motor components of the unified Parkinson's disease rating scale (UPDRS) which is one of the most commonly used evaluation measures in clinical study. The benchmark accuracy we wish to overcome lies at an average mean absolute test error of 5.8 points for the motor-UPDRS score, and 7.5 points for the total-UPDRS score.

## Previous work
Our project is based on the largest dataset in existence combining speech measurements with UPDRS scores. This data was collected in [1] using a device developed by Intel, the At-Home Testing Device (AHTD). A set of 52 subjects used the AHTD at their home to record speech measurements with the integrated microphone over a six-months period.

## Methods
All coding is done in MATLAB using built-in functions from the Statistics & Machine Learning, and the Neural Network toolboxes.

## Conclusions and future work
In summary, we used an MLP with one hidden layer as non-linear regression technique in an attempt to achieve better prediction accuracy for motor and total UPDRS scores than those shown in previous work. Mainly due to a lack of generaization of our method, we were not able to outperform the CART method which achieves the best results on this dataset. It might well be the case that not reducing the dimensionality of the input data from the beginning on was a mistake, and it would be very interesting to put some more effort into obtaining potentially much better performance using a dimensionality reduced set of input data to avoid overfitting.

### Additional Credits
Credits also go to my fellow course mates who were part of the team and help with the project. Angel Astudillo Aguilar (angel.astudillo@est.fib.upc.edu), Julius von Kuugelgen (julius.von.kugelgen@estfib.upc.edu), Pablo Reynoso Aguirre (pablo.eliseo.reynoso@est.fib.upc.edu).

### Bibliography
1. Christopher G Goetz et al. "Testing objective measures of motor impairment in early Parkinson's disease: Feasibility study of an at-home testing device". In: Movement Disorders 24.4 (2009), pp. 551-556.
