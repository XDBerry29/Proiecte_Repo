#include <iostream>
#include "Matrice.h"
#include "IteratorMatrice.h"
#include "TestExtins.h"
#include "TestScurt.h"

using namespace std;

//TAD Matrice-reprezentare  sub  forma  unei  matrice  rare, 
//folosind  un  vector  dinamic  de triplete de forma <linie, coloană, valoare> (valoare≠0), memorate în ordine lexicografică după (linie, coloană).
int main() {

		testAll();
		testAllExtins();

	cout << "End";
}
