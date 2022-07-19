  opc_sel = 0;
  itemlist = {"- Bisección", "- Falsa posición", "- Newton Raphson", "- Secante", "Salir"};

  while (opc_sel != 5)

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
                  endif

                  error = 0;
                  msg_error = "";
                catch
                  disp("Error tomando datos a y b")
                  error = 1;
                  msg_error = "Error en el proceso";
                end_try_catch
              endwhile

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
                  endif

                  error = 0;
                  msg_error = "";
                catch
                  disp("Error pidiendo la funcion")
                  error = 1;
                  msg_error = "Error en el proceso";
                end_try_catch
              endwhile


              try
                  biseccion(a,b, funcion)
              catch
                disp("Error al ejecutar el metodo de biseccion")
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
                  endif

                  error = 0;
                  msg_error = "";
                catch
                  disp("Error tomando datos a y b")
                  error = 1;
                  msg_error = "Error en el proceso";
                end_try_catch
              endwhile

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
                  endif

                  error = 0;
                  msg_error = "";
                catch
                  disp("Error pidiendo la funcion")
                  error = 1;
                  msg_error = "Error en el proceso";
                end_try_catch
              endwhile


              try
                  falsa_pos(a,b, funcion)
              catch
                disp("Error al ejecutar el metodo de Falsa posición")
                return %borrar
              end_try_catch

          % newton raphson
          case 3
              clc;
              error = 1; % si es 0 no hay errores
              msg_error = "";

              x0 = 0;
              funcion = "7*e^(x)*sin(x)-1";
              funcion_der = "7*e^(x)*(sin(x)+cos(x))";

              % pedir x0
              while(error != 0)
                try
                  respuesta = inputdlg({"Ingrese el valor inicial x0"}, "Datos necesarios", 1,{x0});

                  %Si da cancelar
                  %clc
                  %disp(size(respuesta))
                  %if(size(respuesta) <= 0)
                  %  return
                  %endif

                  x0 = (str2double(respuesta(1)));

                  if(isnan(x0))
                    msg_error = "Valor de x0 no válido";
                    disp("Valor de x0 no válido");
                    error = 1;
                    questdlg (strcat("ERROR\n",msg_error), "ERROR");
                    continue
                  endif

                  error = 0;
                  msg_error = "";
                catch err
                  disp("Error tomando datos x0")
                  disp(err)
                  error = 1;
                  msg_error = "Error en el proceso";
                end_try_catch
              endwhile

              error = 1;
              msg_error = "";

              % pedir funcion
              while(error != 0)
                try
                  respuesta = inputdlg({"Ingrese la función ejem: 7*e^(x)*sin(x)-1"}, "Funcion", 1,{funcion});

                  funcion = respuesta{1};

                  if(isempty(funcion))
                    msg_error = "Función no válida";
                    disp("Función no válida");
                    error = 1;
                    questdlg (strcat("ERROR\n",msg_error), "ERROR");
                    continue
                  endif

                  error = 0;
                  msg_error = "";
                catch err
                  disp("Error tomando funcion")
                  disp(err)
                  error = 1;
                  msg_error = "Error en el proceso";
                end_try_catch
              endwhile

              error = 1;
              msg_error = "";

              % pedir derivada
              while(error != 0)
                try
                  respuesta = inputdlg({"Ingrese la derivada de la funcioón anterior ejem (7*e^(x)*(sin(x)+cos(x)))"}, "Derivada", 1,{funcion_der});

                  funcion_der = respuesta{1};

                  if(isempty(funcion_der))
                    msg_error = "Derivada no válido";
                    disp("Derivada no válido");
                    error = 1;
                    questdlg (strcat("ERROR\n",msg_error), "ERROR");
                    continue
                  endif

                  error = 0;
                  msg_error = "";
                catch err
                  disp("Error tomando derivada")
                  disp(err)
                  error = 1;
                  msg_error = "Error en el proceso";
                end_try_catch
              endwhile

              try
                disp(x0)
                disp(funcion)
                disp(funcion_der)
                newton_raphson(x0, funcion, funcion_der)
              catch err
                disp("Error al ejecutar el metodo newton_raphson")
                disp(err)
                return %borrar
              end_try_catch

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
                  respuesta = inputdlg({"punto de incicio 1", "punto de inicio 2"}, "Rango de trabajo", 1,{a,b});
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
                disp("Error al ejecutar el metodo de la Secante")
                return %borrar
              end_try_catch
          otherwise
              disp("Hasta pronto...")
          endswitch

  endwhile

  disp("Chao!")
