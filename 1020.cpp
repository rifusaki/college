#include <iostream>

const int a = 8; // No mata nada; evitarlas; preferible en MAYUS; usar CONST :v

int main(void){
  int a = 9;
  std::cout << a << "\n";
  std::cout << &a << "\n";

  std::cout << ::a << "\n"; // Subir de nivel
  std::cout << &::a << "\n";

  {
  int a = 10; // Sublocalidad? También funciona sin declarar.
  std::cout << a << "\n";
  std::cout << &a << "\n"; // Acá muere el segundo a
  }

  std::cout << a << "\n"; // Se utiliza la externa.
  std::cout << &a << "\n";
}
