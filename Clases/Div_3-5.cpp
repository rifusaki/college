#include <iostream>

int main(void) {
  int sum = 0;
  for(int n = 1; n < 1001; n++) {
    if ((n%3 == 0) || (n%5 == 0)) {
      sum += n;
    }
  }
  std::cout << sum << "\n";

  return 0;
}
