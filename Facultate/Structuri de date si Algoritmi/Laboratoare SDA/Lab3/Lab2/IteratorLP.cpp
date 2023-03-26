#include "IteratorLP.h"
#include "Lista.h"
#include <exception>

IteratorLP::IteratorLP(const Lista& l) :lista(l) {
	this->curent = l.primul;
}//Theta(1)

void IteratorLP::prim() {
	this->curent = lista.primul;
}//Theta(1)

void IteratorLP::urmator() {
	if (curent == nullptr) {
		throw std::exception();
	}
	this->curent = this->curent->urmator();
}//Theta(1)

bool IteratorLP::valid() const {
	return (curent != nullptr);
}//Theta(1)

TElem IteratorLP::element() const {
	if (curent == nullptr) {
		throw std::exception();
	}
	return curent->element();
}//Theta(1)


