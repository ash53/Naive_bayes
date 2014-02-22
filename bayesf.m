%Bayesian classifier
X = load('ann_ind.txt');

%preparing the data
%select 3 class labels
pri_hyp = X(X(:,end)==1,:); 
comp_hyp = X(X(:,end)==2,:);
norm = X(X(:,end)==3,:);

%split dataset into training and testing dataset
%training set
ph_train= pri_hyp(1:2:end,1:1:end-1);
ch_train= comp_hyp(1:2:end,1:1:end-1);
n_train= norm(1:2:end,1:1:end-1);
%combine training set
trainPatterns=[ph_train;ch_train;n_train];
%training labels
ph_lab=pri_hyp(1:2:end,end);
ch_lab=comp_hyp(1:2:end,end);
n_lab=norm(1:2:end,end);
%combine labels
trainLabels=[ph_lab;ch_lab;n_lab];

%testing set
ph_test= pri_hyp(2:2:end,1:1:end-1);
ch_test= comp_hyp(2:2:end,1:1:end-1);
n_test=norm(2:2:end,1:1:end-1);
%combine the test data for each class
testPatterns=[ph_test;ch_test;n_test];
%b=length(testPatterns);
%display(b)
%display(testPatterns)
%testing labels
ph_testl=pri_hyp(2:2:end,end);
ch_testl=comp_hyp(2:2:end,end);
n_testl=norm(2:2:end,end);
%display(n_lab)
testLabels=[ph_testl;ch_testl;n_testl];
%n=length(testLabels);
%display(n)

predictedLabels = zeros(size(testPatterns,1),1);
    
    %Convert train and test labels to numeric
    %trainLabels = str2num(char(trainLabels));
    %testLabels = str2num(char(testLabels));
   
    %Calculate class priors
    classes = unique(trainLabels);
    priors = hist((trainLabels),classes);
    priors = priors/sum(priors);
    
    %Get the number of classes and number of features
    nClasses = numel(classes);
    nFeatures = size(trainPatterns, 2);
    
    %Calculate mean and standard deviation for each class and feature
    avg = zeros(nClasses, nFeatures);
    stdev = zeros(nClasses, nFeatures);
    for i = 1:nClasses
        avg(i,:) = mean(trainPatterns(trainLabels == classes(i),:));
        stdev(i,:) = std(trainPatterns(trainLabels == classes(i),:));
    end
    
    stdev(stdev(i,:) == 0) = sqrt((size(trainPatterns,1)-1)/3);
    
    
    %Classify test patterns
    nTestPatterns = size(testPatterns, 1);
    
    for j = 1:nTestPatterns
        
        for i = 1:nClasses

            prob_f_given_c = pdf('normal',testPatterns(j,:),avg(i,:),stdev(i,:));
            prob_c_given_f(i) = priors(i) * prod(prob_f_given_c);
        end
        
        %Assign the class with the highest posterior probability
        [max_prob, class_index] = max(prob_c_given_f);
        predictedLabels(j) = classes(class_index);
        %display(predictedLabels)
    end
    display(predictedLabels)
    %b=size(predictedLabels,1);
    %display(b)
    %calculate error
    err = sum(predictedLabels ~= testLabels)/size(testLabels,1);
    err_rate=err*100.00;
    %display(err)
    display(err_rate)
    accuracy= (size(find(predictedLabels-testLabels==0),1)/size(testLabels,1))*100.00;
    display(accuracy)
    %display('%')
