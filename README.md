Naive_bayes
===========
This projects's purpose is to observe the effect of various (dependent/independent) data on naive-bayesian classifier. To
check data dependency Chi-square independence test is used and continuous data is discretized by equal width discretization. 
Thyroid disease (suited for ANN training) dataset which can be found in UCI repository is used.

The code for equal width distribution can be found in ‘ewd.m’ file. The value for k is 2 and the ‘ann.txt’ dataset is used. You have to discretize each column separately. For that, just change the number of column as mentioned in the code.  Finally, all discretized columns along with the other columns were used to form the ‘ann_discretized.txt’ dataset.
‘try1.m’ contains the code for chi-square test. For independence test the ‘ann_discretized.txt’ dataset is used. In the code x and y columns are checked for independence, you have to change the values of column number. It is mentioned in the code too.
All independent data are in ‘ann_ind.txt’ dataset and all dependent data in ‘ann_dep.txt’ dataset
‘bayesf.m’ contains the code for Bayesian classifier. Use ‘ann.txt’, ‘ann_dep.txt’ and ‘ann_ind.txt’ dataset separately to calculate the accuracy and error of the classifier for each dataset. Just change the data set name in the code. 
