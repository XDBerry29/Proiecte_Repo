#include "Lista.h"
#include <exception>

#include "IteratorLP.h"
#include "Lista.h"

#include <iostream>


Nod::Nod(TElem e, PNod urm) {
	this->e = e;
	this->urm = urm;
}

TElem Nod::element() {

		return e;

}//Theta(1)

PNod Nod::urmator() {
	return urm;
}//Theta(1)

Lista::Lista() {
	this->primul = nullptr;
	this->ultim = nullptr;
}//Theta(1)

int Lista::dim() const {
	if (!primul)
		return 0;
	IteratorLP it = IteratorLP(*this);
	it.curent = primul;
	int dim = 1;
	while (it.curent->urm)
	{
		it.urmator();
		dim++;
	}

	return dim;
}//Theta(n)- n-nr de elemente din lista


bool Lista::vida() const {
	if (dim()==0)
		return true;
	return false;
}//Theta(1)

IteratorLP Lista::prim() const {
	IteratorLP it = IteratorLP(*this);
	it.curent = primul;
	return IteratorLP(*this);
}//Theta(1)

TElem Lista::element(IteratorLP poz) const {
	if (!poz.valid()) {
		throw std::exception();
	}
	return poz.element();
}//Theta(1)

TElem Lista::sterge(IteratorLP& poz) {
	if (!poz.valid()) {
		throw std::exception();
	}
	int el = element(poz);
	if (poz.curent == primul) {
		primul = poz.curent->urm;
		delete poz.curent;
		return el;
	}
	IteratorLP it = prim();
	while (it.curent->urm != poz.curent)
	{
		it.urmator();
	}
	it.curent->urm = poz.curent->urm;
	delete poz.curent;
	return el;
}//Caz favorabil:Theta(1) Caz defavorabil:Theta(n) Caz mediu:Theta(n), Coplexitate timp:O(n) n-nr el din lista; 

IteratorLP Lista::cauta(TElem e) const {
	IteratorLP it = prim();
	while (it.curent != nullptr) {
		if (element(it) == e)
			return it;
		it.urmator();
	}
	return it;
}//Caz favorabil:Theta(1) Caz defavorabil:Theta(n) Caz mediu:Theta(n), Coplexitate timp:O(n) n-nr el din lista; 

TElem Lista::modifica(IteratorLP poz, TElem e) {
	if (!poz.valid()) {
		throw std::exception();
	}
	TElem anterior = element(poz);
	poz.curent->e = e;
	return anterior;
}//Theta(1)

void Lista::adauga(IteratorLP& poz, TElem e) {
	if (!poz.valid()) {
		throw std::exception();
	}
	else {
		//nodul curent din iterator (e valid)
		PNod nodCurent = poz.curent;
		//se adauga un nou nod in lista, avand informatia utila e
		PNod nou = new Nod(e, nullptr);
		//stam iteratorul pe noul adaugat
		poz.curent = nou;
		//daca se adauga dupa ultim
		if (nodCurent == ultim) {
			ultim->urm = nou;
			ultim = nou;
		}
		else {//se adauga intre nodCurent si nodCurent -> urm
			nou->urm = nodCurent->urm;
			nodCurent->urm = nou;
		}
	}
}//Theta(1) 

void Lista::adaugaInceput(TElem e) {
	PNod nou = new Nod(e, nullptr);
	//daca lista e vida
	if (vida()) {
		primul = nou;
		ultim = nou;
	}
	else {
		//se adaug inainte de prim
		nou->urm = primul;
		primul = nou;
	}
}//Theta(1)

void Lista::adaugaSfarsit(TElem e) {
	PNod nou = new Nod(e, nullptr);
	//daca lista e vida
	if (vida()) {
		primul = nou;
		ultim = nou;
	}
	else {
		//se adaug dupa ultim
		ultim->urm = nou;
		ultim = nou;

	}
}//Theta(1)

Lista::~Lista() {
	while (primul != nullptr) {
		PNod p = primul;
		primul = primul->urm;
		delete p;
	}
}//Theta(n) n-nr el din lista