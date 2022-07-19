  clc
  clear
  opc_sel = 0;
  itemlist = {"- Bisección", "- Falsa posición", "- Newton Raphson", "- Secante","- Cramer", "- Runge Kutta Orden Cuatro", "- Gauss Seidel", "- Minimos Cuadrados" ,"Salir"};

while (opc_sel != 9)

  opc_sel = listdlg ("ListString", itemlist,
  "Name", "Seleccione un método",
  "SelectionMode", "Single");

  disp(strcat("Método seleccionado: ",itemlist{opc_sel}))

  switch (opc_sel)

    % Biseccion
    case 1
      menus("biseccion")

    % falsa posicion
    case 2
      menus("falsa pos")

    % newton raphson
    case 3
      menus("newton raphson")

    % secante
    case 4
      menus("secante")

    % cramer
    case 5
      menus("cramer")

    % RK4
    case 6
      menus("RK4")

    % gauss seidel
    case 7

    % minimos cuadrados
    case 8
      menus("minimos cuadrados")

    case 9

    otherwise
    disp("Hasta pronto...")
  endswitch
endwhile

disp("Chao!")
