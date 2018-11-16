function [LikeAB] = like(A, B)

A = A;
B = B;

LikeAB=1-((sum(abs(A-B)))/2);
