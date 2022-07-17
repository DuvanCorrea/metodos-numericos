opc_sel = 0;
itemlist = {"Bisección", "Metodo 2", "Metodo 3", "Salir"};

while (opc_sel != 4)

    opc_sel = listdlg ("ListString", itemlist,
    "Name", "Seleccione un método",
    "SelectionMode", "Single");

    disp(strcat("Método seleccionado: ",itemlist{opc_sel}))

    switch (opc_sel)

        % Biseccion
        case 1

            error = 1; % si es 0 no hay errores
            msg_error = "";

            a = 1;
            b = 1.6;
            funcion = "4*x^2-5*x";

            % pedir a y b
            while(error != 0)
              try
                respuesta = inputdlg({"Valor inferior (a o x0)", "Valor inferior (b o x1)"}, "Rango de trabajo", 1,{a,b});
                a = (str2double(respuesta(1)))
                b = (str2double(respuesta(2)))

                if(isnan(a) || isnan(b))
                  msg_error = "Valor de a ó b no válido";
                  disp("Valor de a ó b no válido");
                  error = 1;
                  questdlg (strcat("ERROR\n",msg_error), "ERROR");
                  continue
                end

                error = 0;
                msg_error = "";
              catch
                disp("Error tomando datos a y b")
                error = 1;
                msg_error = "Error en el proceso";
              end_try_catch
            end

            error = 1;
            msg_error = "";

            % Pedir function
            while(error != 0)
              try
                funcion = inputdlg({strcat("Polinomio en función de X ejm:"," 4*x^2-5*x")}, "Función", 1,{funcion});
                funcion = funcion{1}

                if(isempty(funcion))
                  msg_error = "Función no válida";
                  disp("Función no válida");
                  error = 1;
                  questdlg (strcat("ERROR\n",msg_error), "ERROR");
                  continue
                end

                error = 0;
                msg_error = "";
              catch
                disp("Error pidiendo la funcion")
                error = 1;
                msg_error = "Error en el proceso";
              end_try_catch
            end


            try
                biseccion(a,b, funcion)
            catch
              disp("Error al ejecutar el metodo de biseccion")
              return %borrar
            end_try_catch

        case 2

        case 3

        otherwise
            disp("Por favor seleccione una opción válida")
        endswitch

end

disp("Chao!")
