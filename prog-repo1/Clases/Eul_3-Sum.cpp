#include <iostream>
#include <cmath>
#include <cstdlib>

bool is_prime(long long num);
long long largprimdiv(long long nn);
long long sumprim(long long nn);

int main(int argc, char **argv) {
  //const long long num = 600851475147;
  //const long long num = 210000;
  const long long num = std::atoll(argv[1]);
  std::cout << num;
  std::cout << "\nDivisor: " << largprimdiv(num) << "\n \n";
  std::cout << "\nSuma divisores: " << sumprim(num) << "\n \n";

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
  for(int i = 2; i < sqrt(num); i++){
    if(num % i == 0){
      chk = false;
      break;
    }
  }

  return chk;
}

long long sumprim(long long nn){
  long long sum = 0;

  for(long long i =2; i<=nn; i++){
    if(nn%i==0 && is_prime(i)) {
      sum += i;
    }
  }

  return sum;
}
