#pragma once
#include "IteratorMatrice.h"

typedef int TElem;


#define NULL_TELEMENT 0

struct triplet {
	TElem linie = NULL_TELEMENT;
	TElem coloana = NULL_TELEMENT;
	TElem element = NULL_TELEMENT;
};

class Matrice {

	friend class IteratorMatrice;

private:
	//capacitate
	int cp;
	//ne el
	int n;

	int NrLinii;
	int NrColoane;
	//triplet 
	triplet* t;


public:

	//constructor
	//se arunca exceptie daca nrLinii<=0 sau nrColoane<=0
	Matrice(int nrLinii, int nrColoane);

	


	//destructor
	~Matrice() ;


	void redim();

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

};







