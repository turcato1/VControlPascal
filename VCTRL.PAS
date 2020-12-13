program VelContrl;

USES CRT,GRAPH;


{Criacao de Variavel Homogenea}
{**Inicio**}

TYPE
   caract=record
      Atraso:real;
      TmpAcc:real;
      VEst:real;
      TmpEst:real;
      TmpDes:real;
   end;
{**Fim**}

{Definicao de variaveis}
{**Inicio**}
VAR
   motor:array[1..10] of caract;
   a,c,d,g,h,i,j,k:integer;
   b:char;
   f:byte;
   e:real;
   m:boolean;
   s:string;
{**Fim**}


Procedure Agra;

   var x:integer;

   begin
     Window(1,1,80,25);TextBackGround(Black);clrscr;
     Window(3,1,77,5);TEXTBACKGROUND(BLUE);Textcolor(YELLOW);CLRSCR;
     Writeln('**************************************************************************');
     Writeln('*  Velcontrol: Controle de Tensao Para Motores DC by Thiago e Reginaldo  *');
     Writeln('*                                                                        *');
     Writeln('*');Textcolor(WHITE);x:=length('Obrigado por utilizar nosso software!');gotoxy(38-x div 2,4);
     Write('Obrigado por usar nosso Software!');
     Textcolor(YELLOW);gotoxy(74,4);Writeln('*');
     Writeln('**************************************************************************');
     Textcolor(LightGray);
     Window(1,8,80,25);TextBackGround(Black);clrscr;
     Gotoxy(1,2);
     Sound(1000);
     Delay(600);
     Sound(800);
     Delay(300);
     Sound(600);
     Delay(300);
     Nosound;
     Halt(1);
   end;


Procedure verif;

   var l:string;
       code:integer;

   begin
      Readln(l);
      val(l,e,code);
      If code<>0 then begin
         m:=FALSE;
         Writeln('Valor Inv†lido');
      end
      else m:=TRUE;
   end;

{Insercao de mensagens}
{**1**}
Procedure mess (mensagem:String);
   begin
      Textcolor(red);
      Write(mensagem);Textcolor(black);
   end;
{**1e**}

{Geracao do Rodape}
{**2**}
Procedure rodape(a:String;x:integer);
   begin
      clrscr;
      Window(1,1,80,24);TEXTBACKGROUND(Cyan);CLRSCR;
      Window(1,25,80,25);TEXTBACKGROUND(White);CLRSCR;
      Textcolor(RED);Write('  Estado: ');Textcolor(BLACK);
      Write(a,x);
   end;
{**2e**}


{Geracao de Rodape}
{**3**}
Procedure cabecalho(frase:integer);

   var x:integer;
 
  begin
     Window(3,1,77,5);TEXTBACKGROUND(BLUE);Textcolor(YELLOW);CLRSCR;
     Writeln('************************************************************************');
     Writeln('*     Velcontrol Controle de Tens∆o Para Motores DC by SysSoft S/A.      *');
     Writeln('*                                                                        *');
     Writeln('*');Textcolor(WHITE);x:=length('Processamento de dados (E/S) da tabela :');gotoxy(38-x div 2,4);
     Write('Processamento de dados (E/S) da tabela ',frase);
     Textcolor(YELLOW);gotoxy(74,4);Writeln('*');
    Writeln('************************************************************************');
  end;
{**3e**}

{Geracao do Quadro de Valores}
{**4**}
procedure quadro;
   begin
      Window(10,7,70,23);TEXTBACKGROUND(BLUE);CLRSCR;
      Window(11,8,69,22);TEXTBACKGROUND(LIGHTGRAY);CLRSCR;
      Window(12,8,68,21);Textbackground(Lightgray);Clrscr;
   end;
{**4e**}

