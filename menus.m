function menus(str_menu)
  
  switch(str_menu)
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "biseccion"
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
      catch err
        disp("Error tomando datos a y b")
        disp(err)
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
      catch err
        disp("Error pidiendo la funcion")
        disp(err)
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
    
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "falsa pos"
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
      catch err
        disp("Error tomando datos a y b")
        disp(err)
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

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "newton raphson"
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

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "secante"
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
      endif

      error = 0;
      msg_error = "";
      catch err
        disp("Error tomando datos a y b")
        disp(err)
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
      end

      error = 0;
      msg_error = "";
      catch err
        disp("Error pidiendo la funcion")
        disp(err)
        error = 1;
        msg_error = "Error en el proceso";
      end_try_catch
    endwhile


    try
      secante(a,b, funcion)
    catch
      disp("Error al ejecutar el metodo de la Secante")
      return %borrar
    end_try_catch
 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "cramer"
    clc;
    error = 1; % si es 0 no hay errores
    msg_error = "";

    matiz_a = "[1 1 2; 2 4 -3 ; 3 6 -5]";
    vector_ter_independientes = "[9 1 0]";

    % pedir matiz_a
    while(error != 0)
      try
        respuesta = inputdlg({"Ingrese la matriz A ejem: [1 1 1; 2 2 2 ; 3 3 3]"}, "Datos necesarios", 1,{matiz_a});

        matiz_a = str2num(respuesta{1});

        if(isempty(matiz_a))
          msg_error = "Matriz no v�lida";
          disp("Matriz no v�lida");
          error = 1;
          questdlg (strcat("ERROR\n",msg_error), "ERROR");
          continue
        endif

        error = 0;
        msg_error = "";
      catch err
        disp("Error tomando matriz")
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
        respuesta = inputdlg({"Ingrese la matriz t�rminos independientes ejem: [4 4 4]"}, "Datos necesarios", 1,{vector_ter_independientes});

        vector_ter_independientes = str2num(respuesta{1});

        if(isempty(vector_ter_independientes))
          msg_error = "Matriz no v�lida";
          disp("Matriz no v�lidaa");
          error = 1;
          questdlg (strcat("ERROR\n",msg_error), "ERROR");
          continue
        endif

        error = 0;
        msg_error = "";
      catch err
        disp("Error tomando matriz")
        disp(err)
        error = 1;
        msg_error = "Error en el proceso";
      end_try_catch
    endwhile

    try
      cramer(matiz_a, vector_ter_independientes);
    catch
      disp("Error al ejecutar el metodo de cramer")
      return %borrar
    end_try_catch

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "minimos cuadrados"
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
 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "gauss seidel"
    clc;
    error = 1; % si es 0 no hay errores
    msg_error = "";

    matiz_a = "[3 -0.1 -0.2 ; 0.1 7 -0.3 ; 0.3 -0.2 -10]";
    vector_ter_independientes = "[7.85 -19.30 71.40]";

    % pedir matiz_a
    while(error != 0)
      try
        respuesta = inputdlg({"Ingrese la matriz A ejem: [1 1 1; 2 2 2 ; 3 3 3]"}, "Datos necesarios", 1,{matiz_a});

        matiz_a = str2num(respuesta{1});

        if(isempty(matiz_a))
          msg_error = "Matriz no v�lida";
          disp("Matriz no v�lida");
          error = 1;
          questdlg (strcat("ERROR\n",msg_error), "ERROR");
          continue
        endif

        error = 0;
        msg_error = "";
      catch err
        disp("Error tomando matriz")
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
        respuesta = inputdlg({"Ingrese la matriz t�rminos independientes ejem: [4 4 4]"}, "Datos necesarios", 1,{vector_ter_independientes});

        vector_ter_independientes = str2num(respuesta{1});

        if(isempty(vector_ter_independientes))
          msg_error = "Matriz no v�lida";
          disp("Matriz no v�lidaa");
          error = 1;
          questdlg (strcat("ERROR\n",msg_error), "ERROR");
          continue
        endif

        error = 0;
        msg_error = "";
      catch err
        disp("Error tomando matriz")
        disp(err)
        error = 1;
        msg_error = "Error en el proceso";
      end_try_catch
    endwhile

    try
      gauss_seidel(matiz_a, vector_ter_independientes);
    catch err
      disp(err)
      disp("Error al ejecutar el metodo de gauss seidel")
      return %borrar
    end_try_catch
 
  endswitch
endfunction