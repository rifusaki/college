#include <iostream>
#include <chrono>
#include <random>
#include <cmath>
#include <cstdlib>
#include <vector>
#include <algorithm>
#include <fstream>

void multiply(const std::vector<double> & m1, const std::vector<double> & m2, std::vector<double> & m3);

int main(int argc, char **argv) {
  // Read parameters
  const int r = std::atoi(argv[1]);
  const int SEED = std::atoi(argv[2]);

  auto ref = std::chrono::duration<double>(0);

  std::ofstream fout("mult.txt");

  for (int N = 4; N <= r; N=2*N)  {
    std::cout << "N: " << N << "\n";

    // Data structs
    std::vector<double> A(N*N, 0.0), B(N*N, 0.0), C(N*N, 0.0);

    // Random numbers from 0 to 1
    std::mt19937 gen(SEED);
    std::uniform_real_distribution<> dist(0.,1.);

    // Fill matrices A and B, using random numbers betwwen 0 and 1
    std::generate(A.begin(), A.end(), [&gen, &dist](){ return dist(gen); }); // uses a lambda function
    std::generate(B.begin(), B.end(), [&gen, &dist](){ return dist(gen); });

    // Multiply the matrices A and B and save the result into C. Measure time
    auto start = std::chrono::high_resolution_clock::now();
    multiply(A, B, C);
    auto stop = std::chrono::high_resolution_clock::now();

    // Use the matrix to avoid the compiler removing it
    std::cout << "C[N/2]: "<< C[N/2] << std::endl;

    if(N==4)  {
      ref = std::chrono::duration<double>(stop - start);
    }

    auto elapsed = std::chrono::duration<double>(stop - start);
    double relt = elapsed.count()/ref.count();
    std::cout << "Tiempo: " << elapsed.count() << "\n";
    std::cout << "Tiempo relativo: " << relt << "\n\n";

    fout << N << "\t" << relt << "\n";
  }

  fout.close();

  system("gnuplot -p -e \"plot 'mult.txt' w linespoints pt 7\"");

  return 0;
}

// implementations
void multiply(const std::vector<double> & m1, const std::vector<double> & m2, std::vector<double> & m3)  {
  const int N = std::sqrt(m1.size()); // assumes square matrices

  for (int i = 0; i < N; i++)  {
    for (int j = 0; j < N; j++) {
      for (int k = 0; k < N; k++) {
        m3[i*N+j] += m1[i*N+k]*m2[k*N+j];
      }
    }
  }

}