{Grafico de entrada}
{**g1**}
Procedure Graent;

   Var
      a:char;
      b,c,d,e,f,g:integer;

   begin
      b:=getmaxx;
      c:=getmaxy;
      d:=b div 2;
      e:=c div 2;
      b:=b-10;
      c:=c-10;
      Rectangle(10,10,b,c);
      FloodFill(50, 50, White);
      SetColor(LightRed);
      Rectangle(20,20,(b-10),(c-10));
      SetTextJustify(CenterText,BottomText);
      SetColor(LightRed);
      SetTextStyle(Triplexfont, HorizDir, 6);
      OutTextXY(d, (c-400), 'SysSoft S/A');
      SetColor(Black);
      SetTextStyle(Triplexfont, HorizDir, 1);
      OutTextXY(d, (c-360), 'Divisao de Automacao por Software da SysAuto do Brasil S/A');
      Delay(1000);
      Moveto(d,e);
      SetTextStyle(Triplexfont, HorizDir, 5);
      OutTextXY(d,e, 'VelControl versao VC/1.0');
      b:=1000;
      Sound(b);
      Delay(40);
      Nosound;
      Moveto(d,e);
      SetTextStyle(TriplexFont, HorizDir, 3);
      OutTextXY(d,(e+100), 'Controle de Velocidade de Motores DC');
      Sound(b+400);
      Delay(40);
      Nosound;
      SetColor(LightRed);
      SetTextStyle(DefaultFont, HorizDir, 1);
      OutTextXY(d,(e+200), 'Pressione uma tecla para continuar...');
      a:=readkey;
      CloseGraph;
   end;
{**g1**}


{Inicializacao grafica}
{**i**}
Procedure initg;

   var Gd, Gm: Integer;

   begin
      Gd := Detect;
      InitGraph(Gd, Gm, 'c:\tp\bgi');
      if GraphResult <> grOk then
      Halt(1);
   end;
{**ie**}


{Grafico do motor}
{**g2**}

Procedure gramot(i:integer;m:boolean;n:string);

   Var
      g:char;
      a,b,c,d,e,f:integer;
      s:string;
      j:real;

   Procedure movimento;

      Var a:integer;
      Label fim;

      begin
         a:=40;
         repeat
            a:=a+10;
            SetTextJustify(CenterText,CenterText);
            SetTextStyle(TriplexFont,HorizDir,4);
            SetColor(LightRed);
            OutTextXY((getmaxx div 2),30,'Monitoraáao do Motor');
            SetColor(White);
            f:=Trunc(1/(0.01));
            Delay(f);
            Arc(c, d, 200, 255, a);
            Arc(c, d, 20, 75, a);
         until a=80;
      end;

   Label st;

   begin
      If m=FALSE then goto st;
      SetColor(Blue);
      Rectangle(1,1,800,400);
      SetColor(Red);
      SetFillStyle(SolidFill,Blue);
      Floodfill(100,100,Blue);
      SetColor(Blue);
      Rectangle(1,401,800,600);
      SetFillStyle(SolidFill,White);
      floodfill(2,402,Blue);
      SetColor(White);
      a:=getmaxx;
      b:=getmaxy;
      c:=a div 2;
      d:=b div 2;
      Circle(c,d,125);
      Circle(c,d,118);
      Circle(c,d,30);
      movimento;
      SetColor(LightRed);
      SetTextStyle(DefaultFont,HorizDir,1);
      SetTextJustify(CenterText,CenterText);
      OutTextXY(c,410,'Valoraá∆o Atual');
      SetTextJustify(RightText,CenterText);
      OutTextXY((c+50),440,'Tens∆o no Motor (x0.1V):   ');
      st: If n='ac' then str((i-1),s) else str((i+1),s);
      SetColor(White);
      OutTextXY((c+50),440,s);
      str(i,s);
      SetColor(LightRed);
      OutTextXY((c+50),440,s);
   end;
{**g2e**}



{******************************Inicio do Programa**************************}

   begin

      initg;
      Graent;
      Delay(80);

{Zeramento da variavel heterogenea}
{**p1**}
      a:=0;
      Repeat
         a:=a+1;
         (motor[a].Atraso):=0;
         (motor[a].TmpAcc):=0;
         (motor[a].VEst):=0;
         (motor[a].TmpEst):=0;
         (motor[a].TmpDes):=0;
      Until a=10;
{**p1e**}


