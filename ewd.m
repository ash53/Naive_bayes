%Equal width discretization
%[x]=[.892 .345 1.23 .657 .0001];
clear all;
close all;
%x= load('disc3.txt');
load 'ann.txt';
%give the column number which you want to discretize, for example here
%column 21 is discretized
x=ann(:,21);    
k=2;
del=abs(max(x)-min(x));
interval=del/k;
for i=1:k-1
    boundary(i)= min(x)+(i*interval);
    
end
display(boundary)
for j= 1:length(x)
if (x(j) <= boundary)
    x(j)=1;
else 
    x(j)=2;
end
end
display (x)
    
