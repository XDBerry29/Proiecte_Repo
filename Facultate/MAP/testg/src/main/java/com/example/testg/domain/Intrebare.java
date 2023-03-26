package com.example.testg.domain;


public class Intrebare extends Entity<Integer>{
    // id-ul intrebarii = integer = nrIntrebare

    private String descriere;
    private String v1, v2, v3;

    private Integer punctaj;

    public Intrebare(String descriere, String v1, String v2, String v3, Integer punctaj) {
        this.descriere = descriere;
        this.v1 = v1;
        this.v2 = v2;
        this.v3 = v3;
        this.punctaj = punctaj;
    }

    public Integer getPunctaj() {
        return punctaj;
    }

    public void setPunctaj(Integer punctaj) {
        this.punctaj = punctaj;
    }

    public Integer getNrIntrebare(){
        return getID();
    }

    public void setNrIntrebare(Integer nrIntrebare){
        setID(nrIntrebare);
    }

    public String getDescriere() {
        return descriere;
    }

    public void setDescriere(String descriere) {
        this.descriere = descriere;
    }

    public String getV1() {
        return v1;
    }

    public void setV1(String v1) {
        this.v1 = v1;
    }

    public String getV2() {
        return v2;
    }

    public void setV2(String v2) {
        this.v2 = v2;
    }

    public String getV3() {
        return v3;
    }

    public void setV3(String v3) {
        this.v3 = v3;
    }
}
