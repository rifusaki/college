// Números pares

#include <iostream>
#include <cmath>

void print_divisor(int sta, int sto, int div); // declarar

int main(void) {
	int m = 1, n=100, d = 2; // const int para hacerlo constante
	std::cout << "inicio: " << m << "\n" << "final:" << n << "\n" << "divisor:" << d << "\n";

	print_divisor(m,n,d);

	d = 3;
	std::cout << "\n" << "inicio: " << m << "\n" << "final:" << n << "\n" << "divisor:" << d << "\n";

	print_divisor(m,n,d);

	std::cout << std::endl;
	return 0;
}

void print_divisor(int sta, int sto, int div){ // implementar
	int suma = 0;
	for(int ii = sta; ii <= sto; ii++){ //m++ es igual a m=m+1
		if(ii%div == 0){
			std::cout << ii << " ";
			suma++;
		}
	}
	std::cout << "\n total: " << suma;
	std::cout << std::endl;
}

// && ES Y LÓGICO
// || ES O LÓGICO
