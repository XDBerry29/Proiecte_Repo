#include "Colectie.h"
#include "IteratorColectie.h"
#include <exception>
#include <iostream>

using namespace std;

int Colectie::aloca() {
	//se sterge primul element din lista spatiului liber
	int i = primLiber;
	primLiber = urm[primLiber];
	return i;
}
//theta(1)

void Colectie::dealoca(int i) {
	//se trece pozitia i in lista spatiului liber
	urm[i] = primLiber;
	primLiber = i;
}
//theta(1)

void Colectie::redim() {
	//alocam un spatiu de capacitate dubla
	TElem* eNou = new TElem[2 * cp];
	//TElem* fNou = new int[2 * cp];
	int* urmNou = new int[2 * cp];
	int* precNou = new int[2 * cp];

	//copiem vechile valori in zona noua
	for (int i = 0; i < cp; i++)
	{
		eNou[i] = e[i];
		//fNou[i] = f[i];
		urmNou[i] = urm[i];
		precNou[i] = prec[i];
	}

	int cp_anterior = cp;

	//dublam capacitatea
	cp = 2 * cp;

	//eliberam vechea zona
	delete[] e;
	//delete[] f;
	delete[] urm;
	delete[] prec;

	//vectorul indica spre noua zona
	e = eNou;
	//f = fNou;
	urm = urmNou;
	prec = precNou;

	prec[cp_anterior] = -1;
	for (int i = cp_anterior; i < cp - 1; i++)
	{
		//f[i] = 0;
		e[i].second = 0; //frecventa
		urm[i] = i + 1;
		prec[i + 1] = i;
	}
	urm[cp - 1] = -1;

	//f[cp - 1] = 0;
	e[cp - 1].second = 0;
	primLiber = cp_anterior;
}
//theta(cp), cp - capacitatea veche a tabloului dinamic

//creeaza un nod in lista inlantuita unde se memoreaza informatia utila e
int Colectie::creeazaNod(TElement elem) {
	//daca s-ar folosi vector dinamic, s-ar redimensiona in cazul in care colectia ar fi plina (primLiber=0)
	if (primLiber == -1)
		redim();
	int i = aloca();
	if (i != -1) {//exista spatiu liber in lista
		/*this->e[i] = elem;
		this->f[i] = 1;*/
		this->e[i].first = elem;
		this->e[i].second = 1;
		urm[i] = -1;
		prec[i] = -1;
	}
	return i;
}
//caz favorabil: theta(1); caz defavorabil: theta(cp); caz total: O(cp)

Colectie::Colectie() {
	
	this->cp = 2;

	e = new TElem[cp];


	urm = new int[cp];
	prec = new int[cp];

	//lista e vida
	prim = -1;
	ultim = -1;
	prec[0] = -1;
	for (int i = 0; i < cp - 1; i++)
	{
		//f[i] = 0;
		e[i].second = 0; //frecventa
		urm[i] = i + 1;
		prec[i + 1] = i;
		//prec[i] = i - 1;
	}
	urm[cp - 1] = -1;

	//f[cp - 1] = 0;
	e[cp - 1].second = 0;

	//referinta spre prima pozitie libera din lista
	primLiber = 0;

}
//theta(cp), cp - capacitatea tabloului dinamic, chiar theta(1) (intra in for o sg data)


//adaugam in fata
void Colectie::adauga(TElement elem) {

	int index = prim;
	bool gasit = false;
	while (not gasit && index < this->cp && index != -1) {
		//if (this->e[index] == elem)
		if (this->e[index].first == elem)
			gasit = true;
		else
			//index++;
			index = urm[index];
	}

	if (not gasit || this->e[index].second == 0)
	{
		int i = creeazaNod(elem);
		//in cazul folosirii unui vector static, e posibil ca i sa iasa -1 in cazul in care lista e plina
		if (i != -1) {
			urm[i] = prim;
			if (prim != -1)
				prec[prim] = i;
			else
				ultim = i; //daca lista e vida si urmeaza sa punem primul elem, ultim ia pozitia lui
			prim = i;
		}
	}
	else
		//this->f[index]++;
		this->e[index].second++;//incrementam frecventa
}
//caz favorabil: theta(1); caz defavorabil: theta(cp); caz total: O(cp)

bool Colectie::sterge(TElement elem) {
	/* de adaugat */
	//int index = 0;
	int index = prim;
	bool gasit = false;
	while (not gasit && index < this->cp && index != -1) {
		if (this->e[index].first == elem)
			gasit = true;
		else
			//index++;
			index = urm[index];
	}

	if (not gasit || this->e[index].second == 0)
		return false;
	else
	{
		if (this->e[index].second == 1) //frecventa
		{
			if (elem == e[prim].first) //daca e primul element din lista
			{
				if (prim == ultim)
					ultim = prec[prim]; //sau -1
				prim = urm[prim];
				if (prim != -1) //daca lista nu e goala
					prec[prim] = -1;//!!!noul prim va avea precendentul -1, adica pe nimeni
			}
			else
			{
				int q = prim;
				while (urm[q] != index)
					q = urm[q];
				if (urm[index] == -1) //daca e ultimul elem in lista
				{
					urm[q] = -1;
					ultim = q;
				}
				else {
					urm[q] = urm[index];
					prec[urm[index]] = prec[index];
				}
			}
			dealoca(index); //marim spatiul liber
			/*e[index].first = 0;*/
			e[index].second = 0;
		}
		else
			this->e[index].second--; //decrementam frecventa

		return true;
	}
}
//caz favorabil: theta(1); caz defavorabil: theta(n); caz total: O(n), n - nr de elem dist din colectie

