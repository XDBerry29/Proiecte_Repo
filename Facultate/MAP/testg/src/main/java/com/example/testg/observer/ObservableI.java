package com.example.testg.observer;

import java.util.ArrayList;
import java.util.List;

public class ObservableI implements Observable{

    List<Observer> lst = new ArrayList<>();
    @Override
    public void addObserver(Observer observer) {
        lst.add(observer);
    }

    @Override
    public void removeObserver(Observer observer) {
        lst.remove(observer);
    }

    @Override
    public void notifyObservers() {
        for(Observer o : lst){
            o.update();
        }
    }

}