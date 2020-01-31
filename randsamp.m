function [A] = randsamp(data, n)
[y,x]=size(data);
k = randperm(y);
A = data(k(1:n),:);
