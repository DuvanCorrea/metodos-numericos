function ret = rungeKuttaOrdenCuatro(fx, in, fi, h);

  x = [0:2];
  y = [0:2];
  f = inline (fx);
  #f  = @(x,t) (fy);

  opc_sel = 0;
  itemlist = {"Graficar", "Mostrar Tabla", "Todo"};

  opc_sel = listdlg ("ListString", itemlist,
  "Name", "Seleccione",
  "SelectionMode", "Single");

  disp(strcat("Quiero: ", itemlist{opc_sel}))

  switch (opc_sel)

  case 1
    x = [0:2];
    y = [0:2];
    f = inline (fx);
    #f  = @(x,t) (fy);
    [x, y] = calculo(f, in, fi, h);

    plot(x, y,"r*")

  case 2
    x = [0:2];
    y = [0:2];
    f = inline (fx);
    #f  = @(x,t) (fy);
    [x, y] = calculo(f, in, fi, h);
    fprintf("%s\t  %s\n", "x" ,"y");
    for i=1:length(x)
      fprintf("%.4f\t", x(i));
      fprintf("%.4f", y(i));
      fprintf("\n");
    endfor
  otherwise
    disp("Nada que hacer...")
endswitch

function [x, y] = calculo(f, ti , tf,  h)
  x = ti:h:tf;
  y(1) = 4;

  for i=1:length(x)-1
    k1 = f(x(i), y(i));
    k2 = f(x(i) + (h/2), y(i) + ((k1*h)/2));
    k3 = f(x(i) + (h/2), y(i) + ((k2*h)/2));
    k4 = f(x(i) + h, y(i)+ k3*h);
    y(i+1) = y(i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4)*h;
    fprintf("--------------------------------------------\n");
  endfor

endfunction
end
