// https://www.codewars.com/kata/5259acb16021e9d8a60010af/solutions/c

#include <stdarg.h>


  va_list ap;
  va_start(ap,n);

  for (TYPE i=1;i<=n;i++){
    TYPE a=va_arg(ap,TYPE);
  }
