package net.javaee.homework.RewardSystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_tags")
public class UserTag {
    @Id
    Integer num;
    String user_id ;
    String user_tag ;

    public UserTag() {
        super();
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_tag() {
        return user_tag;
    }

    public void setUser_tag(String user_tag) {
        this.user_tag = user_tag;
    }

    @Override
    public String toString() {
        return "UserTag{" +
                "num=" + num +
                ", user_id='" + user_id + '\'' +
                ", user_tag='" + user_tag + '\'' +
                '}';
    }
}
