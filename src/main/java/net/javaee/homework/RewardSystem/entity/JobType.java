package net.javaee.homework.RewardSystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "job_type")
public class JobType {
    @Id
    String job_type;
    String job_type_content;
    String job_type_picture;

    public String getJob_type() {
        return job_type;
    }

    public void setJob_type(String job_type) {
        this.job_type = job_type;
    }

    public String getJob_type_content() {
        return job_type_content;
    }

    public void setJob_type_content(String job_type_content) {
        this.job_type_content = job_type_content;
    }

    public String getJob_type_picture() {
        return job_type_picture;
    }

    public void setJob_type_picture(String job_type_picture) {
        this.job_type_picture = job_type_picture;
    }

    @Override
    public String toString() {
        return "JobType{" +
                "job_type='" + job_type + '\'' +
                ", job_type_content='" + job_type_content + '\'' +
                ", job_type_picture='" + job_type_picture + '\'' +
                '}';
    }
}
