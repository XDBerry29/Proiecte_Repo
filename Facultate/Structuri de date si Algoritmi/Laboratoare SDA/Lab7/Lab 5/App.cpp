//TAD Matrice - reprezentare  sub  forma  unei  matrice  rare(triplete  de  forma  <linie, coloană, valoare>(valoare)), 
//memorate  folosind  un  ABC  reprezentat  înlănțuit, cu  înlănțuiri reprezentate pe tablou.

#include <iostream>
#include "Matrice.h"
#include "TestExtins.h"
#include "TestScurt.h"

using namespace std;


int main() {

	//testfuncionalitate extra
	Matrice m(4, 4);
	m.modifica(1, 1, 2);
	m.modifica(1, 2, 2);
	m.modifica(1, 3, 2);
	m.modifica(2, 1, 1);
	m.modifica(2, 3, 4);
	std::cout << m.suma(1) << "=" << 6 << endl;
	std::cout << m.suma(2) << "=" << 5 << endl;


	testAll();
	testAllExtins();

	cout << "End";
}
