#PARÁMETROS

% a:       matriz A (Sin coeficientes)
% b:       Vector columna de términos independientes

function res = cramer(matrizA, ter_independientes)
  fprintf ("***METODO DE CRAMER***\n");
  
  disp("Matriz A")
  disp(matrizA)
  disp("\n")
  
  disp("T�rminos independientes")
  disp(ter_independientes)
  disp("\n")
  
  disp("Determinante")
  determinante = det(matrizA)
  disp("\n")
  
  m = size(matrizA, 2); #Número de columnas matriz a
  for i = 1:m 
    d = matrizA;
    d(:, i) = ter_independientes
    Det = det(d)
    disp("\n")
    disp(['-----> X', num2str(i), ' = ', num2str(Det / determinante)])
    disp("\n")
  endfor
endfunction
