#pragma once

#define NULL_TELEM -1
//typedef int TElem;
typedef int TElement;
typedef int TFrecventa;

#include <utility>
typedef std::pair<TElement, TFrecventa> TElem;

class IteratorColectie;

class Colectie
{
	friend class IteratorColectie;

private:
	/* aici e reprezentarea */
	//capacitate
	int cp;

	//dimensiune
	//int n; //optional?

	//elemente
	TElem* e;

	//frecventele
	//TElem* f;

	//vectorul cu legaturile urmatoare
	int* urm;

	//vectorul cu legaturile precedente
	int* prec;

	//referinta catre primul si ultimul element al listei
	int prim, ultim;
	//referinta catre primul element din lista spatiului liber
	int primLiber;

	//pentru redimensionare
	void redim();

	//functii pentru alocarea/dealocarea unui spatiu liber
	//se returneaza pozitia unui spatiu liber in lista
	int aloca();
	//dealoca spatiul de indice i
	void dealoca(int i);
	//functie privata care creeaza un nod in lista inlantuita
	int creeazaNod(TElement elem);

public:
	//constructorul implicit
	Colectie();

	//adauga un element in colectie
	void adauga(TElement e);

	//sterge o aparitie a unui element din colectie
	//returneaza adevarat daca s-a putut sterge
	bool sterge(TElement e);

	//verifica daca un element se afla in colectie
	bool cauta(TElement elem) const;

	//returneaza numar de aparitii ale unui element in colectie
	int nrAparitii(TElement elem) const;


	//intoarce numarul de elemente din colectie;
	int dim() const;

	//verifica daca colectia e vida;
	bool vida() const;

	//returneaza un iterator pe colectie
	IteratorColectie iterator() const;

	// destructorul colectiei
	~Colectie();

	void adaugaAparitiiMultiple(int nr, TElement elem);

	int eliminaAparitii(int nr, TElement elem);
};