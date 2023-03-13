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

  const double v_x_sol = (2)*(std::sin(x_mov)-x_mov*std::cos(x_mov))-
                          (2*std::sin(0)-2*0*std::cos(0));
  const double v_y_sol = (-24)*y_mov;
  const double v_sol = std::sqrt(std::sqrt((std::pow(v_x_sol, 2) + std::pow(v_y_sol, 2))/1.25));

  std::cout << v_sol << "\n \n";

  std::list<double> inter = {1, 10000};
  for (const auto& h : inter) {
    double x_t = trape(0, x_mov, h, f_x);
    double x_s = simp(0, x_mov, h, f_x);
    double y_t = trape(0, y_mov, h, f_y);
    double y_s = simp(0, y_mov, h, f_y);

    double v_t = std::sqrt((std::pow(x_t, 2)+std::pow(y_t,2))/1.25);
    double v_s = std::sqrt((std::pow(x_s, 2)+std::pow(y_s,2))/1.25);

    std::cout << h << "\t" << 1-std::fabs((v_t/v_sol)) << "\t" <<
                              1-std::fabs((v_s/v_sol)) <<"\n";


  }

  return 0;
}

double f_x (double x) {
  return (2*x*std::sin(x));
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
