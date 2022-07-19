function ret = minimos_cuadrados(h, y, n)

      opc_sel = 0;
      itemlist = {"Graficar", "Mostrar Ecuación", "Todo"};

      if n >0

        opc_sel = listdlg ("ListString", itemlist,
        "Name", "Seleccione",
        "SelectionMode", "Single");

        disp(strcat("Quiero: ", itemlist{opc_sel}))

        switch (opc_sel)

        case 1

            for i=(n+1):-1:1
                A(:,n+2-i)=[h.^(i-1)]';
            endfor

            B=A';
            M=B*A;
            MI=inv(M);
            x0=MI*B*y';
            ec=fopen("yy.m","w");

            fprintf(ec,"yy=");

            for i=1:(n+1)
                fprintf(ec, "%+f.*x.^%i", x0(i),n+1-i);
            endfor

            ec;

            printf("\n");
            fprintf(ec, ";");
            fclose(ec);

            x=linspace(min(h)-2,max(h)+2,1000);
            yy
            plot(x,yy,h,y,"*r");

        case 2
            for i=(n+1):-1:1
                A(:,n+2-i)=[h.^(i-1)]';
            endfor

            B=A';
            M=B*A;
            MI=inv(M);
            x0=MI*B*y';
            ec=fopen("yy.m","w");

            fprintf(ec,"yy=");
            printf("p(x)=");

            for i=1:(n+1)
                printf("%+fx^%i", x0(i), n+1-i);
                fprintf(ec, "%+f.*x.^%i", x0(i),n+1-i);
            endfor

            ec;

            printf("\n");
            fprintf(ec, ";");
            fclose(ec);

            x=linspace(min(h)-2,max(h)+2,1000);
            yy

        otherwise
                disp("Nada que hacer...")

        endswitch

     else
         msg_error = "No se puede realizar el metodo de la Secanate con los datos ingresados";
        disp("No se puede realizar el metodo de la Secanatecon los datos ingresados");
        questdlg (strcat("ERROR\n", "No se puede realizar el metodo de la Secanate con los datos ingresados"), "ERROR");
     endif

end