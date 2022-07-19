  clear;
  opc_sel = 0;
  itemlist = {"- Bisección", "- Falsa posición", "Metodo 3", "- Secante", "- Minimos Cuadrados", "Salir"};

  while (opc_sel != 6)

      opc_sel = listdlg ("ListString", itemlist,
      "Name", "Seleccione un método",
      "SelectionMode", "Single");

      disp(strcat("Método seleccionado: ",itemlist{opc_sel}))

      switch (opc_sel)

          % Biseccion
          case 1
              clc;
              error = 1; % si es 0 no hay errores
              msg_error = "";

              a = 1;
               b = 1.6;
              funcion = "4*x.^2-5.*x";

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
                disp("Error al ejecutar el método de biseccion")
                return %borrar
              end_try_catch

          % Falsa posicion
          case 2
              clc;
              error = 1; % si es 0 no hay errores
              msg_error = "";

              a = 1;
              b = 1.6;
              funcion = "4*x.^2-5.*x";

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
                  falsa_pos(a,b, funcion)
              catch
                disp("Error al ejecutar el método de Falsa posición")
                return %borrar
              end_try_catch

          case 3
             disp('other value')

          % Secante
          case 4
              clc;
              error = 1; % si es 0 no hay errores
              msg_error = "";

              a = 2;
              b = 3;
              funcion = "4*x.^2-5.*x";

              % pedir a y b
              while(error != 0)
                try
                  respuesta = inputdlg({"punto de inicio 1", "punto de inicio 2"}, "Rango de trabajo", 1,{a,b});
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
                  secante(a,b, funcion)
              catch
                disp("Error al ejecutar el método de la Secante")
                return %borrar
              end_try_catch

          % Minimos Cuadrados
          case 5
              clc;
              error = 1; % si es 0 no hay errores
              msg_error = "";

              % Pedir cantidad de datos
              while(error != 0)
                try
                  v = 0;
                  respuesta = inputdlg({"Cantidad de datos"},
                  "Tamaño del vector", 1,{v});
                  v = (str2double(respuesta(1)));

                  if(isnan(v) || v < 1)
                    msg_error = "Tamaño del vector no válido";
                    disp("Tamaño del vector no válido");
                    error = 1;
                    questdlg (strcat("ERROR\n",msg_error), "ERROR");
                    continue
                  end
                  error = 0;
                  msg_error = "";

                  x = [1:v];
                  y = [1:v];
                catch
                  disp("Error tomando datos del vector")
                  error = 1;
                  msg_error = "Error en el proceso";
                end_try_catch

              endwhile

              error = 1;
              % Pedir datos
              while(error != 0)
                try

                  for i=1:(v)
                     a = 0;
                     b = 0;
                     respuesta = inputdlg({"Dato de x", "Dato de Y"},
                     "Tamaño del vector", 1,{a, b});
                     a = (str2double(respuesta(1)));
                     b = (str2double(respuesta(2)));

                     if(isnan(a) || isnan(b))
                       msg_error = "Valor de x ó y no válido";
                       disp("Valor de x ó y no válido");
                       error = 1;
                       questdlg (strcat("ERROR\n",msg_error), "ERROR");
                       continue
                     end

                     x(i) = a;
                     y(i) = b;

                  endfor

                  error = 0;
                  msg_error = "";
                catch
                  disp("Error tomando datos a y b")
                  error = 1;
                  msg_error = "Error en el proceso";
                end_try_catch

              endwhile

              x
              y

              error = 1;
              % Pedir grado del polinomio
              while(error != 0)
                try
                  n = 3;
                  respuesta = inputdlg({strcat("Grado del Polinomio ejm:"," 2")}, "Grado", 1,{n});
                  n = (str2double(respuesta))

                  if(isnan(n))
                    msg_error = "Valor de n no válido";
                    disp("Valor de n no válido");
                    error = 1;
                    questdlg (strcat("ERROR\n",msg_error), "ERROR");
                    continue
                  end

                  error = 0;
                  msg_error = "";
                catch
                  disp("Error pidiendo grado del polinomio")
                  error = 1;
                  msg_error = "Error en el proceso";
                end_try_catch
              end


              try
                  minimos_cuadrados(x,y,n)
              catch
                disp("Error al ejecutar el método de minimos cuadrados")
                return %borrar
              end_try_catch
          otherwise
              disp("Hasta pronto...")
          endswitch

  end

  disp("Chao!")