bool Colectie::cauta(TElement elem) const {
	
	int index = prim;
	while (index < this->cp && index != -1)
	{
		if (e[index].first == elem && e[index].second != 0)
			return true;
		index = urm[index];
	}
	return false;
	//caz favorabil: theta(1); caz defavorabil: theta(n); caz total: O(n), n - nr de elem dist din colectie
}

int Colectie::nrAparitii(TElement elem) const {
	
	int index = prim;
	while (index < this->cp && index != -1)
	{
		if (e[index].first == elem)
			return this->e[index].second;//frecventa
		index = urm[index];
	}
	return 0;
	//caz favorabil: theta(1); caz defavorabil: theta(n); caz total: O(n), n - nr de elem dist din colectie
}

int Colectie::dim() const {
	

	int nr_de_elem = 0;
	int index = prim;
	while (index < this->cp && index != -1)
	{
		nr_de_elem += this->e[index].second;//frecventa
		index = urm[index];
	}
	return nr_de_elem;
	//theta(n), n - nr de elem distincte in colectie
}
//theta(cp)

bool Colectie::vida() const {
	/* de adaugat */
	if (prim == -1)
		return true;
	return false;
}
//theta(1)

IteratorColectie Colectie::iterator() const {
	return  IteratorColectie(*this);
}
//theta(1)

Colectie::~Colectie() {
	/* de adaugat */
	delete[] e;
	//delete[] f;
	delete[] urm;
	delete[] prec;
}
//theta(1)


// adauga nr aparitii ale elementului elem in colectie.
// arunca exceptie in cazul in care este nr este negativ.
void Colectie::adaugaAparitiiMultiple(int nr, TElement elem)
{
	if (nr < 0)
		throw exception();
	else
	{
		int index = prim;
		bool gasit = false;
		while (not gasit && index < this->cp && index != -1) {
			if (this->e[index].first == elem)
				gasit = true;
			else
				index = urm[index];
		}

		if (not gasit || this->e[index].second == 0)
		{
			int i = creeazaNod(elem);
			//in cazul folosirii unui vector static, e posibil ca i sa iasa -1 in cazul in care lista e plina
			if (i != -1) {
				urm[i] = prim;
				if (prim != -1)
					prec[prim] = i;
				else
					ultim = i; //daca lista e vida si urmeaza sa punem primul elem, ultim ia pozitia lui
				prim = i;
				this->e[i].second += nr - 1;
			}
		}
		else
			this->e[index].second += nr;//incrementam frecventa
	}
}
//Complexitati: Caz favorabil: theta(1), caz favorabil: theta(n), Total: O(n)
//PSEUDOCOD
//daca nr < 0 atunci
//	arunca exceptie
//altfel
//index<-prim
//gasit<-false
//cat timp !gasit si index < cp si index != -1 executa
//	daca l.e[index].first = elem atunci
//		gasit<-true
//	altfel
//		index<-l.urm[index]
//daca !gasit sau l.e[index].second = 0
//	i<-creeazaNod(elem)
//	daca i != -1 atunci
//		l.urm[i]<-prim
//		daca prim != -1 atunci
//			l.prec[prim]<-i
//		altfel
//			ultim<-i //daca lista e vida si urmeaza sa punem primul elem, ultim ia pozitia lui
//		prim<-i
//		l.e[i].second<- l.e[index].second + nr - 1
//
//altfel
//	l.e[index].second<- l.e[index].second + nr




int Colectie::eliminaAparitii(int nr, TElement elem) {
	/* de adaugat */

	if (nr < 0)
		throw exception();
	else
	{
		int index = prim;
		bool gasit = false;
		while (not gasit && index < this->cp && index != -1) {
			if (this->e[index].first == elem)
				gasit = true;
			else
				index = urm[index];
		}

		if (not gasit || this->e[index].second == 0)
			return 0;
		else
		{
			if (this->e[index].second <= nr) //frecventa
			{
				int nreliminari = this->e[index].second;
				if (elem == e[prim].first) //daca e primul element din lista
				{
					if (prim == ultim)
						ultim = prec[prim]; //sau -1
					prim = urm[prim];
					if (prim != -1) //daca lista nu e goala
						prec[prim] = -1;//!!!noul prim va avea precendentul -1, adica pe nimeni
				}
				else
				{
					int q = prim;
					while (urm[q] != index)
						q = urm[q];
					if (urm[index] == -1) //daca e ultimul elem in lista
					{
						urm[q] = -1;
						ultim = q;
					}
					else {
						urm[q] = urm[index];
						prec[urm[index]] = prec[index];
					}
				}
				dealoca(index); //marim spatiul liber
				e[index].second = 0;
				return nreliminari;
			}
			else
			{
				this->e[index].second -= nr; //decrementam frecventa
				return nr;
			}
		}
	}
}
//caz fav: theta(1), caz defavorabil: theta(n), caz total: O(n)