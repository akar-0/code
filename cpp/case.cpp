#include <string>
#include <ctype.h>
#include <algorithm>

using namespace std;
string u(string s){
  transform(s.begin(), s.end(),s.begin(), ::toupper);
  return s;
}
string l(string s){
  transform(s.begin(), s.end(),s.begin(), ::tolower);
    return s;
}
