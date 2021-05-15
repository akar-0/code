#include <stdlib.h>
#include <unordered_map>
#include <unordered_set>
#include <algorithm>

using namespace std;
vector<int> shuffleArray(vector<int> a){
  int c=a.size(),b,i;
  while (c){
    i=rand()%c--;
    b=a[c];
    a[c]=a[i];
    a[i]=b;
  }
  return a;
}
