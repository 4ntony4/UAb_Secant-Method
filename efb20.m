% ficheiro efb20.m
%
% v2021-01-09
% Diogo Antao
%

% Vetores para as coordenadas x e y do grafico
x=(0:0.01:1)';
y=x';
N=size(x,1);
my_x=0;

for i=1:N
  y(i)=fDet(my_x);
  my_x+=0.01;
end

% Resolver a equacao fDet(x)=0 com 5 algarismos significativos
f=@(x) fDet(x);
[r,e,n]=secante(f,0,0.1,0.5e-5,20);

% Imprimir o grafico de fDet(x)
plot(x,y,";fDet(x);");
title("Grafico de fDet(x)");
grid;
xlabel("x");
ylabel("y");

%{
% Imprimir o par ordenado da solucao (r, f(r))
hold on; 
plot(r,f(r),"r*;(r, f(r));","markersize",10);
hold off;
%}

% EOF