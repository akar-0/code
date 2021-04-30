int min(int* a, size_t l) {
  int m=a[0];
  for (size_t i=1;i<l;i++) m=a[i]<m?a[i]:m;
  return m;
}
