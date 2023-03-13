// Parámetros usados:
// ./a.out 12345 1000000 -1.1 1.1 30

#include <iostream>
#include <fstream>
#include <random>
#include <vector>

double f(double x) {
    return 3.0*(1-x*x)/4.0;
}

int main(int argc, char **argv)
{
    const int SEED = std::atoi(argv[1]);
    const int SAMPLES = std::atoi(argv[2]);
    const double XMIN = std::atof(argv[3]);
    const double XMAX = std::atof(argv[4]);
    const int NBINS = std::atoi(argv[5]);
    const double DX = (XMAX-XMIN)/NBINS;

    std::vector<double> pdf(NBINS, 0.0);
    std::mt19937 gen(SEED);

    std::uniform_real_distribution<double> xp(XMIN, XMAX);
    std::uniform_real_distribution<double> yp(0, 3.0/4.0);

    std::ofstream fout("datos.txt");
    for (int ii = 0; ii < SAMPLES-1;) {
        double x = xp(gen);
        double y = yp(gen);
        if (y < f(x)) {
            fout << x << "\t" << y << "\n";
            int bin = int((x - XMIN)/DX);
            if (0 <= bin && bin < NBINS) {
                pdf[bin]++;
                ++ii;
            }
        }
    }
    fout.close();

    fout.open("density.txt");
    for (int ii = 0; ii < NBINS; ii++) {
        fout << XMIN + ii*DX << "\t" << pdf[ii]/(DX*SAMPLES) << "\n";
    }
    fout.close();

    return 0;
}
