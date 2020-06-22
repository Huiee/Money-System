package net.javaee.homework.RewardSystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table( name = "chat")
public class Chat {


    String speaker_id;
    String speaker_name;
    String listener_id;
    String listener_name;
    @Id
    String mes_content;
    String mes_time;



    public String getSpeaker_id() {
        return speaker_id;
    }

    public void setSpeaker_id(String speaker_id) {
        this.speaker_id = speaker_id;
    }

    public String getSpeaker_name() {
        return speaker_name;
    }

    public void setSpeaker_name(String speaker_name) {
        this.speaker_name = speaker_name;
    }

    public String getListener_id() {
        return listener_id;
    }

    public void setListener_id(String listener_id) {
        this.listener_id = listener_id;
    }

    public String getListener_name() {
        return listener_name;
    }

    public void setListener_name(String listener_name) {
        this.listener_name = listener_name;
    }

    public String getMes_content() {
        return mes_content;
    }

    public void setMes_content(String mes_content) {
        this.mes_content = mes_content;
    }

    public String getMes_time() {
        return mes_time;
    }

    public void setMes_time(String mes_time) {
        this.mes_time = mes_time;
    }

    public Chat() {
        super();
    }

    public Chat(String speaker_id, String speaker_name, String listener_id) {
        this.speaker_id = speaker_id;
        this.speaker_name = speaker_name;
        this.listener_id = listener_id;
    }

    @Override
    public String toString() {
        return "Chat{" +

                ", speaker_id='" + speaker_id + '\'' +
                ", speaker_name='" + speaker_name + '\'' +
                ", listener_id='" + listener_id + '\'' +
                ", listener_name='" + listener_name + '\'' +
                ", mes_content='" + mes_content + '\'' +
                ", mes_time='" + mes_time + '\'' +
                '}';
    }
}
