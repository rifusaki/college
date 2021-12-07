#include "md-simul.h" // this has all functions declarations

int main(int argc, char **argv)
{
  Particle ball;
  double DT = std::atof(argv[1]);
  int NSTEPS = int(TF/DT);
  std::cout << NSTEPS << "*\t" << DT << "=\t" << TF << "\n\n";

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
