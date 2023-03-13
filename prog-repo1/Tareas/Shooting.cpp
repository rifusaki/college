#include <iostream>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <boost/numeric/odeint.hpp>

// constants
const double X0 = 0;
const double XF = M_PI/2;
const double DX = 0.01;
const double phif = 0.0;

typedef std::vector<double> state_t; // alias for state type

void print(const state_t & y, double time);
template <class fptr>
double newton(double x0, fptr fun, double eps, int & niter);

struct Fderiv {
  double E_ = 0; //internal parameter
  void operator()(const state_t & y, state_t & dydt, double t) { //external interface, is a function
    // vector is : y = (y0, y1) = (phi, z), z = dphi/dx
    dydt[0] = y[1];
    dydt[1] = -E_*y[0];
  }
};


int main(int argc, char **argv)
{
  const int N = 2;

  const double E0 = atof(argv[1]);
  const double phi0 = atof(argv[2]);
  const double phidot0 = atof(argv[3]);

  state_t y(N); // (phi, z)

  // create lambda function: receives one arg (E) and return the final phi value minus the expected one.
  auto faux = [&y, phi0, phidot0](double E){
    y[0] = phi0; y[1] = phidot0;
    Fderiv j; j.E_ = E; // declare functor and assing internal var E  to lambda argument
    boost::numeric::odeint::integrate(j, y, X0, XF, DX);
    return y[0] - phif;
  };

  // perform a Newton-Raphson procedure to find the root
  // compute numerically the derivative
  int nsteps = 0;
  double Et  = newton(E0, faux, 0.001, nsteps); // Energía

  // print final data
  y[0] = phi0; y[1] = phidot0; // Volver a condiciones iniciales
  Fderiv k; k.E_ = Et; // Creando un Fderiv para integrar finalmente
  boost::numeric::odeint::integrate(k, y, X0, XF, DX, print);

  std::cerr << Et << "\n";

  return 0;
}

void print(const state_t & y, double time)
{
  std::cout << time << "\t" << y[0] << "\t" << y[1] << std::endl;
}

// xi+1 = xi - f(xi)/f'(xi) - Vamos, Newton normalito pero con precisión de 1e-6
template <class fptr>
double newton(double x0, fptr fun, double eps, int & niter) {
  double h = 0.000001;
  double xr = x0;
  int iter = 1;
  while(std::fabs(fun(xr)) > eps) {
    double fderiv =  (fun(xr+h/2) - fun(xr-h/2))/h;
    xr = xr - fun(xr)/fderiv;
    iter++;
  }
  niter = iter;
  return xr;
}
