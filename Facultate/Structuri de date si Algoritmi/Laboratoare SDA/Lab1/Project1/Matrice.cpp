#include "Matrice.h"
#include "IteratorMatrice.h"

#include <exception>
#include <iostream>

using namespace std;


Matrice::Matrice(int m, int n) {
	this->NrColoane = n;
	this->NrLinii = m;
	this->cp = 1;
	this->n = 0;
	t = new triplet[cp];
}


void Matrice::redim() {
	//alocam un spatiu de capacitate dubla
	triplet* tNou = new triplet[2 * cp];

	//copiem vechile valori in zona noua
	for (int i = 0; i < n; i++)
	{
		tNou[i].linie = t[i].linie;
		tNou[i].coloana = t[i].coloana;
		tNou[i].element = t[i].element;
	}

	//dublam capacitatea
	cp = 2 * cp;

	//eliberam vechea zona
	delete[] t;

	//vectorul indica spre noua zona
	t = tNou;
}//Compexitate timp:Theta(n)



int Matrice::nrLinii() const {
	
	return this->NrLinii;
}//Compexitate timp:Theta(1)


int Matrice::nrColoane() const {
	
	return this->NrLinii;;
}//Compexitate timp:Theta(1)


TElem Matrice::element(int i, int j) const {

	if (i > NrLinii || j > NrColoane)
	{
		throw exception();
	}
	
	int index = 0;


	triplet cur = t[index];

	while (i>=cur.linie && j>=cur.coloana && index<n)
	{
		if (i == cur.linie && j == cur.coloana)
			return t[index].element;

		index++;
		cur = t[index];
	}



	return NULL_TELEMENT;
}//Caz favorabil:Theta(1) Caz defavorabil:Theta(n) Caz mediu:Theta(n), Coplexitate timp:O(n) n-nr el; 



TElem Matrice::modifica(int i, int j, TElem e) {
	if (i > NrLinii || j > NrColoane)
	{
		throw exception();
	}

	int index = 0;
	triplet cur;


		
	
	if (n != 0) {
		cur = t[index];

		while (i >= cur.linie && j >= cur.coloana && index < n)
		{
			if (i == cur.linie && j == cur.coloana)
			{
				t[index].element = e;
				return e;
			}
			

			index++;
			cur = t[index];
		}
	}
	//In cazul in care nu s-a gasit:
	if (n == cp)
		redim();

	n++;
	int poz = index;
	triplet nou, aux;
	nou.linie = i;
	nou.coloana = j;
	nou.element = e;
	index = n -1;

	while (index > poz)
	{
		t[index] = t[index - 1];
		index--;
	}

	t[poz] = nou;

	return e;
}//Caz favorabil:Theta(1) Caz defavorabil:Theta(n) Caz mediu:Theta(n), Coplexitate timp:O(n) n-nr el; 

Matrice::~Matrice() {
	//eliberam zona de memorare alocata vectorului
	delete[] t;
}


