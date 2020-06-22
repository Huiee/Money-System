package net.javaee.homework.RewardSystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name = "job_accept")
public class JobAccept {
    String employer_id;
    String job_time;
    String employee_id ;
    String employee_name ;
    String job_title;
    @Id
    String job_accept_time ;
    String job_finish_time;
    String job_deadline_time;
    String employee_job_state ;
    String employee_job_content;
    String employee_job_result;
    Boolean job_appeal;
    String job_appeal_result;
    String employer_score;

    public JobAccept() {
    }

    public String getJob_title() {
        return job_title;
    }

    public void setJob_title(String job_title) {
        this.job_title = job_title;
    }

    public String getJob_deadline_time() {
        return job_deadline_time;
    }

    public void setJob_deadline_time(String job_deadline_time) {
        this.job_deadline_time = job_deadline_time;
    }

    public String getEmployer_id() {
        return employer_id;
    }

    public void setEmployer_id(String employer_id) {
        this.employer_id = employer_id;
    }

    public String getJob_time() {
        return job_time;
    }

    public void setJob_time(String job_time) {
        this.job_time = job_time;
    }

    public String getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public String getJob_accept_time() {
        return job_accept_time;
    }

    public void setJob_accept_time(String job_accept_time) {
        this.job_accept_time = job_accept_time;
    }

    public String getJob_finish_time() {
        return job_finish_time;
    }

    public void setJob_finish_time(String job_fininsh_time) {
        this.job_finish_time = job_fininsh_time;
    }

    public String getEmployee_job_state() {
        return employee_job_state;
    }

    public void setEmployee_job_state(String employee_job_state) {
        this.employee_job_state = employee_job_state;
    }

    public String getEmployee_job_content() {
        return employee_job_content;
    }

    public void setEmployee_job_content(String employee_job_content) {
        this.employee_job_content = employee_job_content;
    }

    public String getEmployee_job_result() {
        return employee_job_result;
    }

    public void setEmployee_job_result(String employee_job_result) {
        this.employee_job_result = employee_job_result;
    }

    public Boolean getJob_appeal() {
        return job_appeal;
    }

    public void setJob_appeal(Boolean job_appeal) {
        this.job_appeal = job_appeal;
    }

    public String getJob_appeal_result() {
        return job_appeal_result;
    }

    public void setJob_appeal_result(String job_appeal_result) {
        this.job_appeal_result = job_appeal_result;
    }


    public String getEmployer_score() {
        return employer_score;
    }

    public void setEmployer_score(String employer_score) {
        this.employer_score = employer_score;
    }

    @Override
    public String toString() {
        return "JobAccept{" +
                "employer_id='" + employer_id + '\'' +
                ", job_time='" + job_time + '\'' +
                ", employee_id='" + employee_id + '\'' +
                ", employee_name='" + employee_name + '\'' +
                ", job_title='" + job_title + '\'' +
                ", job_accept_time='" + job_accept_time + '\'' +
                ", job_finish_time='" + job_finish_time + '\'' +
                ", job_deadline_time='" + job_deadline_time + '\'' +
                ", employee_job_state='" + employee_job_state + '\'' +
                ", employee_job_content='" + employee_job_content + '\'' +
                ", employee_job_result='" + employee_job_result + '\'' +
                ", job_appeal=" + job_appeal +
                ", job_appeal_result='" + job_appeal_result + '\'' +
                ", employer_score='" + employer_score + '\'' +
                '}';
    }
}
