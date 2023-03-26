#include "IteratorColectie.h"
#include "Colectie.h"
#include <exception>

using namespace std;

IteratorColectie::IteratorColectie(const Colectie& c) : col(c) {
	/* de adaugat */
	this->curent_index = c.prim;
	this->curent_frecventa = 1;
}
//theta(1)

void IteratorColectie::prim() {
	/* de adaugat */
	this->curent_index = col.prim;
	this->curent_frecventa = 1;
}
//theta(1)

void IteratorColectie::ultimul() {
	/* eu */
	this->curent_index = col.ultim;
	this->curent_frecventa = 1;
}
//theta(1)

void IteratorColectie::urmator() {
	/* de adaugat */
	if (this->curent_index >= this->col.cp || this->curent_index == -1)
		throw exception();
	else {
		if (this->curent_frecventa < this->col.e[this->curent_index].second) //second = frecventa in pereche
			this->curent_frecventa++;
		else {
			this->curent_index = this->col.urm[this->curent_index];
			this->curent_frecventa = 1;
		}
	}
}
//theta(1)

void IteratorColectie::anterior() {
	/* eu */
	if (this->curent_index == -1)
		throw exception();
	else {
		if (this->curent_frecventa < this->col.e[this->curent_index].second) //second = frecventa in pereche
			this->curent_frecventa++;
		else {
			this->curent_index = this->col.prec[this->curent_index];
			this->curent_frecventa = 1;
		}
	}
}
//theta(1)

bool IteratorColectie::valid() const {
	/* de adaugat */
	if (this->curent_index >= this->col.cp || this->curent_index == -1)
		return false;
	else
		return true;
}
//theta(1)

TElement IteratorColectie::element() const { //!!!
	/* de adaugat */
	if (this->curent_index >= this->col.cp || this->curent_index == -1)
		throw exception();
	return this->col.e[this->curent_index].first;
}
//theta(1)

//pt frecventa -- in plus
TElement IteratorColectie::frecventa() const {
	if (this->curent_index >= this->col.cp || this->curent_index == -1)
		throw exception();
	return this->col.e[this->curent_index].second;
}
//theta(1)
