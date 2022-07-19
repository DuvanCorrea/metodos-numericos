  opc_sel = 0;
  itemlist = {"- Bisección", 
  "- Falsa posición", 
  "- Newton Raphson", 
  "- Secante", 
  "- Cramer", 
  "- Gauss Seidel", 
  "Salir"};

while (opc_sel != 7)

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
      
    %gauss seidel        
    case 6
      menus("gauss seidel")
      
    
    case 8

    case 9

    otherwise
    disp("Hasta pronto...")
  endswitch
endwhile

disp("Chao!")
