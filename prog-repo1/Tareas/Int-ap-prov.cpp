#include <cmath>
#include <iostream>
#include <math.h>
#include <list>

using fptr = double(double);

double f_x (double x);
double f_y (double x);
double trape (double a, double b, double n, fptr f);
double simp (double a, double b, double n, fptr f);


int main(void) {
  std::cout.precision(15); std::cout.setf(std::ios::scientific);

  const double x_mov = 4.0;
  const double y_mov = 0;

  const double v_x_sol = (2)*std::sqrt((std::sin(x_mov)-x_mov*std::cos(x_mov))/1.25);
  const double v_y_sol = (2)*std::sqrt(((-24)*y_mov)/1.25);
  const double v_sol = std::sqrt(std::pow(v_x_sol, 2) + std::pow(v_y_sol, 2));

  std::cout << "\n  Solución exacta: "<< v_sol << "\n \n \n";
  std::cout << "n \t \t \t" << "Trapezoide \t \t " << "Simpson \n \n";

  std::list<double> inter = {10, 1000};
  for (const auto& h : inter) {
    double x_t = (2)*std::sqrt(trape(0, x_mov, h, f_x)/1.25);
    double x_s = (2)*std::sqrt(simp(0, x_mov, h, f_x)/1.25);
    double y_t = (2)*std::sqrt(trape(0, y_mov, h, f_y)/1.25);
    double y_s = (2)*std::sqrt(simp(0, y_mov, h, f_y)/1.25);

    double v_t = std::sqrt((std::pow(x_t, 2)+std::pow(y_t,2)));
    double v_s = std::sqrt((std::pow(x_s, 2)+std::pow(y_s,2)));

    std::cout << (int)h << "\t \t" << v_t << "\t" <<
                              v_s <<"\t   (valor resultante) \n";
    std::cout  << "\t \t" << std::fabs(1-std::fabs((v_t/v_sol))) << "% \t" <<
                              std::fabs(1-std::fabs((v_s/v_sol))) <<"%     (diferencia porcentual abs)\n\n";

  }
  std::cout << "\n";
  return 0;
}

double f_x (double x) {
  return (x*std::sin(x));
}

double f_y (double x) {
  return x*(-24/1.25);
}

double trape (double a, double b, double prov, fptr f) { // n es intervalos
  double res = 0.0;
  double n = 1/prov;
  const int h = std::floor((b-a)/n);

  for (int i = 1; i < h; i++) {
    double xi = a + i*n;
    res += f(xi);
  }
  res = n*(res+((f(a) + f(b))/2));
  return res;
}

double simp (double a, double b, double prov, fptr f) {
  double n = 1/prov;
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
