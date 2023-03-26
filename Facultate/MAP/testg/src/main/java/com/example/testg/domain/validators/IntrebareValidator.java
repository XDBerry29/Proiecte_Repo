package com.example.testg.domain.validators;

import com.example.testg.domain.Intrebare;

public class IntrebareValidator implements Validator<Intrebare>{
    @Override
    public void validate(Intrebare entity) throws ValidationException {
        // TODO
        String errorMessages="";

        if(entity.getDescriere()==null)
            errorMessages+="Null description!\n";

        if(errorMessages.length()>0)
            throw new ValidationException(errorMessages);
    }
}