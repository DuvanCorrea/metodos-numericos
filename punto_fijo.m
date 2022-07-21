function res = punto_fijo(x0, str_fun)
  fprintf("***METODO DE PUNTO FIJO***\n");

  cantidadIteraciones = 20;

  contador = 0;
  fprintf("------------------------------------------------|\n" )
  fprintf("%s\t\t  %s\t\t  %s \n", "i", "xr", "|EA|" )
  fprintf("------------------------------------------------|\n" )

  str_fun
  xnueva = x0
  f = inline(str_fun)

  fprintf("%.0f\t\t", contador);
  fprintf("%.6f\t", xnueva);

   while contador <= cantidadIteraciones
          if contador > 0
            xanterior = xnueva;
            xnueva = f(xanterior);
            fprintf("%.0f\t\t", contador);
            fprintf("%.6f\t", xnueva);
            ea = abs((xnueva - xanterior)/xnueva) *100;
            fprintf("%.2f", ea);

          endif

         fprintf("\n");
         contador = contador + 1;
   endwhile
   fprintf("------------------------------------------------|\n" )
   fprintf("LA RAIZ APROXIMADA: %.6f\n", xnueva);

endfunction
