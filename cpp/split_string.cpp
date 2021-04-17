//See also https://www.codewars.com/kata/554b4ac871d6813a03000035/solutions
// https://stackoverflow.com/questions/20755140/split-string-by-a-character 
// https://www.codewars.com/kata/57eb8fcdf670e99d9b000272/solutions/cpp
//https://stackoverflow.com/questions/14265581/parse-split-a-string-in-c-using-string-delimiter-standard-c
//https://www.codewars.com/kata/58e24788e24ddee28e000053/solutions/cpp
#include <string>

using namespace std;
std::vector<std::string> split(const std::string& s, const std::string& sep=" ")
{
    std::vector<std::string> tokens;
    size_t a = 0, b = 0;
    while (b < s.length() && a < s.length()) {
        b = s.find(sep, a);
        if (b == std::string::npos) b = s.length();
        std::string token = s.substr(a, b-a);
        if (!token.empty()) tokens.push_back(token);
        a = b + sep.length();
      }
    return tokens;
}
