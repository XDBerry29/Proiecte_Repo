#include "IteratorMatrice.h"
#include "Matrice.h"
#include <exception>


IteratorMatrice::IteratorMatrice(const Matrice& m) : m(m) {
	this->curent_index = 0;
}

TElem IteratorMatrice::element() const {
	return m.T[this->curent_index].element;
}

bool IteratorMatrice::valid() const {
	if (this->curent_index >= this->m.nr)
		return false;
	else
		return true;
	return false;
}

void IteratorMatrice::urmator() {
	if (this->curent_index >= this->m.nr)
		throw std::exception();
	else {
		this->curent_index++;
	}
}

void IteratorMatrice::prim() {
	this->curent_index = 0;
}

