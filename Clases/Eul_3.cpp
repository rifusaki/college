#include <iostream>
#include <cmath>
#include <cassert>

bool is_prime(long long num);
long long largprimdiv(long long nn);

int main(void) {
  const long long num = 600851475147;
  std::cout << "\nDivisor: " << largprimdiv(num) << "\n \n";
  assert(largprimdiv(13) == 13);

  return 0;
}

long long largprimdiv(long long nn) {
  long long res = nn;

  for(long long i = 2; i <= nn/2; i++) {
    if(nn % i == 0) {
      long long lard = nn/i;
      if((is_prime(nn/i))) {
        res = lard;
        break;
      }
    }
  }
  return res;
}

bool is_prime(long long num){
  bool chk = true;
  for(int i = 2; i < sqrt(num)+1; i++){
    if(num % i == 0){
      chk = false;
      break;
    }
  }

  return chk;
}
