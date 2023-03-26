#include "Matrice.h"

#include <exception>
#include <iostream>

using namespace std;



Nod::Nod(triplet e, int st, int dr) {
	this->e = e;
	this->st = st;
	this->dr = dr;
}//Theta(1)

TElem Nod::element() const{
	return e.valoare;
}//Theta(1)

TElem Nod::stanga() {
	return st;
}//Theta(1)

TElem Nod::dreapta() {
	return dr;
}//Theta(1)



TElem Matrice::key(int i,int j) const {
	return i * 1000 + j;
}//Theta(1)


Matrice::Matrice(int m, int n) {
	this->nr = m * n;
	this->linii = m;
	this->coloane = n;
	Nod* nou = new Nod[nr + 5];
	delete[] T;
	T = nou;
	for (int i = 0; i < nr; i++)
	{
		T[i].st = i + 1;
	}
}//Theta(1)



int Matrice::nrLinii() const {
	return this->linii;
}//Theta(1)


int Matrice::nrColoane() const {
	return this->coloane;
}//Theta(1)


TElem Matrice::element(int i, int j) const {
	int index = rad;

	while (index != NIL) {
		if (key(i, j) == key(T[index].e.linie, T[index].e.coloana))
		{
			return T[index].e.valoare;

		}
		if (key(i, j) < key(T[index].e.linie, T[index].e.coloana))
		{
			index = T[index].st;
		}
		else if (key(i, j) > key(T[index].e.linie, T[index].e.coloana))
		{
			index = T[index].dr;
		}
	}

	return NULL_TELEMENT;
}//Caz favorabil:Theta(1) Caz defavorabil:Theta(nrlinii*nrcoloane)(caz in care toate elementele se aseaza la staga sau toate la drapta)
//Caz mediu:Theta(longnr)nr-nr de elemente sau Theta(h) h-adancimea arborelui, Coplexitate timp:o(log nr) ; 



TElem Matrice::modifica(int i, int j, TElem e) {
	if (i > nrLinii() || j > nrColoane())
	{
		throw exception();
	}
	if (i < 0 || j < 0)
	{
		throw exception();
	}

	triplet nou;
	nou.linie = i;
	nou.coloana = j;
	nou.valoare = e;
	int aux;

	if (rad == NIL)
	{
		rad = primliber;
		aux = T[primliber].st;
		T[rad].e = nou;
		T[rad].st = NIL;
		T[rad].dr = NIL;
		primliber = aux;
		return e;
	}
	int index=rad;
	TElem anterior;
	int parinte;

	while (index != NIL) {
		if (key(i,j) == key(T[index].e.linie, T[index].e.coloana))
		{
			anterior = T[index].e.valoare;
			T[index].e.valoare = e;
			return anterior;

		}
		if (key(i, j) < key(T[index].e.linie, T[index].e.coloana))
		{
			parinte = index;
			index = T[index].st;
		}else if (key(i, j) > key(T[index].e.linie, T[index].e.coloana))
		{
			parinte = index;
			index = T[index].dr;
		}
	}

	//adugam elementul daca nu a fost gasit
	if (key(i, j) < key(T[parinte].e.linie, T[parinte].e.coloana))
	{
		aux = T[primliber].st;
		T[parinte].st = primliber;//pun elementul in stanga parintelui
		T[primliber].e = nou;
		T[primliber].st = NIL;
		T[primliber].dr = NIL;
		primliber = aux;
	}
	else if (key(i, j) > key(T[parinte].e.linie, T[parinte].e.coloana))
	{
		aux = T[primliber].st;
		T[parinte].dr = primliber;//pun elementul in dreapta parintelui
		T[primliber].e = nou;
		T[primliber].st = NIL;
		T[primliber].dr = NIL;
		primliber = aux;
	}
	return e;
}//Caz favorabil:Theta(1) Caz defavorabil:Theta(nrlinii*nrcoloane)(caz in care toate elementele se aseaza la staga sau toate la drapta)
//Caz mediu:Theta(longnr)nr-nr de elemente sau Theta(h) h-adancimea arborelui, Coplexitate timp:o(log nr) ; 



//functionalitate extra
TElem Matrice::suma(int j) {
	// determina suma elementelor de pe o linia j
	if (j<0 || j>linii) {
		throw exception();
	}
	int sum = 0;
	for (int i = 0; i < coloane; i++) {
		sum += element(j, i);
	}
	return sum;
} // Complexitati: Caz favorabil : theta(NrLinii), caz defavotabil : theta(NrLinii*log n), Total :  O(NrLinii)

//PSEUDOCOD
// suma (i,suma)
// //pre:i apratine N
// //post: suma intreg
//daca j < 0 sau j> linii atunci
//		Arunca exceptie
//alfel
//  suma<-0
// 
// pentru i<-0,coloane executa
//		suma<-suma+cauta(i,j)
// sfpentru
//  
//sfsubalgoritm