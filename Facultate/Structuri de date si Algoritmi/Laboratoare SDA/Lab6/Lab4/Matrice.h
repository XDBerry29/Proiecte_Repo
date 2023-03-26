#pragma once



#define MAX 40005

#define NIL -1

#define NULL_TELEMENT 0

typedef int TElem;

struct triplet {
	TElem linie;
	TElem coloana;
	TElem element;
};




class Matrice {
	friend class IteratorMatrice;
private:
	int nr; //numarul de locatii din tabela de dispersie
	triplet* T; //vectorul elementelor
	int NrLinii;
	int NrColoane;

	

public:

	int d(int i,int j, int index) const;
	//constructor
	//se arunca exceptie daca nrLinii<=0 sau nrColoane<=0
	Matrice(int NrLinii, int NrColoane);


	//destructor
	~Matrice() {};

	//returnare element de pe o linie si o coloana
	//se arunca exceptie daca (i,j) nu e pozitie valida in Matrice
	//indicii se considera incepand de la 0
	TElem element(int i, int j) const;


	// returnare numar linii
	int nrLinii() const;

	// returnare numar coloane
	int nrColoane() const;


	// modificare element de pe o linie si o coloana si returnarea vechii valori
	// se arunca exceptie daca (i,j) nu e o pozitie valida in Matrice
	TElem modifica(int i, int j, TElem);

	TElem suma(int j);

};