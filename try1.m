%Chi-Square Test of Independence
clear all;
close all;
load ann_discretized.txt
%load columns of dataset, here column y is being tested w.r.t column x for independence
x= ann_discretized(:,17);         
y= ann_discretized(:,18);
%plot(x,y)
o= crosstab(x,y);    %create contingency table
%display (o)
sl= 0.05;
[r c] = size(o);
dof = (r-1)*(c-1);   %degree of freedom

    %e(expected frequency) = (count(A=ai)*count(B=bi)) / N
    e = sum(o,2)*sum(o,1) / sum(o(:));

    % [ sum_r [ sum_c ((o_ij-e_ij)^2/e_ij) ] ]
    X2 = sum(sum( (o-e).^2 ./ e ));

    % p-value needed to reject hNull at the significance level with dof
    pValue = 1 - chi2cdf(X2, dof);
    hNull = (pValue > sl);

    % X2 value needed to reject hNull at the significance level with dof
    % X2table = chi2inv(1-alpha, dof);
    % hNull = (X2table > X2);
    display (pValue);
    display (hNull);
    display (X2);
    if (hNull==0) 
        display ('Dependent');
    else if (hNull==1) 
            display('Independent');
        end
    end
    
