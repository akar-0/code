// https://www.codewars.com/kata/5f55ecd770692e001484af7d/solutions/c
// https://www.codewars.com/kata/550498447451fbbd7600041c/solutions
int comp(const void * a, const void * b) {
   return (*(int*)a - *(int*)b);
}

  qsort(array, size_arr, sizeof(int), comp);
