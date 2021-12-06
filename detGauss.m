% ficheiro detGauss.m
%
% v2021-01-09
% Diogo Antao

function d=detGauss(A)
% Calcula e retorna o valor do determinante da matriz A
% Baseada no metodo de eliminacao de Gauss
%
% d=detGauss(A)

n=size(A,1);

% Transformar em triangular superior
for k=1:n-1
  px=A(k,k);   % pivot
  % Elimina abaixo da diagonal
  for i=k+1:n
    mu=A(i,k)/px;
    A(i,k+1:end)=A(i,k+1:end)-mu*A(k,k+1:end);
    A(i,k)=0;
  end
end

% Calcular Determinante
d=1;
for i=1:n
  for j=1:n
    if (i==j)
      d*=A(i,j);
    end
  end
end

% EOF