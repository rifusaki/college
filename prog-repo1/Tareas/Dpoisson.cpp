#include <iostream>
#include <vector>
#include <cmath>

// constants
const double DELTA = 0.05;
const double Ly = 1.479;
const double Lx = Ly*1.4;
const int Nx = int(Lx/DELTA)+1;
const int Ny = int(Ly/DELTA)+1;
const int STEPS = 200;
const double x1 = int((Nx-1)/3);
const double x2 = int(2*(Nx-1)/3);
const double lon = int((5/12)*Nx);
const double y  = int((Ny-1)/4); //Cambiar por valor generalizado (era 4)

typedef std::vector<double> Matrix; // alias

void initial_conditions(Matrix & m);
void boundary_conditions(Matrix & m);
void evolve(Matrix & m);
void print(const Matrix & m);
void init_gnuplot(void);
void plot_gnuplot(const Matrix & m);

int main(void)
{
  Matrix data(Nx*Ny);
  initial_conditions(data);
  boundary_conditions(data);

  init_gnuplot();
  for (int istep = 0; istep < STEPS; ++istep) {
    evolve(data);
    plot_gnuplot(data);
  }

  return 0;
}
void initial_conditions(Matrix & m)
{
  for(int ii=0; ii<Nx; ++ii) {
    for(int jj=0; jj<Ny; ++jj) {
      m[ii*Ny + jj] = 1.0;
    }
  }
}
void boundary_conditions(Matrix & m)
{
  int ii = 0, jj = 0;

  ii = 0;
  for (jj = 0; jj < Ny; ++jj)
    m[ii*Ny + jj] = 100;

  ii = Nx-1;
  for (jj = 0; jj < Ny; ++jj)
    m[ii*Ny + jj] = 0;

  jj = 0;
  for (ii = 1; ii < Nx-1; ++ii)
    m[ii*Ny + jj] = 0;

  jj = Ny-1;
  for (ii = 1; ii < Nx-1; ++ii)
    m[ii*Ny + jj] = 0;

  ii=x1;
  for(jj = y; jj <= 3*y; ++jj)
      m[ii*Ny + jj]=75;

  ii=x2;
  for(jj = y; jj <= 3*y; ++jj)
      m[ii*Ny + jj]=-75;

}

void evolve(Matrix & m)
{
  for(int ii=0; ii<Nx; ++ii) {
    for(int jj=0; jj<Ny; ++jj) {
      // check if boundary
      if(ii == 0) continue;
      if(ii == Nx-1) continue;
      if(jj == 0) continue;
      if(jj == Nx-1) continue;
      if((ii==x1)&&(jj>=y)&&(jj<=3*y)) continue;
      if((ii==x2)&&(jj>=y)&&(jj<=3*y)) continue;
      // evolve non boundary
      m[ii*Ny+jj] = (m[(ii+1)*Ny + jj] +
                    m[(ii-1)*Ny + jj] +
                    m[ii*Ny + jj + 1] +
                    m[ii*Ny + jj - 1] )/4.0;
    }
  }
}

void print(const Matrix & m)
{
  for(int ii=0; ii<Nx; ++ii) {
    for(int jj=0; jj<Ny; ++jj) {
      std::cout << ii*DELTA << " " << jj*DELTA << " " <<  m[ii*Ny + jj] << "\n";
    }
    std::cout << "\n";
  }
}

void init_gnuplot(void)
{
  std::cout << "set contour " << std::endl;
  std::cout << "set terminal gif animate " << std::endl;
  std::cout << "set out 'anim.gif' " << std::endl;
}

void plot_gnuplot(const Matrix & m)
{
  std::cout << "splot '-' w pm3d " << std::endl;
  print(m);
  std::cout << "e" << std::endl;
}
