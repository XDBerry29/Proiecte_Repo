package com.example.testg;

import com.example.testg.controller.ProfesorController;
import com.example.testg.controller.StudentController;
import com.example.testg.domain.Intrebare;
import com.example.testg.domain.Student;
import com.example.testg.domain.validators.IntrebareValidator;
import com.example.testg.repository.Repository;
import com.example.testg.repository.db.IntrebareDbRepo;
import com.example.testg.repository.db.StudentDbRepo;
import com.example.testg.service.Service;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.List;

 public class HelloApplication extends Application {

    Service service;

    @Override
    public void start(Stage primaryStage) throws IOException {
        String username="postgres";
        String password="postgore";
        String url="jdbc:postgresql://localhost:5432/Restanta";
        Repository<Integer, Intrebare> repoIntrebari = new IntrebareDbRepo(url, username, password, new IntrebareValidator());
        Repository<String, Student> repoStudent = new StudentDbRepo(url, username, password, null);

        service = new Service(repoIntrebari, repoStudent);

        Parameters params = getParameters();
        List<String> list = params.getRaw();
        System.out.println(list.size());
        for(String numeFereastra: list){
            Student student = service.findStudent(numeFereastra);
            System.out.println(numeFereastra);
            studentsView(student);
        }
        profesorView(primaryStage);
        primaryStage.show();
    }

    private void profesorView(Stage stage) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("views/ProfesorView.fxml"));
        AnchorPane Layout = fxmlLoader.load();
        stage.setScene(new Scene(Layout));
        stage.setTitle("Evaluator");

        ProfesorController profesorController = fxmlLoader.getController();
        profesorController.setService(service);
    }

    private void studentsView(Student student) throws IOException{
        Stage stageStudent = new Stage();
        FXMLLoader fxmlLoader = new FXMLLoader(HelloApplication.class.getResource("views/StudentsView.fxml"));
        AnchorPane Layout = fxmlLoader.load();
        stageStudent.setScene(new Scene(Layout));
        stageStudent.setTitle(student.getID());

        StudentController studentController = fxmlLoader.getController();
        studentController.setService(service);

        stageStudent.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}