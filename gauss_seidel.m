#PARÁMETROS

% matrizA:                  matriz A (Sin coeficientes)
% ter_independientes:       Vector columna de términos independientes

function answer = gauss_seidel(matrizA, ter_independientes)
  
  fprintf ("***METODO DE GAUSS SEIDEL***\n");
  
  disp("Matriz A")
  disp(matrizA)
  disp("\n")
  
  disp("T�rminos independientes")
  disp(ter_independientes)
  disp("\n")

  A = matrizA;
  b = ter_independientes;
  x=[0 0 0]';
  n=size(x,1);
  normVal=Inf; 
  %% 
  % * _*Tolerence for method*_
  tol=1e-5; itr=0;
  %% Algorithm: Gauss Seidel Method
  %%
  while normVal>tol
      x_old=x;
      
      for i=1:n
          
          sigma=0;
          
          for j=1:i-1
                  sigma=sigma+A(i,j)*x(j);
          end
          
          for j=i+1:n
                  sigma=sigma+A(i,j)*x_old(j);
          end
          
          x(i)=(1/A(i,i))*(b(i)-sigma);
      end
      
      itr=itr+1;
      normVal=norm(x_old-x);
  end
  %%
  fprintf('La solicion del sistemas es : \n X1 = %f\n X2 = %f\n X3 = %f\n%f',x);
  
endfunction
