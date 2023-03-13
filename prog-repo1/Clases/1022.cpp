#include <iostream>

int main(void) {
  double x = 9.7, y = 1.87, z = 0;

  z = x + y;
  std::cout << z << "\n";
  z = x - y;
  std::cout << z << "\n";
  z = x * y;
  std::cout << z << "\n";
  z = x / y;
  std::cout << z << "\n";
  int m = 9/4; // División entera/truncada
  std::cout << m << "\n";

  std::cout << 2*3-4/5 << "\n"; // Trunca automáticamente
  std::cout << 2*3-4.0/5 << "\n"; //Convierte 4 en double

  // Operadores compuestos: +=, -=, /=, *=, >>=...
  // Incremento y decremento: ++x, x++, x--, --x. Importa el orden; qué se
  //    ejecuta primero

  // ! NOT; && Y; || O

  // Operador ternario: a ?? b : c
  //    se "pregunta"; si a TRUE, b ejecuta; c en otro caso
  int flg = 5>4 ? -1 : 32;
  std::cout << flg << "\n \n";

// Bitwise op. & AND; | OR; ^ XOR;  NOT; << SHL; >> SHR...
  int aa = 2, bb = 17, btw = 0;
  btw = aa & bb;
  std::cout << btw << "\n";
  btw = aa | bb;
  std::cout << btw << "\n";
  btw = aa << 2; // Mueve valores en bit a izq; aumentar en pot.2
  std::cout << btw << "\n";
  btw = aa >> 2;
  std::cout << btw << "\n";

  return 0;
}
