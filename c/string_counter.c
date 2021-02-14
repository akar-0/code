//https://www.codewars.com/kata/58693136b98de0e4910001ab/solutions/c
//https://www.codewars.com/kata/58ae6ae22c3aaafc58000079/solutions/c
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

bool permute_a_palindrome(const char *s) {
  int n, count[26]={-1}, i=0,c,l=strlen(s);
  if (l==1){return true;}
  bool flag=false;
  while (s[i]!='\0'){
    n = s[i] - 'a';
    if (count[n]==-1){count[n]=1;}
    else {count[n]++;}
    i++;
  }
  for (i=0;i<26;i++){
    c=count[i];
    if (c>0&&c%2){
      if (flag){return false;}
      else {flag=true;}
    }
  }
 return true;
}
