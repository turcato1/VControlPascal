program VelContrl;

USES CRT,GRAPH;


{Criaฦo de Vari vel Homognea}

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

{Definiฦo de vari veis}

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
  WINDOW(3,1,77,5);TEXTBACKGROUND(BLUE);TEXTCOLOR(YELLOW);CLRSCR;
  WRITELN('ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
  WRITELN('บ  Velcontrol: Controle de Tensฦo Para Motores DC by Thiago e Reginaldo  บ');
  WRITEln('บ                                                                        บ');
  WRITEln('บ');TEXTCOLOR(WHITE);x:=length('Obrigado por utilizar nosso software!');gotoxy(38-x div 2,4);
  WRITE('Obrigado por usar nosso Software!');
  TEXTCOLOR(YELLOW);gotoxy(74,4);WRITEln('บ');
  WRITE('ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
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
                     Writeln('Valor Inv lido');
                end
else m:=TRUE;
end;


{Inserฦo de mensagens}

{**1**}

Procedure mess (mensagem:String);
begin
TextColor(red);
WRITE(mensagem);TEXTCOLOR(black);
end;

{**1e**}

{Geraฦo do Rodap}

{**2**}

Procedure rodape(a:String;x:integer);
 BEGIN
  clrscr;
  WINDOW(1,1,80,24);TEXTBACKGROUND(Cyan);CLRSCR;
  WINDOW(1,25,80,25);TEXTBACKGROUND(White);CLRSCR;
  TEXTCOLOR(RED);WRITE('  Estado: ');TEXTCOLOR(BLACK);
  WRITE(a,x);
 END;

{**2e**}

{Geraฦo de Rodap}

{**3**}

Procedure cabecalho(frase:integer);
var x:integer;
 begin
  WINDOW(3,1,77,5);TEXTBACKGROUND(BLUE);TEXTCOLOR(YELLOW);CLRSCR;
  WRITELN('ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
  WRITELN('บ     Velcontrol Controle de Tensฦo Para Motores DC by SysSoft S/A.      บ');
  WRITEln('บ                                                                        บ');
  WRITEln('บ');TEXTCOLOR(WHITE);x:=length('Processamento de dados (E/S) da tabela :');gotoxy(38-x div 2,4);
  WRITE('Processamento de dados (E/S) da tabela ',frase);
  TEXTCOLOR(YELLOW);gotoxy(74,4);WRITEln('บ');
  WRITE('ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
 end;

{**3e**}

{Geraฦo do Quadro de Valores}

{**4**}

procedure quadro;
 begin
  WINDOW(10,7,70,23);TEXTBACKGROUND(BLUE);CLRSCR;
  WINDOW(11,8,69,22);TEXTBACKGROUND(LIGHTGRAY);CLRSCR;
  Window(12,8,68,21);Textbackground(Lightgray);Clrscr;
 end;

{**4e**}

{Grafico de entrada}

{**g1**}

Procedure Graent;

Var
   a:char;
   b,c,d,e,f,g:integer;

Begin
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
 OutTextXY(d, (c-360), 'Divisao de Automaao por Software da SysAuto do Brasil S/A');
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


{Inicializaฦo gr fica}

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
OutTextXY((getmaxx div 2),30,'Monitoraao do Motor');
SetColor(White);
f:=Trunc(1/(0.01));
Delay(f);
Arc(c, d, 200, 255, a);
Arc(c, d, 20, 75, a);
until a=80;
end;

label st;

Begin

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
OutTextXY(c,410,'Valoraฦo Atual');
SetTextJustify(RightText,CenterText);
OutTextXY((c+50),440,'Tensฦo no Motor (x0.1V):   ');
st: If n='ac' then str((i-1),s) else str((i+1),s);
    SetColor(White);
    OutTextXY((c+50),440,s);
    str(i,s);
    SetColor(LightRed);
    OutTextXY((c+50),440,s);
End;

{**g2e**}







{******************************Inกcio do Programa**************************}







Begin

initg;
Graent;
Delay(80);

{Zeramento da vari vel heterognea}

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
         mess('Escreva o tempo de aceleraฦo em s: ');
         verif;
         If m=TRUE then (motor[a].TmpAcc):=e;
         Until m=TRUE;

         Repeat
         mess('Escreva a tensฦo de estabilidade em V: ');
         verif;
         If m=TRUE then (motor[a].VEst):=e;
         If (motor[a].VEst=0) or (motor[a].VEst>12.8) then Writeln('Tensฦo Inv lida!')
         Until ((motor[a].VEst)<>0) and ((motor[a].VEst)<=12.8) and (m=TRUE);


         Repeat
         mess('Escreva o tempo do motor na estabilidade em s: ');
         verif;
         If m=TRUE then (motor[a].TmpEst):=e;
         Until m=TRUE;

         Repeat
         mess('Escreva o tempo de desaceleraฦo em s: ');
         verif;
         If m=TRUE then (motor[a].TmpDes):=e;
         Until m=TRUE;


        repeat

         Writeln;
         Window(13,17,66,17);Textbackground(DarkGray);Clrscr;
         Window(13,17,13,20);Textbackground(DarkGray);Clrscr;
         Window(14,18,67,21);Textbackground(Blue);Clrscr;
         TextColor(142);
         Gotoxy(9,2);
         Write('Deseja entrar com mais dados?(S/N):');
         WINDOW(1,25,80,25);TEXTBACKGROUND(White);CLRSCR;
         Gotoxy(6,1);
         TEXTCOLOR(132);WRITE('Digite "Ctrl+E" para sair');
         TextColor(LightGray);
         b:=readkey;
         b:=UpCase(b);
         Writeln;
         If b in ['S','N',#5] then writeln
         else begin
                   Writeln('Erro na digitaฦo...');
                   Sound(50);
                   Delay(400);
                   Nosound;
              end;
        until b in ['S','N',#5];
    If b=#5 then Agra;
    Until (a=10) or (b='N');

{**p2e**}



{Inicio da execuฦo padrฦo}

{**p3**}



Delay(300);
c:=0;
f:=0;
initg;      {***************** Inicio de Area Gr fica ****************}

   Repeat
         c:=c+1;

   {Preparaฦo dos valores para uso}

         g:=Trunc((motor[c].VEst)*10);
         h:=Trunc((motor[c].TmpAcc)*1000);
         i:=Trunc((motor[c].TmpDes)*1000);
         j:=Trunc((motor[c].Atraso)*1000);
         k:=Trunc((motor[c].TmpEst)*1000);

         {Inกcio do envio de dados}
            gramot(0,TRUE,'ac');
            Delay(j);
            d:=(h) div (g);
                     repeat
                           f:=f+1;
                           Delay(d);
                           Port[$378]:=f;
                           gramot(f,FALSE,'ac');
                           until f=(g);
            Delay(k);
            d:=(i) div (g);
            str(f,s);
            SetColor(White);
            OutTextXY(300,430,s);
                     repeat
                           f:=f-1;
                           Delay(d);
                           Port[$378]:=f;
                           gramot(f,FALSE,'des');
                     until f=0;
   Until c=a;
         {Fim do envio de dados}

SetColor(LightRed);
SetTextStyle(DefaultFont,HorizDir,1);
SetTextJustify(CenterText,CenterText);
OutTextXY((getmaxx div 2),470,'Pressione uma tecla para voltar ao DOS...');
b:=readkey;


Closegraph;

       {************************Fim da Area Gr fica******************}

Agra;


{**p3e**}

End.


