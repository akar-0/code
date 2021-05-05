#include <vector>

using namespace std;

static std::vector<int> chunk(std::vector<int> arr, int step) {
  std::vector<int> a, o;
  a.insert(a.end(),arr.begin(),arr.end());
  if (step<0){
    reverse(a.begin(),a.end());
    step=-step;
  }
  for (unsigned long i=0;i<a.size();i+=step){
    o.push_back(a[i]);
  }
  return o;
}
