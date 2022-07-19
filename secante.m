function ret = secante(xi, xf, str_fun)

      funcion = inline(str_fun);
      opc_sel = 0;
      n_iteraciones = 20;
      Mn = 0;
      itemlist = {"Graficar", "Mostrar Tabla", "Valor de la raíz con error menor a Es", "Todo"};

      erro= 0.01

      function ea = errora(xn,xp)
         ea = abs( xn - xp );
      end

      if funcion(xi)-funcion(xf)~=0


        opc_sel = listdlg ("ListString", itemlist,
        "Name", "Seleccione",
        "SelectionMode", "Single");

        disp(strcat("Quiero: ", itemlist{opc_sel}))

        switch (opc_sel)

        case 1

            xif = xi;
            xff = xf;

            i = 1;
            while errora(xf,xi)> erro
                xn = xi-(((xi-xf)/(funcion(xi)-funcion(xf)))*funcion(xi));
                #fprintf('%.5f\t\t', xn);
                xf = xi;
                xi = xn;
                i++;
            endwhile;

            vector = (xi - xif):xi / 20:(xi + xff);
            plot (vector, funcion(vector));

        case 2
            i=1;
            fprintf ("_________________________________________\n");
            fprintf("%s\t %s\t\t%s\t  %s\n", 'I', 'Xi', 'Fxi', '|Er|');
            fprintf ("_________________________________________\n");
            fprintf('%.0f\t', i);
            fprintf('%.3f\t\t', xi);
            fprintf('%.3f\t',funcion(xi));
            fprintf('%.3f\t', errora(xf,xi));
            fprintf ("\n");

            while errora(xf,xi)> erro
                xn = xi-(((xi-xf)/(funcion(xi)-funcion(xf)))*funcion(xi));
                #fprintf('%.5f\t\t', xn);
                xf = xi;
                xi = xn;
                i++;
                fprintf('%.0f\t', i);
                fprintf('%.3f\t\t', xn);
                fprintf('%.3f\t',funcion(xi));
                fprintf('%.3f\t', errora(xn,xf));
                fprintf ("\n");
            endwhile;
            fprintf ("__________________________________________\n");

        case 3

            i = 1;
            while errora(xf,xi)> erro
                xn = xi-(((xi-xf)/(funcion(xi)-funcion(xf)))*funcion(xi));
                #fprintf('%.5f\t\t', xn);
                xf = xi;
                xi = xn;
                i++;
            endwhile;
            disp (strcat("Valor de la raíz con error menor a Es: ", " ", num2str(xi)));

        otherwise
                disp("Nada que hacer...")

        endswitch

     else
         msg_error = "No se puede realizar el metodo de la Secanate con los datos ingresados";
        disp("No se puede realizar el metodo de la Secanatecon los datos ingresados");
        questdlg (strcat("ERROR\n", "No se puede realizar el metodo de la Secanate con los datos ingresados"), "ERROR");
     endif

end