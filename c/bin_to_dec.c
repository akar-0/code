#include <stdlib.h>
#include <string.h>
#include <stdio.h>

char* bin(unsigned int k)
{
   char *b;
   b = calloc(65, sizeof(char));
   int i=0; 
   while (k){
      b[i++]=(k&1)+'0';
      k>>=1;
   }
  b[i]='\0';
  int l=strlen(b);
  for (i=0;i<l>>1;i++){
    char tmp=b[i];
    b[i]=b[l-i-1];
    b[l-i-1]=tmp;
  }
  return b;
}
