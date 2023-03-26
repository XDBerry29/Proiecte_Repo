package domain.validators;

import domain.Utilizator;

import java.time.Year;

public class UtilizatorValidator implements Validator<Utilizator> {

    @Override
    public void validate(Utilizator entity) throws ValidationExceptions {

        String errorMessages="";

        if(entity.getNume()==null)
            errorMessages+="Null name!\n";

        if(entity.getPrenume()==null)
            errorMessages+="Null surname!\n";

        if(!entity.getEmail().contains("@"))
            //throw new ValidationException("Invalid email format!");
            errorMessages+="Invalid email format!\n";

        if(entity.getParola().length() <= 5)
            //throw new ValidationException("Password too short!");
            errorMessages+="Password too short!\n";

        String[] ZiLunaAn = entity.getDataNasterii().split("\\.");
        int zi = Integer.parseInt(ZiLunaAn[0]), luna = Integer.parseInt(ZiLunaAn[1]), an = Integer.parseInt(ZiLunaAn[2]);
        Year thisYear = Year.now();
        if(zi > 31)
            //throw new ValidationException("Ziua invalida!");
            errorMessages+="Ziua invalida!\n";
        if(luna > 12)
            //throw new ValidationException("Luna invalida!");
            errorMessages+="Luna invalida!\n";
        if(an < 1922 || an > thisYear.getValue())
            //throw new ValidationException("An invalid!");
            errorMessages+="An invalid!\n";

        if(errorMessages.length()>0)
            throw new ValidationExceptions(errorMessages);
    }
}
