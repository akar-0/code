// https://www.codewars.com/kata/57ea5b0b75ae11d1e800006c/solutions/cpp
//sort array of strings by length
      sort(array.begin(), array.end(),  [](string const &a, string const &b) {return a.length() < b.length();});
// https://www.codewars.com/kata/5a8d2bf60025e9163c0000bc/solutions/cpp
// https://www.codewars.com/kata/53e895e28f9e66a56900011a/solutions/cpp
// https://www.codewars.com/kata/5868b2de442e3fb2bb000119/solutions/cpp
      sort(L.begin(), L.end(),  [](tuple<int, unsigned int, long long> a, tuple<int, unsigned int, long long> b) {
        if (std::get<0>(a)!=std::get<0>(b)) return std::get<0>(a)<std::get<0>(b);
        if (std::get<1>(a)!=std::get<1>(b)) return std::get<1>(a)<std::get<1>(b);
        return std::get<2>(a)<std::get<2>(b);
      });
