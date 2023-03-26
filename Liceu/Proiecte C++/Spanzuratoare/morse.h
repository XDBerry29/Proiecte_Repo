#include <strings.h>
char a1[]="10111\0";
char b1[]="111010101\0";
char c1[]="11101011101\0";
char d1[]="1110101\0";
char e1[]="1\0";
char f1[]="101011101\0";
char g1[]="111011101\0";
char h1[]="1010101\0";
char i1[]="101\0";
char j1[]="1011101110111\0";
char m1[]="1110111\0";
char n1[]="11101\0";
char o1[]="11101110111\0";
char k1[]="111010111\0";
char l1[]="101110101\0";
char p1[]="10111011101\0";
char q1[]="1110111010111\0";
char r1[]="1011101\0";
char s1[]="10101\0";
char t1[]="111\0";
char u1[]="1010111\0";
char v1[]="101010111\0";
char w1[]="101110111\0";
char x1[]="11101010111\0";
char y1[]="1110101110111\0";
char z1[]="11101110101\0";


void decodificator(char cuvant[],char cdecodificat[])
{
    int jj;
    int kk=0;
    int mm=0;
    char aux2[20000];

    for(int ii=0;cuvant[ii];ii++)
    {
        char aux[20000];
        if(cuvant[ii+1]+cuvant[ii+2]+cuvant[ii+3]==144||cuvant[ii+1]=='\0')
        {
            for(jj=mm;jj<=ii;jj++)
                aux[jj-mm]=cuvant[jj];
            aux[jj-mm+1]='\0';
            mm=ii+4;
            if(!strcmp(aux,a1))
            {
                cdecodificat[kk]='a';
                kk++;
            }
            else if(!strcmp(aux,b1))
            {
                cdecodificat[kk]='b';
                kk++;
            }
            else if(!strcmp(aux,c1))
            {
                cdecodificat[kk]='c';
                kk++;
            }
            else if(!strcmp(aux,d1))
            {
                cdecodificat[kk]='d';
                kk++;
            }
            else if(!strcmp(aux,e1))
            {
                cdecodificat[kk]='e';
                kk++;
            }
            else if(!strcmp(aux,f1))
            {
                cdecodificat[kk]='f';
                kk++;
            }
            else if(!strcmp(aux,g1))
            {
                cdecodificat[kk]='g';
                kk++;
            }
            else if(!strcmp(aux,h1))
            {
                cdecodificat[kk]='h';
                kk++;
            }
            else if(!strcmp(aux,i1))
            {
                cdecodificat[kk]='i';
                kk++;
            }
            else if(!strcmp(aux,j1))
            {
                cdecodificat[kk]='j';
                kk++;
            }
            else if(!strcmp(aux,k1))
            {
                cdecodificat[kk]='k';
                kk++;
            }
            else if(!strcmp(aux,l1))
            {
                cdecodificat[kk]='l';
                kk++;
            }
            else if(!strcmp(aux,m1))
            {
                cdecodificat[kk]='m';
                kk++;
            }
            else if(!strcmp(aux,n1))
            {
                cdecodificat[kk]='n';
                kk++;
            }
             else if(!strcmp(aux,o1))
            {
                cdecodificat[kk]='o';
                kk++;
            }
             else if(!strcmp(aux,p1))
            {
                cdecodificat[kk]='p';
                kk++;
            }
             else if(!strcmp(aux,q1))
            {
                cdecodificat[kk]='q';
                kk++;
            }
             else if(!strcmp(aux,r1))
            {
                cdecodificat[kk]='r';
                kk++;
            }
             else if(!strcmp(aux,s1))
            {
                cdecodificat[kk]='s';
                kk++;
            }
             else if(!strcmp(aux,t1))
            {
                cdecodificat[kk]='t';
                kk++;
            }
             else if(!strcmp(aux,u1))
            {
                cdecodificat[kk]='u';
                kk++;
            }
             else if(!strcmp(aux,v1))
            {
                cdecodificat[kk]='v';
                kk++;
            }
             else if(!strcmp(aux,w1))
            {
                cdecodificat[kk]='w';
                kk++;
            }
             else if(!strcmp(aux,x1))
            {
                cdecodificat[kk]='x';
                kk++;
            }
             else if(!strcmp(aux,y1))
            {
                cdecodificat[kk]='y';
                kk++;
            }
             else if(!strcmp(aux,z1))
            {
                cdecodificat[kk]='z';
                kk++;
            }

            memmove(aux,aux2,20000);

        }

    }
    cdecodificat[kk]='\0';
}
