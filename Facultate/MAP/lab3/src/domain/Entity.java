package domain;

import java.util.UUID;

public class Entity<ID> {

    private ID id;

    public ID getID(){
        return id;
    }

    public void setID(ID id) {
        this.id = id;
    }

    public Entity(ID id) {
/*        if(id == null) {
            this.id = (ID)(UUID.randomUUID());

        }else {*/
            this.id = id;
        //}
    }
}
