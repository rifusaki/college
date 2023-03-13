#include <iostream>

int main(void) {
  bool chk = false;
  long int num = 600851475147;
  int div_sf = 0;

  for(int i = 2; chk == false; i++) {
    if(num % i == 0) {
      div_sf = i;
      chk = true;
    }
  }

  std::cout << "\n \n Mayor divisor: " << num/div_sf << "\n \n";

  return 0;
}
