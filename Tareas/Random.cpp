#include <iostream>
#include <cmath>
#include <vector>

typedef std::vector<int> Matriz; // este?

int random_generator (double x, double a, double c, double m);
void print (Matriz &trip);


int main(){
  const double X0 = 1.0;
  const double A = 1664525.0;
  const double C = 1013904223.0;
  const long double M = 4294967296.0;

  Matriz Tripleta(1000*3);
  Tripleta[0] = random_generator(X0, A, C, M);
  std::cout << Tripleta[0] << "\n";
  for (int ii = 0; ii < 1000; ++ii){
    for (int jj = 0; jj < 3; ++jj){
      Tripleta[ii*3 + jj] = random_generator(Tripleta[ii*3 + jj], A, C, M);
    }
  }
  //print(Tripleta);
}

double random_generator (double x, double a, double c, double m){
  return ((a*x + c)%m)/(m-1);
}

void print (Matriz &trip){
  for (int ii = 0; ii < 1000; ++ii){
    for (int jj = 0; jj< 3; ++jj){
      std::cout << trip[ii*3 + jj] <<' ';
    }
    std::cout << '\n';
  }
}
