// https://www.codewars.com/kata/5259acb16021e9d8a60010af/solutions/c
// https://www.codewars.com/kata/55de6173a8fbe814ee000061/solutions/c

#include <stdarg.h>


  va_list ap;
  va_start(ap,n);

  for (TYPE i=1;i<=n;i++){
    TYPE a=va_arg(ap,TYPE);
  }
