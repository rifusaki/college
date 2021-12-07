#include "md-simul.h"
#include <cmath>

void initial_conditions(Particle & body)
{
  body.Ry = 1.6598;
  body.Vx = 0.23698;

  body.rad = 0.235;
  body.mass = 0.29698;
}

void compute_force(Particle & body)
{
  // reset force & energy
  body.Fx = body.Fy = body.Fz = 0.0;
  body.U = body.K = body.R = 0.0;

  // GravPot & Kinetic
  body.U = body.mass*G*body.Ry*-1;
  body.K = body.mass*(pow(body.Vx,2)+pow(body.Vy,2)+pow(body.Vz,2))*0.5;

  // gravitational force
  body.Fy += body.mass*G;

  // floor
  double delta = body.rad - body.Ry;
  if (delta > 0) {
    body.Fy += K*delta;
    body.R += K*(pow(delta, 2))*0.5;
  }

  // Right wall
  delta = body.Rx + body.rad - LR;
  if (delta > 0) {
    body.Fx -= K*delta;
    body.R += K*(pow(delta, 2))*0.5;
  }

  // Left wall
  delta = LL - body.Rx + body.rad;
  if (delta > 0) {
    body.Fx += K*delta;
    body.R += K*(pow(delta, 2))*0.5;
  }
}

void print(Particle & body, double time)
{
  std::cout << time << "  "     //1
            << body.Rx << "  "  //2
            << body.Ry << "  "  //3
            << body.Rz << "  "
            << body.Vx << "  "  //5
            << body.Vy << "  "  //6
            << body.Vz << "  "
            << body.U << "\t"   //8
            << body.K << "\t"   //9
            << body.R << "\n";  //10
}
