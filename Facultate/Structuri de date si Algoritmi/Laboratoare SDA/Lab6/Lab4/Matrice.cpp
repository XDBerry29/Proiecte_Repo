#include "Matrice.h"

#include <exception>
#include <iostream>

using namespace std;


TElem hashCode(int i, int j) {
	return i*1000+j;
}//Theta(1)


TElem Matrice::d(int i, int j, int index) const{
	return (hashCode(i,j)%nr + 1*index + 1* index * index) %nr;
}//Theta(1)




Matrice::Matrice(int m, int n) {
	nr = m*n; 
	NrLinii = n;
	NrColoane = m;
	triplet* nou = new triplet[nr+5];
	delete[] T;
	T = nou;
	for (int i = 0; i < nr+3; i++) {
		T[i].linie = NIL;
	}
}//Theta(n*m); n-nr linii m-nr coloane



int Matrice::nrLinii() const {
	return NrLinii;
}//Theta(1)


int Matrice::nrColoane() const {
	return NrColoane;
}//Theta(1)


TElem Matrice::element(int i, int j) const {
	if (i > NrLinii || j > NrColoane)
	{
		throw exception();
	}
	int index = -1;
	do {
		index++;
		if (T[d(i, j, index)].linie == i && T[d(i, j, index)].coloana == j)
		{
			return T[d(i, j, index)].element;
		}
		
	}while(index*index <= nr);


	return 0;
}//Caz favorabil:Theta(1) Caz defavorabil:Theta(log(n*m)) Caz mediu:Theta(log(n*m)), Coplexitate timp:O(log(n*m)) n-nr linii m-nr coloane; 



TElem Matrice::modifica(int i, int j, TElem e) {
	if (i > NrLinii || j > NrColoane)
	{
		throw exception();
	}
	if (i < 0 || j < 0)
	{
		throw exception();
	}

	int anterior;

	int index = -1;
	do {
		index++;
		if (T[d(i, j, index)].linie == i && T[d(i, j, index)].coloana == j)
		{
			anterior = T[d(i, j, index)].element;
			T[d(i, j, index)].element = e;
			return anterior;

		}
		
	} while (index * index <= nr);

	index = 0;
	int pus = 0;
	do {
		if (T[d(i, j, index)].linie == NIL)
		{
			T[d(i, j, index)].element = e;
			T[d(i, j, index)].linie = i;
			T[d(i, j, index)].coloana = j;
			pus = 1;

		}
		index++;
	} while (!pus);

	return e;
}//Caz favorabil:Theta(1) Caz defavorabil:Theta(log(n*m)) Caz mediu:Theta(log(n*m)), Coplexitate timp:O(log(n*m)) n-nr linii m-nr coloane; 

//functionalitate extra
TElem Matrice::suma(int j) {
	// determina suma elementelor de pe o linia j
	if (j<0 || j>NrLinii) {
		throw exception();
	}
	int sum = 0;
	for (int i = 0; i < NrColoane; i++) {
		sum += element(j, i);
	}
	return sum;
} // Complexitati: Caz favorabil : theta(NrLinii), caz defavotabil : theta(NrLinii*log n), Total :  O(NrLinii)

//PSEUDOCOD
// suma (i,suma)
// //pre:i apratine N
// //post: suma intreg
//daca j < 0 sau j> NrLinii atunci
//		Arunca exceptie
//alfel
//  suma<-0
// 
// pentru i<-0,NrColoane executa
//		suma<-suma+cauta(i,j)
// sfpentru
//  
//sfsubalgoritm


