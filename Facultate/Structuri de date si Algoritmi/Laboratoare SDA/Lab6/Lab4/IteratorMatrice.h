#pragma once
#include "Matrice.h"
#include "IteratorMatrice.h"

typedef int TElem;

class Matrice;

class IteratorMatrice
{
	friend class Matrice;

private:
	//iteratorul memoreaza o referinta catre Matrice
	const Matrice& m;
	//aici alte atribute specifice: curent, etc

	int curent_index;

	IteratorMatrice(const Matrice& m);

public:


	TElem element() const;
	bool valid() const;
	void urmator();
	void prim();
};

