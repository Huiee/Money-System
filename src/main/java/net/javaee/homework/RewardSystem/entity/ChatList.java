package net.javaee.homework.RewardSystem.entity;

import javax.persistence.Entity;


public class ChatList {
    String speaker_id;
    String speaker_name;
    String listener_id;


    public ChatList(String speaker_id, String speaker_name, String listener_id) {
        this.speaker_id = speaker_id;
        this.speaker_name = speaker_name;
        this.listener_id = listener_id;
    }

    public ChatList() {
    }

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

    @Override
    public String toString() {
        return "ChatList{" +
                "speaker_id='" + speaker_id + '\'' +
                ", speaker_name='" + speaker_name + '\'' +
                ", listener_id='" + listener_id + '\'' +
                '}';
    }
}
