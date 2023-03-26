import UI.UI;
import domain.Entity;
import domain.Prietenie;
import domain.Utilizator;
import domain.validators.PrietenieValidator;
import domain.validators.UtilizatorValidator;
import domain.validators.ValidationExceptions;
import domain.validators.Validator;
import repository.InMemoryRepository;
import repository.Repository;
import repository.db.PrietenieDbRepository;
import repository.db.UtilizatorDbRepository;
import repository.file.AbstractFileRepository;
import repository.file.PrietenieFile;
import repository.file.UtilizatorFile;
import service.Service;
import UI.UI;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;

public class Main {
    public static void main(String[] args) {

        Validator<Utilizator> valUtilizator = new UtilizatorValidator();
        Validator<Prietenie> valPretenie = new PrietenieValidator();
        Repository<Long, Utilizator> repoUtilizator = new UtilizatorFile("src/repository/file/users.txt", valUtilizator);
        Repository<String, Prietenie> repoPrietenie = new PrietenieFile("src/repository/file/friends.txt", valPretenie);

        /*Repository<String, Prietenie> repoDBPrietenie = new PrietenieDbRepository("jdbc:postgresql://localhost:5432/SocialNetwork", "postgres","postgore", valPretenie);
        Repository<Long, Utilizator> repoDBUtilizator = new UtilizatorDbRepository("jdbc:postgresql://localhost:5432/SocialNetwork","postgres","postgore", valUtilizator);*/

        Service srv = new Service(repoUtilizator, repoPrietenie);
//         Service srv = new Service(repoDBUtilizator, repoDBPrietenie);

        UI ui = new UI(srv);

        ui.start();
    }
}