// Variables

#include <iostream>
#include <limits>

int main(void){
  float f;
  bool b = false;
  double d;
  float fi = 1.0e40;

  std::cout << "\n Float sin inicializar: " << f << "\n";
  std::cout << "\n Booleano: " << b << "\n";
  std::cout << "\n Double:  Dir. mem. " << &d << "\n \t  Bytes ocp. " << sizeof(d);
  std::cout << "\n \n Float (1.0e40): " << fi;

  // El valor máximo de float es 3.40282e+38, menor que 1.0e40 (por el exponente)

  float maxf = std::numeric_limits<float>::max();
  std::cout << "\n \n Límite float: " << maxf << "\n \n";

  return 0;
}