{Coleta de dados}
{**p2**}
      a:=0;
      Repeat
         a:=a+1;
         rodape('Entrada de dados na tabela',a);
         cabecalho(a);
         quadro;
         gotoxy(1,2);

         Repeat
            mess('Escreva o tempo de atraso inicial do motor em s: ');
            verif;
            If m=TRUE then (motor[a].Atraso):=e;
         Until m=TRUE;

         Repeat
            mess('Escreva o tempo de aceleracao em s: ');
            verif;
            If m=TRUE then (motor[a].TmpAcc):=e;
         Until m=TRUE;

         Repeat
            mess('Escreva a tens∆o de estabilidade em V: ');
            verif;
            If m=TRUE then (motor[a].VEst):=e;
            If (motor[a].VEst=0) or (motor[a].VEst>12.8) then Writeln('Tens∆o Inv†lida!')
         Until ((motor[a].VEst)<>0) and ((motor[a].VEst)<=12.8) and (m=TRUE);

         Repeat
            mess('Escreva o tempo do motor na estabilidade em s: ');
            verif;
            If m=TRUE then (motor[a].TmpEst):=e;
         Until m=TRUE;

         Repeat
            mess('Escreva o tempo de desaceleraá∆o em s: ');
            verif;
            If m=TRUE then (motor[a].TmpDes):=e;
         Until m=TRUE;

         Repeat
            Writeln;
            Window(13,17,66,17);Textbackground(DarkGray);Clrscr;
            Window(13,17,13,20);Textbackground(DarkGray);Clrscr;
            Window(14,18,67,21);Textbackground(Blue);Clrscr;
            Textcolor(142);
            Gotoxy(9,2);
            Write('Deseja entrar com mais dados?(S/N):');
            Window(1,25,80,25);TEXTBACKGROUND(White);CLRSCR;
            Gotoxy(6,1);
            Textcolor(132);Write('Digite "Ctrl+E" para sair');
            Textcolor(LightGray);
            b:=readkey;
            b:=UpCase(b);
            Writeln;
            If b in ['S','N',#5] then Writeln
            else begin
                   Writeln('Erro na digitaá∆o...');
                   Sound(50);
                   Delay(400);
                   Nosound;
                 end;
         Until b in ['S','N',#5];

         If b=#5 then Agra;

      Until (a=10) or (b='N');
{**p2e**}

{Inicio da execucao padrao}
{**p3**}
      Delay(300);
      c:=0;
      f:=0;

      {***************** Inicio de Area Grafica ****************}
      initg;      

      Repeat
         c:=c+1;
 
         {Preparacao dos valores para uso}
         g:=Trunc((motor[c].VEst)*10);
         h:=Trunc((motor[c].TmpAcc)*1000);
         i:=Trunc((motor[c].TmpDes)*1000);
         j:=Trunc((motor[c].Atraso)*1000);
         k:=Trunc((motor[c].TmpEst)*1000);

         {Inicio do envio de dados}
         gramot(0,TRUE,'ac');
         Delay(j);
         d:=(h) div (g);
         Repeat
            f:=f+1;
            Delay(d);
            Port[$378]:=f;
            gramot(f,FALSE,'ac');
         Until f=(g);
         Delay(k);
            d:=(i) div (g);
         str(f,s);
         SetColor(White);
         OutTextXY(300,430,s);
            Repeat
               f:=f-1;
               Delay(d);
               Port[$378]:=f;
               gramot(f,FALSE,'des');
            Until f=0;
      Until c=a;
      {Fim do envio de dados}

      SetColor(LightRed);
      SetTextStyle(DefaultFont,HorizDir,1);
      SetTextJustify(CenterText,CenterText);
      OutTextXY((getmaxx div 2),470,'Pressione uma tecla para voltar ao DOS...');
      b:=readkey;

      Closegraph;

      {************************Fim da Area Grafica******************}

      Agra;

{**p3e**}

   End.