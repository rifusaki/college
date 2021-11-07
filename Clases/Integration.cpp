#include <cmath>
#include <iostream>

using fptr = double(double);

double fnc (double x);
double trape (double a, double b, double n, fptr f);

int main(int argc, char **argv) {
  std::cout.precision(15); std::cout.setf(std::ios::scientific); // Precisión de imprimir

  const double xmin = std::atof(argv[1]);
  const double xmax = std::atof(argv[2]);
  const double h_in = std::atof(argv[3]);

  const double xsol = std::cos(xmax) - std::cos(xmin);

  std::cout << xsol << "\n";

  for (double h = 1.0e-1; h >= 1.0e-8; h /= 10.0) { // Promedio con h particion - prueba
    double tsol = trape(xmin, xmax, h, fnc);
    std::cout << h << "\t" << tsol << "\t" << std::fabs(1-std::fabs((tsol/xsol))) << "\n";
  }
  return 0;
}

double fnc (double x) {
  return std::sin(x);
}

double trape (double a, double b, double n, fptr f) {
  double res = 0.0;
  const int h = std::floor((b-a)/n);

  for(int i = 1; i < h; i++) {
    double xi = a + i*n;
    res += f(xi);
  }
  res = n*(res+0.5*(f(a) + f(b)));
  return res;
}
