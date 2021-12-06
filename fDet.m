% ficheiro fDet.m
%
% v2021-01-09
% Diogo Antao

function r=fDet(x)
% Calcula e retorna o valor do determinante da matriz A(x)
%
% r=fDet(x)

A = [1 2 25/7-x; 3 -2 1; 4 power((4/7-x),2) 4];

r = detGauss(A);

% EOF