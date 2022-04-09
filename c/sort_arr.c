// https://www.codewars.com/kata/5f55ecd770692e001484af7d/solutions/c
// https://www.codewars.com/kata/550498447451fbbd7600041c/solutions
// !!!! https://www.codewars.com/kata/5629db57620258aa9d000014/solutions/c
//!!!!   https://www.codewars.com/kata/58e0cb3634a3027180000040/solutions/c
// !!!!!!!! https://www.codewars.com/kata/536c6b8749aa8b3c2600029a/solutions/c
// https://www.codewars.com/kata/59fa8e2646d8433ee200003f/solutions/c


#include <stdlib.h>

int cmp_ch(char *p, char *q)
{
  return *p - *q;
} //??????????


int cmp_chr(const void *a, const void *b) {
  return *(char*)a - *(char*)b;
}

int comp(const void * a, const void * b) {
   return (*(int*)a - *(int*)b);
}
int cmp_ints_ascending (const void *a_, const void *b_)
{
  int a = *((int *)a_), b = *((int *)b_);
  return (a > b) - (a < b);
}

cmp(*p, *q) 
{ 
  return *q - *p;
}

  qsort(array, size_arr, sizeof(int), comp);
