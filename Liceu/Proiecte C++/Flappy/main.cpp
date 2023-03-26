#include <iostream>
#include <windows.h>
#include <conio.h>
#include <ctime>

///Flappy Bird facut de Berry



using namespace std;

const unsigned char perete=219;
const int xd=21 , yd=21;
bool GameO ,stop ,e=1 ;
int xp , yp , xg , yg , xa , ya , sus ,scor;

void SetColor(int x)
{
    SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),x);
}

void SetUp()
{
  srand(time(NULL));
  scor=0;
  stop=0;
  GameO=0;
  e=1;
  xp=xd/2;
  yp=yd/2;
  xg=23;
  yg=(rand()%11)+7;
  xa=35;
  ya=(rand()%11)+7;

}
void Draw()
{
  system("cls");
  SetColor(55);
  for(int x=0;x<=xd;x++)
    cout<<perete;
    cout<<endl;
    for(int y=1 ; y<=yd;y++)
      {
      for(int x=0;x<=xd;x++)
      {
        if(x==0||x==xd)
        {
          SetColor(55);
          cout<<perete;
        }
        else if(xp==x&&yp==y)
        {
          SetColor(14);
          cout<<perete;
        }
        else if (y<(yg-2)&&x>(xg-2)&&x<(xg+2))
        {
          SetColor(2);
          cout<<perete;
        }
         else if (y>(yg+2)&&x>(xg-2)&&x<(xg+2))
          {
          SetColor(2);
          cout<<perete;
          }
           else if (y<(ya-2)&&x>(xa-2)&&x<(xa+2))
          {
          SetColor(2);
          cout<<perete;
          }
         else if (y>(ya+2)&&x>(xa-2)&&x<(xa+2))
          {
          SetColor(2);
          cout<<perete;
          }
          else
            {
          SetColor(9);
          cout<<perete;
            }

      }
      cout<<endl;
      }
        SetColor(55);
       for(int x=0;x<=xd;x++)
          cout<<perete;
          SetColor(7);
      cout<<endl;
      cout<<"Score:"<<scor;
      cout<<endl;

}
void Input()
{

  if(kbhit()&&sus<=1)
  {
    switch (getch())
    {
    case ' ':
      stop=1;
      sus=3;
      break;
     case 'x':
       GameO=1;
        break;
    default:
      break;

    }
    FlushConsoleInputBuffer(GetStdHandle(STD_INPUT_HANDLE));
  }

}
void Mecanica()
{
  if(stop)
  {
  xg--;
  xa--;
  if(xg<0)
  {
    xg=xa;
    yg=ya;
    xa=22;
    ya=(rand()%11)+7;
  }


  if (yp<(yg-2)&&xp>(xg-2)&&xp<(xg+2))
          GameO=1;
  if (yp>(yg+2)&&xp>(xg-2)&&xp<(xg+2))
          GameO=1;
  if (yp<(ya-2)&&xp>(xa-2)&&xp<(xa+2))
          GameO=1;
  if (yp>(ya+2)&&xp>(xa-2)&&xp<(xa+2))
          GameO=1;
  if(yp<=0||yp>=21)
          GameO=1;


  if(xp==(xg+1)||xp==(xa+1))
    scor+=1;




  if(sus>1)
    yp--;
  else if(sus<=0)
    yp++;

    sus--;
  }

}

void GO()
{

    int n=500;
    int i=1;


    while(yp<=20)
    {
        yp++;
        Draw();
        Sleep(n);
        if(n!=3)
        {
        n=n-5*i;
        i=i+2;
        }
        if(n<15)
            n=10;

    }

        cout<<"Game Over! \nPress 'x' to end or any key to start over:";
    FlushConsoleInputBuffer(GetStdHandle(STD_INPUT_HANDLE));
    kbhit();
    if (getch()=='x')
        e=0;


}


int main()
{

while (e)
{
    SetUp();
    while(!GameO)
    {

      Input();
      Mecanica();
      Draw();
      Sleep(130);
    }
    GO();
}
    return 0;
}

