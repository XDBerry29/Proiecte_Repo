package domain.validators;

import domain.Prietenie;

import java.util.Objects;

public class PrietenieValidator implements Validator<Prietenie> {
    @Override
    public void validate(Prietenie entity) throws ValidationExceptions {
        if(entity.getID1()==0)
            throw new ValidationExceptions("\nID prieten 1 Invalid!\n");
        if(entity.getID2()==0)
            throw new ValidationExceptions("\nID prieten 2 Invalid!\n");
        if(entity.getID()==null) //null
            throw new ValidationExceptions("\nID Invalid!\n");
        if(Objects.equals(entity.getID1(), entity.getID2()))
            throw new ValidationExceptions("\nID uri identice!\n");
    }
}
