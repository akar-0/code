//See also https://www.codewars.com/kata/554b4ac871d6813a03000035/solutions
// https://stackoverflow.com/questions/20755140/split-string-by-a-character 
// https://www.codewars.com/kata/57eb8fcdf670e99d9b000272/solutions/cpp
//https://stackoverflow.com/questions/14265581/parse-split-a-string-in-c-using-string-delimiter-standard-c
//https://www.codewars.com/kata/58e24788e24ddee28e000053/solutions/cpp
std::vector<std::string> split(const std::string& str, const std::string& delim)
{
    std::vector<std::string> tokens;
    size_t prev = 0, pos = 0;
    while (pos < str.length() && prev < str.length()) {
        pos = str.find(delim, prev);
        if (pos == std::string::npos) pos = str.length();
        std::string token = str.substr(prev, pos-prev);
        if (!token.empty()) tokens.push_back(token);
        prev = pos + delim.length();
      }
    return tokens;
}
