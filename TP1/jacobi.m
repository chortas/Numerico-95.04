function [resultado,k] = jacobi(A,b)
  n = 81;
  error = 10^-5;
  
  x0 = [];  
  for i=1: 81
    x0(end+1) = 0; %semilla
  endfor
  x0 = x0';
   
  for j = 1 : n
    suma_1 = A(j, [1:j-1]) * x0([1:j-1]);
    suma_2 = A(j, [j+1:n]) * x0([j+1:n]);
    x(j) =  ((b(j) - suma_1 - suma_2) / A(j,j));  
  endfor
  x1 = x';
  
  k=1;
  while (norm(x1-x0, inf) > error && k<150)
    for j = 1 : n
      suma_1 = A(j, [1:j-1]) * x1([1:j-1]);
      suma_2 = A(j, [j+1:n]) * x1([j+1:n]);
      x_iterate(j) = ((b(j) - suma_1 - suma_2) / A(j,j));
    endfor
     x0 = x1;
     x1 = x_iterate';
     k = k + 1;
  endwhile
 
  if(k==150)
    disp("Supero el numero de iteraciones permitido")
  endif
  
  resultado = x1;
end  