#include <stdbool.h>

bool is_prime(int n)
{
  if (n<2){return false;}
  if (n==2 || n==3 || n==5 || n==7){return true;}
  if (!(n%2)||!(n%3)||!(n%5)){return false;}
  int c[8]={4, 2, 4, 2, 4, 6, 2, 6};
  long p=7, i=0;
  while (p*p<=n){
    if ((n%p)==0){return false;}
    p += c[i];
    i = (i+1)%8;
  }
 return true;
}


int nextPrime(int n){
  if (n<2) {return 2;}
  if (n%2==0){n++;}
  else {n+=2;}
  while (1){
    if (is_prime(n)) {return n;}
    n+=2;
  }
}



//A retoucher (renvoie une string (p1**i1)...)
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

char* factors(int n) {
  char* o=calloc(2000,sizeof(char));
  int p=3, f=0, s=sqrt(n);
    while (!(n%2)){
      f++;
      n/=2;
    }
    if (f==1){
      char* tmp=calloc(4,sizeof(char));
      sprintf(tmp,"(2)");
      strcat(o,tmp);
    }
    else if (f) {
      char* tmp=calloc(100,sizeof(char));
      sprintf(tmp,"(2**%d)",f);
      strcat(o,tmp);
    }
  while (p*p<=n){
    f=0;
    while (!(n%p)){
      f++;
      n/=p;
    }
    if (f){
      char* tmp=calloc(100,sizeof(char));
      if (f==1){
        sprintf(tmp,"(%d)",p);
        strcat(o,tmp);
      }
      else {
        sprintf(tmp,"(%d**%d)",p,f);
        strcat(o,tmp);
      }
    }
    p+=2;
  }
  if (n!=1){
   char* tmp=calloc(100,sizeof(char));
   sprintf(tmp,"(%d)",n);
   strcat(o,tmp);
  }
  o[strlen(o)]='\0';
  return o;
}
