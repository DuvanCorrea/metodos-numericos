  clc
  clear
  opc_sel = 0;
  itemlist = {"- Bisección", "- Falsa posición", "- Newton Raphson", "- Secante","- Cramer", "- Interpolacion de Newton por diferencias divididas", "- Gauss Seidel", "- Minimos Cuadrados"  "- Runge Kutta Orden Cuatro", "- Punto fijo", "Salir"};

while (opc_sel != 11)

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

    % interpolacion de newton por diferencias divididas
    case 6
      menus ("interpolacion de newton por diferencias divididas")

    % gauss seidel
    case 7
      menus("gauss seidel")

    % minimos cuadrados
    case 8
      menus("minimos cuadrados")

    % RK4
    case 9
      menus("RK4")

    % punto fijo
    case 9
      menus("punto fijo")

    otherwise
    disp("Hasta pronto...")
  endswitch
endwhile

disp("Chao!")
