#include <iostream>

bool is_prime(long long num);
long long largprimdiv(long long nn);

int main(void) {
  const long long num = 600851475147;
  std::cout << "\nDivisor: " << largprimdiv(num) << "\n \n";

  return 0;
}

long long largprimdiv(long long nn) {
  bool chk = false;
  int div_sf = -1;

  for(long long i = 2; i < nn; i++) {
    if(nn % i == 0) {
      if((is_prime(nn/i))) {
        div_sf = i;
        chk = true;
        break;
      }
    }
  }
  return nn/div_sf;
}

bool is_prime(long long num){
  bool chk = true;
  for(int i = 2; i < num; i++){
    if(num % i == 0){
      chk = false;
      break;
    }
  }

  return chk;
}
