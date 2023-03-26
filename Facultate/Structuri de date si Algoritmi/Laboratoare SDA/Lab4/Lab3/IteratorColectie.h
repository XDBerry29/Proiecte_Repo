#pragma once
#include "Colectie.h"

class Colectie;
//typedef int TElem;
typedef int TElement;
typedef int TFrecventa;

#include <utility>
typedef std::pair<TElement, TFrecventa> TElem;

class IteratorColectie
{
	friend class Colectie;
private:
	//constructorul primeste o referinta catre Container
	//iteratorul va referi primul element din container
	IteratorColectie(const Colectie& c);

	//contine o referinta catre containerul pe care il itereaza
	const Colectie& col;
	/* aici e reprezentarea pecifica a iteratorului*/

	int curent_index;
	int curent_frecventa;


public:

	//reseteaza pozitia iteratorului la inceputul containerului
	void prim();

	//reseteaza pozitia iteratorului la sfarsitul containerului
	void ultimul();

	//muta iteratorul in container
	// arunca exceptie daca iteratorul nu e valid
	void urmator();

	//muta iteratorul anterior in container
	// arunca exceptie daca iteratorul nu e valid
	void anterior();

	//verifica daca iteratorul e valid (indica un element al containerului)
	bool valid() const;

	//returneaza valoarea elementului din container referit de iterator
	//arunca exceptie daca iteratorul nu e valid
	TElement element() const;

	TElement frecventa() const;
};