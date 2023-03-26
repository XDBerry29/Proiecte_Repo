package com.example.testg.controller;

import com.example.testg.domain.Intrebare;
//import com.example.testg.observer.Observer;
import com.example.testg.observer.Observer;
import com.example.testg.service.Service;
import javafx.beans.property.ReadOnlyObjectWrapper;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class ProfesorController implements Observer {

    @FXML
    public TableView<Intrebare> tableView;
    @FXML
    public TableColumn<Intrebare, Intrebare> columnNrIntrebare;
    @FXML
    public TableColumn<Intrebare, String> columnDescriere;
    @FXML
    public Button buttonPlaseaza;
    Service service;

    private ObservableList<Intrebare> model =  FXCollections.observableArrayList();

    public void setService(Service service) {
        this.service=service;
        service.addObserver(this);
        initModel();
    }

    @FXML
    public void initialize(){
        columnNrIntrebare.setCellValueFactory(new PropertyValueFactory<>("nrIntrebare"));
        columnDescriere.setCellValueFactory(new PropertyValueFactory<>("descriere"));

        tableView.setItems(model);
    }

    private void initModel() {
        model.setAll();
        model.addAll(service.getAllQuestions());
    }

    public void handlePlaseazaIntrebarea(ActionEvent actionEvent) {
        Intrebare intrebare = tableView.getSelectionModel().getSelectedItem();
        service.addToTest(intrebare);

//        model.setAll();
//        model.addAll(model.stream().filter(intrebare1 -> !Objects.equals(intrebare1.getNrIntrebare(), intrebare.getNrIntrebare())).toList());
        List<Intrebare> modelaux = new ArrayList<>();
        modelaux = model.stream().filter(intrebare1 -> !Objects.equals(intrebare1.getNrIntrebare(), intrebare.getNrIntrebare())).toList();

        model.setAll();
        model.addAll(modelaux);
    }

    @Override
    public void update() {
        //initModel();
    }
}
