package com.example.testg.controller;

import com.example.testg.service.Service;

import com.example.testg.observer.Observer;
import com.example.testg.service.Service;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.scene.control.*;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;

public class StudentController implements Observer {

    /*@FXML
    public TableView<Intrebare> tableView;
    @FXML
    public TableColumn<Intrebare, Intrebare> columnNrIntrebare;
    @FXML
    public TableColumn<Intrebare, String> columnDescriere;
    @FXML
    public Button buttonPlaseaza;*/
    @FXML
    public ListView<String> listView;
    @FXML
    public ButtonBar buttonBar;
    @FXML
    public RadioButton v1Button;
    @FXML
    public RadioButton v2Button;
    @FXML
    public RadioButton v3Button;
    @FXML
    public AnchorPane anchorPaneRaspunsuri;
    Service service;

    private ObservableList<String> model =  FXCollections.observableArrayList();

    public void setService(Service service) {
        this.service=service;
        service.addObserver(this);
        initModel();
    }

    @FXML
    public void initialize(){
        /*columnNrIntrebare.setCellValueFactory(new PropertyValueFactory<>("nrIntrebare"));
        columnDescriere.setCellValueFactory(new PropertyValueFactory<>("descriere"));
        tableView.setItems(model);
        */
        listView.setItems(model);

        /*var vbox = new VBox(10);
        vbox.setPadding(new Insets(10));

        var rb1 = new RadioButton("Easy");
//        rb1.setToggleGroup(tg);
        rb1.setSelected(true);

        var rb2 = new RadioButton("Medium");
//        rb2.setToggleGroup(tg);

        var rb3 = new RadioButton("Hard");
//        rb3.setToggleGroup(tg);

        vbox.getChildren().addAll(new Label("Buna") ,rb1, rb2, rb3);

        AnchorPane.setTopAnchor(vbox, 10d);*/
    }

    private void initModel() {
        model.setAll();
        model.addAll(service.getTestQuestionsOnly());

        /*var vbox = new VBox(10);
        vbox.setPadding(new Insets(10));

        var rb1 = new RadioButton("Easy");
//        rb1.setToggleGroup(tg);
        rb1.setSelected(true);

        var rb2 = new RadioButton("Medium");
//        rb2.setToggleGroup(tg);

        var rb3 = new RadioButton("Hard");
//        rb3.setToggleGroup(tg);

        vbox.getChildren().addAll(new Label("Buna") ,rb1, rb2, rb3);

        AnchorPane.setTopAnchor(vbox, 10d);*/
    }

    @Override
    public void update() {
        initModel();
    }
}