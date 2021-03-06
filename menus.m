function menus(str_menu)

  switch(str_menu)

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "biseccion"
    clc;
    error = 1; % si es 0 no hay errores
    msg_error = "";

    a = 1;
    b = 1.6;
    funcion = "4*x^2-5*x";
    iteraciones = 20

    % pedir a y b
    while(error != 0)
      try
        respuesta = inputdlg({"Valor inferior (a o x0)", "Valor inferior (b o x1)"}, "Rango de trabajo", 1,{a,b});
        
        if length(respuesta) <=0
          return
        endif
        
        a = (str2double(respuesta(1)))
        b = (str2double(respuesta(2)))

        if(isnan(a) || isnan(b))
          msg_error = "Valor de a?b no v?lido";
          disp("Valor de a?b no v?lido");
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
        return
      end_try_catch
    endwhile

    error = 1;
    msg_error = "";

    % Pedir function
    while(error != 0)
      try
        funcion = inputdlg({strcat("Polinomio en funci?n de X ejm:"," 4*x^2-5*x")}, "Funci?n", 1,{funcion});
        
        if length(funcion) <=0
          return
        endif
        
        funcion = funcion{1}
    
        funcion = strrep(funcion,"^",".^");
        funcion = strrep(funcion,"*",".*");    

        if(isempty(funcion))
          msg_error = "Funci?n no v?lida";
          disp("Funci?n no v?lida");
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
        return
      end_try_catch
    endwhile

    error = 1;
    msg_error = "";
    
    % cantidad de iteraciones
    while(error != 0)
      try
        respuesta = inputdlg({"Cantidad de iteraciones"}, "Datos necesarios", 1,{iteraciones});
        
        if length(respuesta) <=0
          return
        endif
        
        iteraciones = (str2double(respuesta(1)))

        if(isnan(iteraciones))
          msg_error = "Valor no valido";
          disp("Valor no valido");
          error = 1;
          questdlg (strcat("ERROR\n",msg_error), "ERROR");
          continue
        endif

        error = 0;
        msg_error = "";
      catch err
        disp("Error tomando datos")
        disp(err)
        error = 1;
        msg_error = "Error en el proceso";
        return
      end_try_catch
    endwhile

    try
      biseccion(a,b, funcion, iteraciones)
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
    funcion = "4*x^2-5*x";
    iteraciones = 20

    % pedir a y b
    while(error != 0)
      try
        respuesta = inputdlg({"Valor inferior (a o x0)", "Valor inferior (b o x1)"}, "Rango de trabajo", 1,{a,b});
        
        if length(respuesta) <=0
          return
        endif
        
        a = (str2double(respuesta(1)))
        b = (str2double(respuesta(2)))

        if(isnan(a) || isnan(b))
          msg_error = "Valor de a?b no v?lido";
          disp("Valor de a?b no v?lido");
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
        return
      end_try_catch
    endwhile

    error = 1;
    msg_error = "";

    % Pedir function
    while(error != 0)
      try
        funcion = inputdlg({strcat("Polinomio en funci?n de X ejm:"," 4*x^2-5*x")}, "Funci?n", 1,{funcion});
        
        if length(funcion) <=0
          return
        endif
        
        funcion = funcion{1}
        
        funcion = strrep(funcion,"^",".^");
        funcion = strrep(funcion,"*",".*");

        if(isempty(funcion))
          msg_error = "Funci?n no v?lida";
          disp("Funci?n no v?lida");
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
        return
      end_try_catch
    endwhile

    error = 1;
    msg_error = "";
    
    % iteraciones
    while(error != 0)
      try
        respuesta = inputdlg({"Numero de iteraciones"}, "Numero de iteraciones", 1,{iteraciones});
        
        if length(respuesta) <=0
          return
        endif
        
        iteraciones = (str2double(respuesta(1)))

        if(isnan(iteraciones))
          msg_error = "Valor no v?lido";
          disp("Valor no v?lido");
          error = 1;
          questdlg (strcat("ERROR\n",msg_error), "ERROR");
          continue
        endif

        error = 0;
        msg_error = "";
      catch err
        disp("Error tomando datos")
        disp(err)
        error = 1;
        msg_error = "Error en el proceso";
        return
      end_try_catch
    endwhile

    try
      falsa_pos(a,b, funcion, iteraciones)
    catch err
      disp(err)
      disp("Error al ejecutar el metodo de Falsa posici?n")
      return
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

        if length(respuesta) <=0
          return
        endif
        
        x0 = (str2double(respuesta(1)));

        if(isnan(x0))
          msg_error = "Valor de x0 no v?lido";
          disp("Valor de x0 no v?lido");
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
        return
      end_try_catch
    endwhile

    error = 1;
    msg_error = "";

    % pedir funcion
    while(error != 0)
      try
        respuesta = inputdlg({"Ingrese la funci?n ejem: 7*e^(x)*sin(x)-1"}, "Funcion", 1,{funcion});

        if length(respuesta) <=0
          return
        endif
        
        funcion = respuesta{1};
        
        funcion = strrep(funcion,"^",".^");
        funcion = strrep(funcion,"*",".*");

        if(isempty(funcion))
          msg_error = "Funci?n no v?lida";
          disp("Funci?n no v?lida");
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
        return
      end_try_catch
    endwhile

    error = 1;
    msg_error = "";

    % pedir derivada
    while(error != 0)
    try
      respuesta = inputdlg({"Ingrese la derivada de la funcio?n anterior ejem (7*e^(x)*(sin(x)+cos(x)))"}, "Derivada", 1,{funcion_der});

      if length(respuesta) <=0
          return
      endif
      
      funcion_der = respuesta{1};

      if(isempty(funcion_der))
        msg_error = "Derivada no v?lido";
        disp("Derivada no v?lido");
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
        return
      end_try_catch
    endwhile

    try
      x0
      funcion
      funcion_der
      newton_raphson(x0, funcion, funcion_der)
    catch err
      disp("Error al ejecutar el metodo newton_raphson")
      disp(err)
      return
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
        msg_error = "Valor de a?b no v?lido";
        disp("Valor de a?b no v?lido");
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
      funcion = inputdlg({strcat("Polinomio en funci?n de X ejm:"," 4*x^2-5*x")}, "Funci?n", 1,{funcion});
      funcion = funcion{1}

      if(isempty(funcion))
        msg_error = "Funci?n no v?lida";
        disp("Funci?n no v?lida");
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

        if length(respuesta) <=0
          return
        endif
        
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
        return
      end_try_catch
    endwhile

    error = 1;
    msg_error = "";

    % pedir funcion
    while(error != 0)
      try
        respuesta = inputdlg({"Ingrese la matriz t�rminos independientes ejem: [4 4 4]"}, "Datos necesarios", 1,{vector_ter_independientes});

        if length(respuesta) <=0
          return
        endif
        
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
        return
      end_try_catch
    endwhile

    try
      cramer(matiz_a, vector_ter_independientes);
    catch err
      disp(err)
      disp("Error al ejecutar el metodo de cramer")
      return 
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
                  
                  if length(respuesta) <=0
                    return
                  endif
                  
                  v = (str2double(respuesta(1)));

                  if(isnan(v) || v < 1)
                    msg_error = "Tamaño del vector no v?lido";
                    disp("Tamaño del vector no v?lido");
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
                  return
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
                     
                     if length(respuesta) <=0
                       return
                     endif
                     
                     a = (str2double(respuesta(1)));
                     b = (str2double(respuesta(2)));

                     if(isnan(a) || isnan(b))
                       msg_error = "Valor de x?y no v?lido";
                       disp("Valor de x?y no v?lido");
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
                  return
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
                  
                  if length(respuesta) <=0
                    return
                  endif
                  
                  n = (str2double(respuesta))

                  if(isnan(n))
                    msg_error = "Valor de n no v?lido";
                    disp("Valor de n no v?lido");
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
                  return
                end_try_catch
              end


              try
                  minimos_cuadrados(x,y,n)
              catch
                disp("Error al ejecutar el método de minimos cuadrados")
                return 
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

        if length(respuesta) <=0
          return
        endif
        
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
        return
      end_try_catch
    endwhile

    error = 1;
    msg_error = "";

    % pedir funcion
    while(error != 0)
      try
        respuesta = inputdlg({"Ingrese la matriz t�rminos independientes ejem: [4 4 4]"}, "Datos necesarios", 1,{vector_ter_independientes});

        if length(respuesta) <=0
          return
        endif
        
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
        return
      end_try_catch
    endwhile

    try
      gauss_seidel(matiz_a, vector_ter_independientes);
    catch err
      disp(err)
      disp("Error al ejecutar el metodo de gauss seidel")
      return %borrar
    end_try_catch

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "interpolacion de newton por diferencias divididas"

    clc;
    error = 1; % si es 0 no hay errores
    msg_error = "";

    matiz_a = "[1 2 4 8 ; 5 8 4 2]";
    a = 6;

    % pedir matiz_a
    while(error != 0)
      try
        respuesta = inputdlg({"Ingrese X y Y, X en la pirmera fila y Y en la segunda asi [1 2 3; 1 4 9]"}, "Datos necesarios", 1,{matiz_a});

        if length(respuesta) <=0
          return
        endif
        
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
        return
      end_try_catch
    endwhile

    error = 1;
    msg_error = "";

    % Valor a interpolar
    while(error != 0)
      try
        respuesta = inputdlg({"Valor a interpolar"}, "Datos necesarios", 1,{a});
        
        if length(respuesta) <=0
          return
        endif
        
        a = (str2double(respuesta(1)))

        if(isnan(a))
          msg_error = "Valor no v�lido";
          disp("Valor no v�lido");
          error = 1;
          questdlg (strcat("ERROR\n",msg_error), "ERROR");
          continue
        endif

        error = 0;
        msg_error = "";
      catch err
        disp("Error tomando datos")
        disp(err)
        error = 1;
        msg_error = "Error en el proceso";
        return
      end_try_catch
    endwhile

    try
      interpol_newton_dife_divi(matiz_a, a);
    catch err
      disp(err)
      disp("Error al ejecutar el metodo de interpolacion de newton por diferencias divididas")
      return 
    end_try_catch

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "RK4"
    clc;
              error = 1; % si es 0 no hay errores
              msg_error = "";
              funcion = "(1 + 4*x)*sqrt(t)";
              % pedir funcion
              while(error != 0)
                  try
                    respuesta  = inputdlg({"Ingrese la funci?n ejem: 7*e^(x)*sin(x)-1"}, "Funcion", 1,{funcion});
                    
                    if length(respuesta) <=0
                      return
                    endif
                    
                    funcion = respuesta{1};

                    if(isempty(funcion))
                       msg_error = "Funci?n no v?lida";
                       disp("Funci?n no v?lida");
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
                    return
                  end_try_catch
              endwhile


              a = 0;
              b = 1;
              error = 1;

              % pedir a y b
              while(error != 0)
                try
                  respuesta = inputdlg({"Valor inferior", "Valor superior" }, "Rango de trabajo", 1,{a,b});
                  
                  if length(respuesta) <=0
                    return
                  endif
                  
                  a = (str2double(respuesta(1)))
                  b = (str2double(respuesta(2)))

                  if(isnan(a) || isnan(b))
                    msg_error = "Valor de a?b no v?lido";
                    disp("Valor de a?b no v?lido");
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
                  return
                end_try_catch
              endwhile

              error = 1;
              % Pedir Salto
              while(error != 0)
                try
                  n = 0.1;
                  respuesta = inputdlg({strcat("Ingrese al cantidad de saltos Ejm:"," 0,1")}, "Grado", 1,{n});
                  
                  if length(respuesta) <=0
                    return
                  endif
                  
                  n = (str2double(respuesta))

                  if(isnan(n))
                    msg_error = "Valor de n no v?lido";
                    disp("Valor de n no v?lido");
                    error = 1;
                    questdlg (strcat("ERROR\n",msg_error), "ERROR");
                    continue
                  end

                  error = 0;
                  msg_error = "";
                catch
                  disp("Error pidiendo H")
                  error = 1;
                  msg_error = "Error en el proceso";
                  return
                end_try_catch
              end

              try
                  rungeKuttaOrdenCuatro(funcion,a,b,n)
              catch
                disp("Error al ejecutar el método rk4")
                return %borrar
              end_try_catch

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "punto fijo"
    clc;
    error = 1; % si es 0 no hay errores
    msg_error = "";

    a = 0;
    funcion = "e^(-x)";
    iteraciones = 20

    % pedir x0
    while(error != 0)
      try
        respuesta = inputdlg({"Valor inicial x0"}, "Datos necesarios", 1,{a});
        
        if length(respuesta) <=0
          return
        endif
        
        a = (str2double(respuesta(1)))

        if(isnan(a))
          msg_error = "Valor de x0 no v?lido";
          disp("Valor de x0 v?lido");
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
        return
      end_try_catch
    endwhile

    error = 1;
    msg_error = "";

    % Pedir function
    while(error != 0)
      try
        funcion = inputdlg({strcat("Funci?n ejm:"," e^(-x)")}, "Datos necesarios", 1,{funcion});
        
        if length(respuesta) <=0
          return
        endif
        
        funcion = funcion{1}

        if(isempty(funcion))
          msg_error = "Funci?n no válida";
          disp("Funci?n no válida");
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
        return
      end_try_catch
    endwhile
    
    error = 1;
    msg_error = "";
    
    % cantidad de iteraciones
    while(error != 0)
      try
        respuesta = inputdlg({"Cantidad de iteraciones"}, "Datos necesarios", 1,{iteraciones});
        
        if length(respuesta) <=0
          return
        endif
        
        iteraciones = (str2double(respuesta(1)))

        if(isnan(iteraciones))
          msg_error = "Valor no valido";
          disp("Valor no valido");
          error = 1;
          questdlg (strcat("ERROR\n",msg_error), "ERROR");
          continue
        endif

        error = 0;
        msg_error = "";
      catch err
        disp("Error tomando datos")
        disp(err)
        error = 1;
        msg_error = "Error en el proceso";
        return
      end_try_catch
    endwhile

    try
      punto_fijo(a, funcion, iteraciones)
    catch err
      disp(err)
      disp("Error al ejecutar el metodo de punto fijo")
      return %borrar
    end_try_catch

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  case "lagrange"

    clc;
    error = 1; % si es 0 no hay errores
    msg_error = "";

    matiz_a = "[1 2 4 8 ; 5 8 4 2]";

    % pedir matiz_a
    while(error != 0)
      try
        respuesta = inputdlg({"Ingrese X y Y, X en la pirmera fila y Y en la segunda asi [1 2 3; 1 4 9]"}, "Datos necesarios", 1,{matiz_a});

        if length(respuesta) <=0
          return
        endif
        
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
        return
      end_try_catch
    endwhile


    try
      lagrange(matiz_a);
    catch err
      disp(err)
      disp("Error al ejecutar el metodo de lagrange")
      return 
    end_try_catch
    
  endswitch
endfunction
