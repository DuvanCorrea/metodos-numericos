function ret = newton_raphson(x0, str_fun, str_fun_der)
  fprintf ("***METODO DE NEWTON RAPSHON***\n");

  opc_sel = 0;
  %itemlist = {"Graficar", "Mostrar Tabla", "Valor de la raíz con error menor a Es", "Todo"};

  %opc_sel = listdlg ("ListString", itemlist,
  %"Name", "Seleccione",
  %"SelectionMode", "Single");

  %disp(strcat("Quiero: ", itemlist{opc_sel}))

  #f='7*e^(x)*sin(x)-1';
  f = str_fun;
  f = inline(f);

  #d='(7*e^(x)*(sin(x)+cos(x)))';
  d = str_fun_der;
  d = inline(d);

  xi=x0;

  erro=0.00001;

  i=0;

  if d(xi) == 0
    fprintf ('no se puede hallar una raiz');

  else

    xn= xi-(f(xi)/d(xi));
    fprintf ("____________________________________________\n");
    fprintf('I                 Xi      Fxi      Dxi    |Ee|  ');
    fprintf ("\n");
    fprintf ("____________________________________________\n");

    while errora(xn, xi) > erro && i<100000
      fprintf('%.0f\t\t',i);
      fprintf('%.3f\t',xn);
      fprintf('%.3f\t',f(xi));
      fprintf('%.3f\t',d(xi));
      fprintf('%.3f\t',errora(xn,xi));
      fprintf ("\n");
      xi=xn;
      xn= xi-(f(xi)/d(xi));
      i++;

    endwhile

    fprintf('%.0f\t\t',i);
    fprintf('%.5f\t',xn);
    fprintf('%.5f\t',errora(xn, xi));
    fprintf ("\n");

    fprintf ("____________________________________________\n");
    fprintf('\nLA RAIZ APROXIMADA ES:  %.8f\n', xn);
    
    % graficar
    x_graficar = (xn - 1):xn / 20:(xn + 1);
    
    plot (x_graficar, f(x_graficar));

  endif

  
  
  
endfunction

  #funcion que retorna el error aproximado
function ea = errora(xa, xp)
  ea = abs(((xa - xp)/xa)*100);
end
