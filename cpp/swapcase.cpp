#include <cctype>

char swapcase(char c){
  return islower(c)?toupper(c):tolower(c);
}
