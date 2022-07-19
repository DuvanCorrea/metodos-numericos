#PARÁMETROS

% a:       matriz A (2 x n) donde la primera fila es la variable independiente
                            # la segunda, f(x) la variable dependiente
% x:       Constante para reemplazar en la ecuación generada por el método

function answer = interpol_newton_dife_divi(a, hallar)
  
  fprintf ("***METODO DE GAUSS SEIDEL***\n");
  
  disp("X / Y")
  disp(a)
  disp("\n")
  
  disp("Buscar")
  disp(hallar)
  disp("\n")

  try
    
    x = a(1,:)
    y = a(2,:)

    xa=x;ya=y;

    %Formacion de las diferencias divididas
    d=zeros(length(y));
    d(:,1)=y';
    for k=2:length(x)
        for j=1:length(x)+1-k
            d(j,k)=(d(j+1,k-1)-d(j,k-1))/(x(j+k-1)-x(j));
        end
    end

    %Formacion del polinomio
    for w=1:length(x)
        ds=num2str(abs(d(1,w)));
        if w>1
            if x(w-1)<0
                sg1='+';
            else
                sg1='-';
            end
        end
        if d(1,w)<0
            sg2='-';
        else
            sg2='+';
        end
        if w==1
            acum=num2str(d(1,1));
        elseif w==2
            polact=['(x' sg1 num2str(abs(x(w-1))) ')' ];
            actual=[ds '*' polact];
            acum=[acum sg2 actual];
        else
            polact=[polact '.*' '(x' sg1 num2str(abs(x(w-1))) ')' ];
            actual=[ds '*' polact];
            acum=[acum sg2 actual];
        end
    end

    fprintf('Polinomio interpolacion Newton: %s n')
    disp(acum)
    
    disp("\n")
    
    % mostar x en el valor y buscado
    f = inline(acum);
    r = f(hallar);
    
    disp(strcat("El valor de X para Y=",num2str(hallar), " es: ", "\t", num2str(r)))    
    
    disp("\n")

    if x>max(xa)|x<min(xa)
        fprintf('t Punto fuera de rango. El resultado puede equivocado n');
    end
    
    xinterp=x;
    yinterp=eval(acum);

    xg=linspace(min(xa),max(xa));
    x=xg;yg=eval(acum);
    plot(xg,yg,xa,ya,'.r',xinterp,yinterp,'or');
    grid
    
  catch err
    disp(err)
  end_try_catch

endfunction
