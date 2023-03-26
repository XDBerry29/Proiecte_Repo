package domain;


import java.util.Objects;

public class Utilizator extends Entity<Long> {

    private String nume;

    private String prenume;

    private String email;

    private String parola;

    private String dataNasterii;

    public Utilizator(Long id, String nume, String prenume, String email, String parola, String dataNasterii) {
        super(id);
        this.nume = nume;
        this.prenume = prenume;
        this.email = email;
        this.parola = parola;
        this.dataNasterii = dataNasterii;
    }

    @Override
    public String toString() {
        return getID() + " " + this.nume + " " + this.prenume+ " " + this.email + " " + this.dataNasterii;
    }

    //getters

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getPrenume() {
        return prenume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getParola() {
        return parola;
    }

    public void setParola(String parola) {
        this.parola = parola;
    }

    public String getDataNasterii() {
        return dataNasterii;
    }

    public void setDataNasterii(String dataNasterii) {
        this.dataNasterii = dataNasterii;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Utilizator that = (Utilizator) o;
        return email.equals(that.email);
    }

}
