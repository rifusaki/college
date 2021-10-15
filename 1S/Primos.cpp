#include <iostream>
#include <cmath>

bool print_primes(int num, int lim);

int main(void) {
  int cter = 1;
  for(int x = 2; x < 101; x++){
    if(print_primes(x,cter) == false){
      std::cout << x << "\n";
    }
    cter++;
  }
  return 0;
}

bool print_primes(int num, int lim){
  bool chk = false;
  bool lpck = true;
  while(lpck == true){
    for(int i = 2; i < lim; i++){
      if(num % i == 0){
        chk = true;
      }
      else {
        continue;
      }
    }
    lpck = false;
  }
  if(chk == true){
    return true;
  }
  else {
    return false;
  }
}
