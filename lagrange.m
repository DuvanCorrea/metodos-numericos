function res = lagrange(a)
  fprintf("***METODO DE LAGRANGE***\n");
  
  X = a(1,:)
  Y = a(2,:)

  w= length(X);
  n=w-1;
  L=zeros(w,w);
  % FORMACION DE LOS POLINOMIOS Li DE LAGRANGE
  for k=1: n+ 1
      V=1;
      for r=1:n+1
          if k~=r
              V = conv(V, poly(X(r)))/(X(k)-X(r));
          end
      end
      L(k,:) = V;
  end
  L
  % CALCULO DE LOS COEFICIENTES DEL POLINOMIO INTERPOLADOR
  C=Y*L
  
  pos = length(C);
  fun = "";
  i = 1;
  
  while i<=length(C)
    signo = "";
    
    if C(i) >= 0
      signo = "+";
    else
      digno = "";
    endif
    
    fun = strcat(fun,signo,num2str(C(i)),"*","x.^","(",num2str(pos-1),")")
    i = i+1;
    pos = pos - 1;
  endwhile
  disp("\n")
  fun = inline(fun);
  fun = fun(X);
  
  plot(X,fun);
  
endfunction
