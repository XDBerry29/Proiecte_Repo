module com.example.testg {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens com.example.testg to javafx.fxml;
    exports com.example.testg;

    opens com.example.testg.domain to javafx.fxml;
    exports com.example.testg.domain;

    opens com.example.testg.service to javafx.fxml;
    exports com.example.testg.service;

    opens com.example.testg.repository to javafx.fxml;
    exports com.example.testg.repository;

    opens com.example.testg.controller to javafx.fxml;
    exports com.example.testg.controller;
}