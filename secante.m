% ficheiro secante.m
%
% v2021-01
% Diogo Antao

function [r,e,n] = secante(f,x0,x1,ed,kmax)
% Metodo da secante para raiz de f(x)=0
% Algoritmo 2.3 do manual
%
% [r,e,n] = secante(f,x0,x1,ed,kmax)
%
% f - referencia para funcao f(x)
% x0 - primeira estimativa inicial
% x1 - segunda estimativa inicial
% ed - erro maximo desejado e=|r-xk|
% kmax - limite de iteracoes
%
% r - estimativa da raiz r=xn
% e - erro absoluto da estimativa |r-xn|
% n - indice da estimativa na sequencia gerada x0,x1,...,xn

k=0;
f0=f(x0);
f1=f(x1);
q=f1/f0;
d=((x0-x1)*q)/(1-q);

fprintf('\n------- Metodo da Secante ------- (erro <= %.e)\n',ed)
fprintf('  k         xk             f(xk)        erro\n')
fprintf(' %2d  %14.10f  %14.10f  %9.2e\n',k,x0,f0,abs(d))
k++;
fprintf(' %2d  %14.10f  %14.10f  %9.2e\n',k,x1,f1,abs(d))

while ( abs(d) > ed && k < kmax)
    x2=x1-d;
    k++;
    x0=x1;
    x1=x2;
    f0=f1;
    f1=f(x2);
    q=f1/f0;
    d=((x0-x1)*q)/(1-q);
    fprintf(' %2d  %14.10f  %14.10f  %9.2e\n',k,x2,f1,abs(d))
end

fprintf("\n");

r=x2;
e=abs(d);
n=k;

if e>ed
    fprintf('*** A precisao desejada nao foi atingida! ***\n')
end

% EOF