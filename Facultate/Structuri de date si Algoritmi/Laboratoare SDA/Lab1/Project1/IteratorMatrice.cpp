#include "IteratorMatrice.h"
#include "Matrice.h"
#include <exception>


IteratorMatrice::IteratorMatrice(const Matrice& m) : m(m) {
	this->curent_index = 0;
}//Theta(1)

TElem IteratorMatrice::element() const {
	return m.t[this->curent_index].element;
}//Theta(1)

bool IteratorMatrice::valid() const {
	if (this->curent_index >= this->m.n)
		return false;
	else
		return true;
}//Theta(1)

void IteratorMatrice::urmator() {
	if (this->curent_index >= this->m.n)
		throw std::exception();
	else {
		this->curent_index++;
		}
}//Theta(1)

void IteratorMatrice::prim() {
	this->curent_index = 0;
}//Theta(1)

