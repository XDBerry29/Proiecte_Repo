package com.example.testg.domain;

public class Student extends Entity<String>{
    private String nume;

    public Student(String nume) {
        this.nume = nume;
    }

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }
}
