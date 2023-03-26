package com.example.testg.service;


import com.example.testg.domain.Intrebare;
import com.example.testg.domain.Student;
import com.example.testg.observer.ObservableI;
import com.example.testg.repository.Repository;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class Service extends ObservableI {
    Repository<Integer, Intrebare> repoIntrebare;
    Repository<String, Student> repoStudent;

    List<Intrebare> test = new ArrayList<>();


    public Service(Repository<Integer, Intrebare> repoIntrebare, Repository<String, Student> repoStudent){
        this.repoIntrebare = repoIntrebare;
        this.repoStudent = repoStudent;
    }

    public List<Intrebare> getAllQuestions() {return repoIntrebare.getAllAsList();}

    public Intrebare findQuestion(Integer id){
        return repoIntrebare.findOne(id);
    }

    public List<Student> getAllStudents() {return repoStudent.getAllAsList();}

    public Student findStudent(String id){
        return repoStudent.findOne(id);
    }

    public List<Intrebare> getTest() {return test;}

    public List<String> getTestQuestionsOnly() {
        List<String> all = new ArrayList<>();
        for(Intrebare i : getTest())
            all.add(i.getNrIntrebare() + ". " + i.getDescriere());
        return all;
    }

    public void addToTest(Intrebare intrebare) {
        test.add(intrebare);
        notifyObservers();
    }
}