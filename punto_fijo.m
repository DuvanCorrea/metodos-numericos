function res = punto_fijo(x0, str_fun, iteraciones)
  fprintf("***METODO DE PUNTO FIJO***\n");

  cantidadIteraciones = iteraciones;
  str_fun
  x0
  f = inline(str_fun);

  contador = 0;
  fprintf("------------------------------------------------|\n" )
  fprintf("%s\t\t  %s\t\t  %s \n", "i", "xr", "|EA|" )
  fprintf("------------------------------------------------|\n" )

  fprintf("%.0f\t\t", contador);
  fprintf("%.0f\t", x0);

   while contador <= cantidadIteraciones
          if contador > 0
            xanterior = x0;
            x0 = f(xanterior);
            fprintf("%.0f\t\t", contador);
            fprintf("%.4f\t\t", x0);
            ea = abs((x0 - xanterior)/x0) *100;
            fprintf("%.2f", ea);

          endif

         fprintf("\n");
         contador = contador + 1;
   endwhile
   fprintf("------------------------------------------------|\n" )
   fprintf("LA RAIZ APROXIMADA: %.6f\n", x0);
   
    % Graficar
    
    vector = (abs(x0)*-3):x0:(abs(x0)*3);
    fun = str_fun;
    fun = strrep(fun,"^",".^");
    fun = strrep(fun,"*",".*");
    fun = inline(fun);
    
    plot(vector, fun(vector));

endfunction
