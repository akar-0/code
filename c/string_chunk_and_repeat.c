
// https://www.codewars.com/kata/5491689aff74b9b292000334/solutions/c

#include <stddef.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

char* chunk_and_repeat(const char* s, size_t i, size_t l, size_t r){
  char* o=calloc(l*r+1,sizeof(char));
  char* tmp=calloc(l+1,sizeof(char));
  for (size_t j=0;j<l;j++){
    tmp[j]=s[i+j];
  }
  tmp[l]='\0';
  for (size_t i=0;i<r;i++){
    strcat(o,tmp);
  }
  free(tmp);
  return o;
}
