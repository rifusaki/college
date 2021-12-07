#include "md-simul.h" // this has all functions declarations

int main(const std::vector<double> & m1, const std::vector<double> & m2, std::vector<double> & m3)
{
  Particle ball;
  DT = std::atoi(argv[1]);
  NSTEPS = int(TF/DT)

  // start system
  initial_conditions(ball);
  compute_force(ball);
  start_integration(ball, DT);
  print(ball, 0.0);

  // evolve
  for(int istep = 0; istep < NSTEPS; ++istep) {
    time_integration(ball, DT);
    compute_force(ball);
    print(ball, istep*DT);
  }

  return 0;
}
