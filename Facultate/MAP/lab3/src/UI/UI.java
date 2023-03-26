package UI;

import domain.Prietenie;
import domain.validators.ValidationExceptions;
import service.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;
import java.util.Scanner;

public class UI {
    private final Scanner scanner;
    private final Service service;

    public UI(Service service){
        this.service=service;
        this.scanner=new Scanner(System.in); //citeste de la standard imput
    }

    public void start() {
        int alegere;
        while (true) {
            printeazaMeniu();
            System.out.print("Alegerea dvs. este: ");
            alegere=scanner.nextInt();

            //eliminare \n in plus
            scanner.nextLine();

            switch(alegere){
                case 1 -> adaugaPrietenie();
                case 2 -> stergePrietenie();

                case 3 -> printeazaPrietenii();

                case 4 -> adaugaUtilizator();
                case 5 -> stergeUtilizator();
                case 6 -> modificaUtilizator();
                case 7 -> printeazaUtilizatori();

                case 8 -> numarComunitati();
                case 9 -> ceamaiSociabilaComunitate();
                case 10 -> System.exit(0);
                default -> System.out.println("Alegere invalida!");
            }
        }
    }

    private void printeazaMeniu(){
        System.out.println("1. Adauga prietenie");
        System.out.println("2. Sterge prietenie");
        System.out.println("3. Afiseaza lista de prietenii\n");
        System.out.println("4. Adauga utilizator");
        System.out.println("5. Sterge utilizator");
        System.out.println("6. Modifica utilizator");
        System.out.println("7. Afiseaza lista de utilizatori\n");
        System.out.println("8. Vezi nr de comunitati");
        System.out.println("9. Vezi cea mai sociabila comunitate\n");
        System.out.println("10. Exit");
    }

    private void printeazaPrietenii(){
        System.out.println("Lista de prietenii:");
        for (Prietenie fr : service.getAllPrietenii()) {
            String nume1 = service.findUser(fr.getID1()).getNume();
            String nume2 = service.findUser(fr.getID2()).getNume();
            System.out.println("Prietenie cu ID: " + fr.getID() +" intre " + nume1 + " si " + nume2 + " la data: " + fr.getFriendsFrom());
        }
        //service.getAllPrietenii().forEach(System.out::println);
    }

    private String citire(String text) {
        System.out.print(text);
        return scanner.nextLine();
    }
    private void adaugaPrietenie(){
        Long ID1, ID2;
        ID1=Long.parseLong(citire("ID prieten 1: "));
        ID2=Long.parseLong(citire("ID prieten 2: "));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime now = LocalDateTime.now();
        String dateTimeString = now.format(formatter);
        LocalDateTime friendsFrom = LocalDateTime.parse(dateTimeString, formatter);
        if(service.addFriendship(ID1,ID2, friendsFrom))
            System.out.println("Prietenie adaugata cu succes!\n");
        else System.out.println("Nu au avut loc modificari!\n");
    }
    private void stergePrietenie(){
        //int ID = Integer.parseInt(citire("ID prietenie de sters: "));
        String ID = citire("ID prietenie de sters: ");
        if(service.deleteFriendship(ID))
            System.out.println("Prietenie stearsa cu succes!\n");
        else System.out.println("Nu au avut loc modificari!\n");
    }

    private void adaugaUtilizator(){
        //String string1=citire("ID: ");
        //Long ID = Long.parseLong(string1);
        String string2=citire("Nume: ");
        String string3=citire("Prenume: ");
        String string4=citire("Email: ");
        String string5=citire("Parola: ");
        String string6=citire("Data nasterii: ");
        if(service.addUser(string2, string3, string4, string5, string6))
            System.out.println("Utilizator adaugat cu succes!\n");
        else System.out.println("Nu au avut loc modificari!\n");
    }

    private void modificaUtilizator(){
        String string1=citire("ID-ul utilizatorului de modificat: ");
        Long ID = Long.parseLong(string1);
        String string2=citire("Nume nou: ");
        String string3=citire("Prenume nou: ");
        String string4=citire("Email nou: ");
        String string5=citire("Parola noua: ");
        String string6=citire("Data nasterii noua: ");
        if(service.updateUser(ID, string2, string3, string4, string5, string6))
            System.out.println("Utilizator modificat cu succes!\n");
        else System.out.println("Nu au avut loc modificari!\n");
    }

    private void stergeUtilizator(){
        Long ID = Long.parseLong(citire("ID utilizator de sters: "));
        if(service.deleteUser(ID))
            System.out.println("Utilizator sters cu succes!\n");
        else System.out.println("Nu au avut loc modificari!\n");
    }

    private void printeazaUtilizatori(){
        System.out.println("Lista de utilizatori:");
        service.getAll().forEach(System.out::println);
    }

    private void numarComunitati(){
        /*Retea network =new Retea(Math.toIntExact(10000));
        network.addUtilizatori(service.getAll());
        network.addPrietenii(service.getAllPrietenii());
        System.out.println("Componente conexe: " + network.numarComunitati());*/

        System.out.println("Numar de comunitati (componente conexe): " + service.numarComunitati());
    }

    private void ceamaiSociabilaComunitate() {

        /*Retea network = new Retea(10000);
        network.addUtilizatori(service.getAll());
        network.addPrietenii(service.getAllPrietenii());
        System.out.println(network.biggestComponent());
        service.getAll().forEach(x -> network.biggestComponent().forEach(y ->{
            if (Objects.equals(Integer.parseInt(String.valueOf(x.getID())), y))
                System.out.println(x.getNume()+ " " + x.getPrenume());
        }));*/
        System.out.println("Numele utilizatorilor din cea mai sociabila comunitate:");
        System.out.println(service.ceamaiSociabilaComunitate2());
        System.out.println("Numele utilizatorilor din cea mai sociabila comunitate:");

        service.getAll().forEach(x -> service.ceamaiSociabilaComunitate2().forEach(y ->{
            if (Objects.equals(Integer.parseInt(String.valueOf(x.getID())), y))
                System.out.println(x.getNume()+ " " + x.getPrenume());
        }));
    }
}