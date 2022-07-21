function ret = falsa_pos(a, b, str_fun, iteraciones)

    fx = inline(str_fun);
    opc_sel = 0;
    n_iteraciones = iteraciones;
    Mn = 0;
    itemlist = {"Graficar", "Mostrar Tabla", "Valor de la raíz con error menor a Es", "Todo"};

    if (fx(a) * fx(b)) < 0

        opc_sel = listdlg ("ListString", itemlist,
        "Name", "Seleccione",
        "SelectionMode", "Single");

        disp(strcat("Quiero: ", itemlist{opc_sel}))

        switch (opc_sel)

            case 1

                mn_anterior = -100;
                error = 1;

                for i = 1:n_iteraciones

                    Mn = formula_mn(a, b, str_fun);

                    if fx(a) * fx(Mn) < 0
                        b = (Mn);
                    else
                        a = (Mn);
                    endif

                    ## Calcular error
                    if mn_anterior == -100
                        mn_anterior = Mn;
                    else
                        error = abs((Mn - mn_anterior) / Mn);
                        mn_anterior = Mn;
                    endif

                endfor

                vector = (Mn - a):Mn / 20:(Mn + b);
                plot (vector, fx(vector));

            case 2
                mn_anterior = -100;
                error = 1;
                fprintf("%s\t%s\t%s\t%s\t%s\t%s\t\%s\t\%s\t\n", "i", "a", "b", "Mn", "f(a)", "f(Mn)", "f(a)*f(Mn)", "error %")

                for i = 1:n_iteraciones

                    Mn = formula_mn(a, b, str_fun);

                    fprintf("%d\t", i)
                    fprintf("%.4f\t", a)
                    fprintf("%.4f\t", b)
                    fprintf("%.4f\t", Mn)
                    fprintf("%.4f\t", fx(a))
                    fprintf("%.4f\t", fx(Mn))

                    if fx(a) * fx(Mn) < 0
                        b = (Mn);
                    else
                        a = (Mn);
                    endif

                    fprintf("%.4f\t", fx(a) * fx(Mn))

                    ## Calcular error
                    if mn_anterior == -100
                        mn_anterior = Mn;
                    else
                        error = abs((Mn - mn_anterior) / Mn);
                        mn_anterior = Mn;
                    endif

                    ## mostrat error
                    fprintf("\t", error * 100)
                    fprintf("%.4f\t\t", error * 100)

                    fprintf("\n")

                endfor

            case 3

                mn_anterior = -100;
                error = 1;

                for i = 1:n_iteraciones

                    Mn = formula_mn(a, b, str_fun);

                    if fx(a) * fx(Mn) < 0
                        b = (Mn);
                    else
                        a = (Mn);
                    endif

                    ## Calcular error
                    if mn_anterior == -100
                        mn_anterior = Mn;
                    else
                        error = abs((Mn - mn_anterior) / Mn);
                        mn_anterior = Mn;
                    endif

                endfor

                disp("\n")
                disp (strcat("Valor de la raíz con error menor a Es: ", " ", num2str(Mn)));

            case 4

                mn_anterior = -100;
                error = 1;
                fprintf("%s\t%s\t%s\t%s\t%s\t%s\t\%s\t\%s\t\n", "i", "a", "b", "Mn", "f(a)", "f(Mn)", "f(a)*f(Mn)", "error %")

                for i = 1:n_iteraciones

                    Mn = formula_mn(a, b, str_fun);

                    fprintf("%d\t", i)
                    fprintf("%.4f\t", a)
                    fprintf("%.4f\t", b)
                    fprintf("%.4f\t", Mn)
                    fprintf("%.4f\t", fx(a))
                    fprintf("%.4f\t", fx(Mn))

                    if fx(a) * fx(Mn) < 0
                        b = (Mn);
                    else
                        a = (Mn);
                    endif

                    fprintf("%.4f\t", fx(a) * fx(Mn))

                    ## Calcular error
                    if mn_anterior == -100
                        mn_anterior = Mn;
                    else
                        error = abs((Mn - mn_anterior) / Mn);
                        mn_anterior = (Mn);
                    endif

                    ## mostrat error
                    fprintf("\t", error * 100)
                    fprintf("%.4f\t\t", error * 100)

                    fprintf("\n")

                endfor

                vector = (Mn - a):Mn / 20:(Mn + b);
                plot (vector, fx(vector));

                disp("\n")
                disp (strcat("Valor de la raíz con error menor a Es: ", " ", num2str(Mn)));

            otherwise
                disp("Nada que hacer...")

        endswitch

    else
        msg_error = "No se puede realizar el metodo de Falsa posicion con los datos ingresados";
        disp("No se puede realizar el metodo de Falsa posicion con los datos ingresados");
        questdlg (strcat("ERROR\n", "No se puede realizar el metodo de Falsa posicion con los datos ingresados"), "ERROR");
    endif

end

function ret = formula_mn(a, b, str_fun)
    ## Esta es la formula para mn
    fx = inline(str_fun);

    ret = ((a*fx(b))-(b*fx(a)))/(fx(b)-fx(a));
end
