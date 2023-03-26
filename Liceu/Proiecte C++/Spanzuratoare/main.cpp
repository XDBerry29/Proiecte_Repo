#include <iostream>
 #include <fstream>
 #include <string.h>
 #include <windows.h>
 #include <time.h>
 #include <conio.h>
 #include "morse.h"

using namespace std;

ifstream in("Date.in");
ifstream pin("parola.in");
int inecrcari=3;
const int xdesen=8,ydesen=8;
int vieti=6;
bool GO=0;
bool win=0;
char bara=92;
int dificultate;
char m[50][2000];
char s[50];
char b[50];
char x;
int vocale=0;


bool Password()
{
  char parola[200];
  char parola2[50];


  pin.getline(parola,200);
  decodificator(parola,parola2);

  char pass[50];
  char chr;
  cout<<"Password: ";
  int i=0;

  do{
      chr=getch();
      cout<<'*';
      pass[i]=chr;
      i++;

  }while(pass[i-1]!=13);

  pass[i-1]='\0';

  int loading=10;

  if(!strcmp(pass,parola2))
  {

  cout<<"\nParola a fost buna";
  system("cls");
  cout<<"\n\n";
  cout<<"Loading :";
  while(loading)
  {
      cout<<(unsigned char)219;
      loading--;
      Sleep(600);
  }
  system("cls");
  return 1;
  }else
  {
      cout<<"\nParola incorecta\n";
      return 0;
  }

}
void Citire()
{
    int n;
    in>>n;
    in.get();
    unsigned int i=1;
    int g;
    while(i<=n)
    {
        in.getline(m[i],1000);
        i++;
    }
    g=rand()%n+1;
    decodificator(m[g],b);
    strcpy(s,b);


    for(i=0 ;b[i];i++)
        if(b[i]!=s[0]&&b[i]!=s[strlen(s)-1])
            b[i]='-';
    if(dificultate==3)
    {
         for(i=1 ;i<=strlen(b)-2;i++)
        if(b[i]!=s[0]||b[i]!=s[strlen(s)-1])
            b[i]='-';
    }
    if (dificultate==1)
    {
        for(i=1;s[i];i++)
            if(strchr("aeiou",s[i]))
                vocale++;
    }

}


void Draw()
{

    system("cls");
    for(int y=1;y<=ydesen;y++)
    {
        for(int x=1;x<=xdesen;x++)
    {
        if(x<=6&&x>=4&&y==1)
            cout<<'_';
        else if(x==3&&y>1)
            cout<<'|';
        else if(x==7&&y==2)
            cout<<'|';
        else if(x==2&&y==8)
            cout<<'/';
        else if(x==4&&y==8)
            cout<<bara;
        else if (vieti<=5&&x==7&&y==3)
            cout<<'O';
        else if (vieti<=4&&x==7&&y>=4&&y<=6)
            cout<<'|';
        else if(vieti<=3&&x==6&&y==4)
            cout<<'/';
        else if(vieti<=2&&x==8&&y==4)
            cout<<bara;
        else if(vieti<=1&&x==6&&y==7)
             cout<<'/';
        else if(vieti<=0&&x==8&&y==7)
            cout<<bara;
        else
            cout<<" ";

    }
    cout<<'\n';
    }
    cout<<endl;
    cout<<'\n';
    cout<<b;
    cout<<'\n';
    cout<<'\n';
    cout<<"vieti: "<<vieti;
    cout<<'\n';
    if(dificultate==1&&vocale==1)
    {
        cout<<'\n';
        cout<<"Indiciu: Cuvantul are o vocala";
    }
    else if(dificultate==1)
    {
        cout<<'\n';
        cout<<"Indiciu: Cuvantul are "<<vocale<<" vocale";
    }

}
void Input()
{
    cout<<endl;
    cout<<"Dati o litera : ";
    cin>>x;
}
void Mecanica()
{
    cout<<'\n';
    int OK=0,sema=1;
    x=tolower(x);
    if(!isalpha(x))
    {
        cout<<"Caracterul nu este litera\n";
        OK=1;
        sema=1;
    }
    for(int i=1 ;s[i]&&sema;i++)
        if(s[i]==x&&b[i]==x)
        {
            cout<<"Litera a fost deja data\n";
            sema=0;
            OK=1;
        }
        else if(s[i]==x)
        {
            b[i]=x;
            OK=1;
        }
    if(OK==0)
    {
        cout<<"Ups!!!";
        vieti--;
    }
    if(vieti==0)
        GO=1;
    win=1;
    for(int i=0;b[i];i++)
        if(b[i]=='-')
            win=0;
    cout<<'\n';
    system("pause");
}

int main()
{
    int incercari=4;
    while(incercari)
    if(Password())
    {
    incercari=0;
    cout<<"Alege dificultatea:(1-usor,2-mediu,3-dificit): ";
    cin>>dificultate;
    srand(time(NULL));
    Citire();
    while(!GO&&!win)
    {
        Draw();
        Input();
        Mecanica();
    }
    system("cls");
    Draw();
    cout<<'\n';
    system("pause");


    if(win)
    {
        cout<<"Ai castigat!!!";
        cout<<"\nCuvantul a fost: ";
        cout<<s;
    }
    else
    cout<<"Game Over!";
    cout<<endl;
    }
    else{
        incercari--;
    if (incercari!=0)
        cout<<"\nMai ai "<<incercari<<" incercari\n";
        system("pause");
        system("cls");
    }

    if (incercari==0)
        cout<<"Imi pare rau dar nu te vei putea juca\n";
    system("pause");



  return 0;
}
