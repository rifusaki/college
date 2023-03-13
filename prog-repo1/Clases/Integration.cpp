#include <cmath>
#include <iostream>

using fptr = double(double);

double fnc (double x);
double trape (double a, double b, double n, fptr f);
double simp (double a, double b, double n, fptr f);

int main(int argc, char **argv) {
  std::cout.precision(15); std::cout.setf(std::ios::scientific); // Precisión de imprimir

  const double xmin = std::atof(argv[1]);
  const double xmax = std::atof(argv[2]);
  const double h_in = std::atof(argv[3]);

  const double xsol = - std::cos(xmax) + std::cos(xmin);

  std::cout << xsol << "\n";

  for (double h = 1.0e-1; h >= 1.0e-8; h /= 10.0) { // Promedio con h particion - prueba
    double tsol = simp(xmin, xmax, h, fnc);
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

  for (int i = 1; i < h; i++) {
    double xi = a + i*n;
    res += f(xi);
  }
  res = n*(res+((f(a) + f(b))/2));
  return res;
}

double simp (double a, double b, double n, fptr f) {
  double res = 0.0;
  const int h = std::floor((b-a)/n);
  bool chk = false;

  for (int i = 1; i < h; i++) {
    double xi = a + i*n;
    if (chk == true) {
      res += 2*f(xi);
      chk = false;
    }
    else if (chk == false) {
      res += 4*f(xi);
      chk = true;
    }
  }
  res = n/3*(res+f(a)+f(b));
  return res;
}
