#include <iostream>
#include <cmath>
#include <sstream>
//#include <cstring>

bool is_pal(int num);

int main(void) {
  int s1, s2;
  const int st = 100;
  const int en = 1000;
  int lg_sf = -1;

  for(s1 = st; s1 < en; s1++) {
    std::cout << s1;
    for(s2 = st; s2 < en; s2++) {
      int mul = abs(s1*s2);
      std::cout << "s1: " << s1 << " s2: " << s2 << " mul: " << mul << std::endl;
      if((is_pal(mul) == true) && (mul > lg_sf)) {
        lg_sf = mul;
      }
    }
  }

  std::cout << lg_sf << std::endl;

  return 0;
}

bool is_pal(int num) {
  std::stringstream ss;
  ss<<num;
  std::string num_str;
  ss>>num_str;

  int len_st = num_str.length();

  for(int i = 0; i < len_st; i++) {
    if(num_str[i] != num_str[len_st-i-1]) {
      return false;
    }
  }
  return true;
}
