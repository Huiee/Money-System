package net.javaee.homework.RewardSystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_money")
public class UserMoney {
    @Id
    String user_id;
    String user_get_money;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_get_money() {
        return user_get_money;
    }

    public void setUser_get_money(String user_get_money) {
        this.user_get_money = user_get_money;
    }

    @Override
    public String toString() {
        return "UserMoney{" +
                "user_id='" + user_id + '\'' +
                ", user_get_money='" + user_get_money + '\'' +
                '}';
    }
}
