#pragma once

typedef int TElem;

#define NIL -1

#define MAX 20005


#define NULL_TELEMENT 0


struct triplet {
	TElem linie = NIL;
	TElem coloana = NIL;
	TElem valoare=NIL;
};

class Nod

{

public:

	friend class Matrice;
	friend class IteratorMatrice;

	//constructor

	Nod(triplet e, int st, int dr);
	Nod(){};

	TElem element() const;

	TElem stanga();

	TElem dreapta();


private:

	triplet e;

	int st = NIL, dr = NIL;

};


class Matrice {

	friend class Nod;
	friend class IteratorMatrice;

private:
	int rad = NIL;
	//cap
	int nr;
	Nod* T;
	int linii;
	int coloane;
	int primliber = 0;

public:


	TElem key(int i,int j) const;
	//constructor
	//se arunca exceptie daca nrLinii<=0 sau nrColoane<=0
	Matrice(int nrLinii, int nrColoane);


	//destructor
	~Matrice() {};

	//returnare valoare de pe o linie si o coloana
	//se arunca exceptie daca (i,j) nu e pozitie valida in Matrice
	//indicii se considera incepand de la 0
	TElem element(int i, int j) const;


	// returnare numar linii
	int nrLinii() const;

	// returnare numar coloane
	int nrColoane() const;


	// modificare valoare de pe o linie si o coloana si returnarea vechii valori
	// se arunca exceptie daca (i,j) nu e o pozitie valida in Matrice
	TElem modifica(int i, int j, TElem);

	TElem suma(int j);

};







