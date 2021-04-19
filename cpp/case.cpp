#include <string>
#include <ctype.h>
#include <algorithm>

using namespace std;

static string u(string s){return transform(s.begin(), s.end(),s.begin(), ::toupper);}
static string l(string s){return transform(s.begin(), s.end(),s.begin(), ::tolower);}
