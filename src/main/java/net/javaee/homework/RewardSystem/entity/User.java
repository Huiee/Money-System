package net.javaee.homework.RewardSystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table ( name = "user")
public class User {
    @Id
    String user_id;
    String user_name;
    String user_password;
    String user_birthday;
    String user_phone;
    Double user_money;         //余额
    Boolean user_money_state;  //财产是否冻结状态
    String user_introduce;     //自我介绍
    String user_introduce_picture;
    Boolean user_state;        //检查用户是否封号状态
    String user_bolock_time;   //封号时间
    String user_sex;
    String user_picture;

    public User() {
        super();
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_birthday() {
        return user_birthday;
    }

    public void setUser_birthday(String user_birthday) {
        this.user_birthday = user_birthday;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public Double getUser_money() {
        return user_money;
    }

    public void setUser_money(Double user_money) {
        this.user_money = user_money;
    }

    public Boolean getUser_money_state() {
        return user_money_state;
    }

    public void setUser_money_state(Boolean user_money_state) {
        this.user_money_state = user_money_state;
    }

    public String getUser_introduce() {
        return user_introduce;
    }

    public void setUser_introduce(String user_introduce) {
        this.user_introduce = user_introduce;
    }

    public String getUser_introduce_picture() { return user_introduce_picture; }

    public void setUser_introduce_picture(String user_introduce_picture) { this.user_introduce_picture = user_introduce_picture; }

    public Boolean getUser_state() {
        return user_state;
    }

    public void setUser_state(Boolean user_state) {
        this.user_state = user_state;
    }

    public String getUser_bolock_time() {
        return user_bolock_time;
    }

    public void setUser_bolock_time(String user_bolock_time) {
        this.user_bolock_time = user_bolock_time;
    }

    public String getUser_sex() {
        return user_sex;
    }

    public void setUser_sex(String user_sex) {
        this.user_sex = user_sex;
    }

    public String getUser_picture() {
        return user_picture;
    }

    public void setUser_picture(String user_picture) {
        this.user_picture = user_picture;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id='" + user_id + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_password='" + user_password + '\'' +
                ", user_birthday='" + user_birthday + '\'' +
                ", user_phone='" + user_phone + '\'' +
                ", user_money=" + user_money +
                ", user_money_state=" + user_money_state +
                ", user_introduce='" + user_introduce + '\'' +
                ", user_introduce_picture='" + user_introduce_picture + '\'' +
                ", user_state=" + user_state +
                ", user_bolock_time='" + user_bolock_time + '\'' +
                ", user_sex='" + user_sex + '\'' +
                ", user_picture='" + user_picture + '\'' +
                '}';
    }
}
