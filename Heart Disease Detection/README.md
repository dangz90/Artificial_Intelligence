# Heart Disease Detection

Heart disease describes a range of conditions that affect your heart. Diseases under the heart disease umbrella include blood vessel diseases, such as coronary artery disease; heart rhythm problems (arrhythmias); and heart defects you're born with (congenital heart defects), among others. We developed a deep neural network architecture and a graphical user interface for doctors to identify with some measurements if a patient can have a heart disease. The process and analysis can be found on the Final_Report.pdf.

## Problem description
Heart disease describes a range of conditions that affect your heart. Diseases under the heart disease umbrella include blood vessel diseases, such as coronary artery disease; heart rhythm problems (arrhythmias); and heart defects you're born with (congenital heart defects), among others.

Coronary heart disease is a common term for the buildup of plaque in the heart’s arteries that could lead to heart attack. However, coronary heart disease, or CHD, is a result of coronary artery disease, or CAD, said Edward A. Fisher, M.D., Ph.D., M.P.H. [1]

With coronary artery disease, plaque first grows within the walls of the coronary arteries until the blood flow to the heart’s muscle is limited. This is also called ischemia. It may be chronic, narrowing of the coronary artery over time and limiting of the blood supply to part of the muscle. Or it can be acute, resulting from a sudden rupture of a plaque and formation of a thrombus or blood clot. [1]

Congenital heart disease is one of the major causes of death in children as well as adults. But, more often than not, such diseases are not properly diagnosed or diagnosed very late into a patient’s life. With a proper automated diagnosis system, most of those lives can be saved. 

## Problem statement and goals
In this work, we propose an intelligent decision support system that aids the doctors at diagnosing correctly the presence or absence of heart disease. The support system provides a clear an instantaneous diagnosis to the medical personnel. To accurately diagnose the patient must take some exams and measurement. Our proposed system consists mainly of: 
1. Data collection of different data sources.
2. Pre-processing of the data, which consists of standardizing and normalizing.
3. Training of a deep learning architecture.
4. Graphical user Interface and visualization of the results.

## Previous Work
With the increasing application of artificial intelligence techniques to healthcare research, it has become easier to diagnose people with an elevated level of certainty diseases while also, diminishing the number of visits to hospitals, bad diagnosis and/or the helping doctors make more accurate decisions. This has led to a revolution in healthcare, where doctors can diagnose more effectively and quicker than before. There has been some work done susing these datasets such as Das et al [2] or Jain et al [3].

## Dataset
The data that we have used to build the decision support system consists of two different datasets; both have the same attributes, 14 in total.
- Cleveland Heart Disease Dataset, which contains 303 instances. Published in 1988.
- Statlog Heart Dataset, which contains 266 instances. Published in 1993.

The dataset were obtained from the following hospitals:
1. Hungarian Institute of Cardiology. Budapest: Andras Janosi, M.D.
2. University Hospital, Zurich, Switzerland: William Steinbrunn, M.D.
3. University Hospital, Basel, Switzerland: Matthias Pfisterer, M.D.
4. V.A. Medical Center, Long Beach and Cleveland Clinic Foundation:Robert Detrano, M.D., Ph.D.

## Methods
All coding is done in python using libraries such as tensorflow, numpy, pandas, matplotlib, seaborn, math.

## Conclusions and future work
The system we have developed provides highly accurate results (94%). But it still remains to be seen that whether the system will work for larger quantities of data, since we the data set we have is very small (569 rows). Another very useful feature would be to enhance the Graphic User Interface (GUI) already presented to the doctors. The GUI will not only display the result of the prediction, but also some insights of the patient. Identify the features that are more important for the prediction such as high cholesterol, etc.

### Additional Credits
Credits also go to my fellow course mates who were part of the team and help with the project. Carles Coll Gomila (carles.coll.gomila@est.fib.upc.edu) and Barath Bheeman (barath.bheeman@est.fib.upc.edu)

### Bibliography
[1] American Heart Association, http://www.heart.org/HEARTORG/, (2014)
[2] R. Das, I. Turkoglu and A. Sengur, "Effective diagnosis of heart disease through neural networks ensembles", Expert Systems with Applications, vol. 36, no. 4, (2004), pp. 7675-7680.
[3] A. K. Jain, K. Nandakumar, and A. Ross, “Score normalization in multimodal biometric systems," Pattern Recognition , 2005.
[9] D. Chaki, A. Das and M. I. Zaber, “A comparison of three discrete methods for classification of heart disease data”, Bangladesh J. Sci. Ind. Res. 50(4), 293-296, 2015.
[10] Frank Rosenblatt. “The perceptron: A probabilistic model for information storage and organization in the brain.” In: Psychological review 65.6 (1958), p. 386. 
[11] Shuxiang Xu and Ling Chen. “A novel approach for determining the optimal number of hidden layer neurons for FNN’s and its application in data mining”. In: (2008).
[12] S. Geman, E. Bienenstock, and R. Doursat. “Neural Networks and the Bias/Variance Dilemma”. In: Neural Computation (1992), pp. 4, 1–58.

### Acknowledgement
Cleveland and Statlog databases were obtained from UCI Machine Learning Repository:
[4] Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science. <n>
[5] Hungarian Institute of Cardiology. Budapest: Andras Janosi, M.D. 
[6] University Hospital, Zurich, Switzerland: William Steinbrunn, M.D. 
[7] University Hospital, Basel, Switzerland: Matthias Pfisterer, M.D. 
[8] V.A. Medical Center, Long Beach and Cleveland Clinic Foundation:Robert Detrano, M.D., Ph.D. 
