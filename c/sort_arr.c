// https://www.codewars.com/kata/5f55ecd770692e001484af7d/solutions/c
// https://www.codewars.com/kata/550498447451fbbd7600041c/solutions
// !!!! https://www.codewars.com/kata/5629db57620258aa9d000014/solutions/c
//!!!!   https://www.codewars.com/kata/58e0cb3634a3027180000040/solutions/c
// https://www.codewars.com/kata/5f885fa9f130ea00207c7dc8/train/javascript

def loneliest(s):
    s = s.strip()
    ind = {i:c for (i,c) in enumerate(s) if c.isalpha()}
    d = {}
    L = [-1]+ sorted(ind)+[max(ind)+1]
    for n in range(1,len(L)-1):
        if L[n+1]-L[n-1]-1 in d:
            d[L[n+1]-L[n-1]-1].append(ind[L[n]])
        else:
            d[L[n+1]-L[n-1]-1] = [ind[L[n]]]
    else:
        return d[max(d)] 
        
          
#include <stdlib.h>

int cmp_ch(char *p, char *q)
{
  return *p - *q;
}

int comp(const void * a, const void * b) {
   return (*(int*)a - *(int*)b);
}


cmp(*p, *q) 
{ 
  return *q - *p;
}

  qsort(array, size_arr, sizeof(int), comp);
