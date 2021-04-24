#include <string>
#include <vector>
#include <sstream>

using namespace std;
std::string join(std::vector<std::string> v, std::string sep) {
  int l=v.size(),i;
  if (l==1) {return v[0];}
  stringstream ss;
  for (i=0;i<l;i++) {
    ss<<v[i];
    if (i!=l-1) {ss<<sep;}
  }
  return ss.str();
}
