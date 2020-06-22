package net.javaee.homework.RewardSystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name = "job")
public class Job {

    String employer_id ;
    String employer_name;
    String job_picture ;
    String employee_name ;
    @Id
    String job_time ; //发布时间
    String job_accept_time;
    String job_title ;//任务标题
    String job_content ;//任务内容
    String job_type ;//任务类型
    String job_deadline_time ;//任务期限
    String job_state;//任务状态：招聘中，进行中，已完成
    Double consult_reward ;//赏金金额
    Double guide_reward ;//赏金金额
    Boolean is_cash_deposit;//是否需要保证金
    Double cash_deposit;//保证金额

    public Job() {
        super();
    }

    public String getEmployer_id() {
        return employer_id;
    }

    public void setEmployer_id(String employer_id) {
        this.employer_id = employer_id;
    }

    public String getEmployer_name() {
        return employer_name;
    }

    public void setEmployer_name(String employer_name) {
        this.employer_name = employer_name;
    }

    public String getJob_picture() { return job_picture; }

    public void setJob_picture(String job_picture) { this.job_picture = job_picture; }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public String getJob_time() {
        return job_time;
    }

    public void setJob_time(String job_time) {
        this.job_time = job_time;
    }

    public String getJob_accept_time() { return job_accept_time; }

    public void setJob_accept_time(String job_accept_time) { this.job_accept_time = job_accept_time; }

    public String getJob_title() {
        return job_title;
    }

    public void setJob_title(String job_title) {
        this.job_title = job_title;
    }

    public String getJob_content() {
        return job_content;
    }

    public void setJob_content(String job_content) {
        this.job_content = job_content;
    }

    public String getJob_type() {
        return job_type;
    }

    public void setJob_type(String job_type) {
        this.job_type = job_type;
    }

    public String getJob_deadline_time() {
        return job_deadline_time;
    }

    public void setJob_deadline_time(String job_deadline_time) {
        this.job_deadline_time = job_deadline_time;
    }

    public String getJob_state() {
        return job_state;
    }

    public void setJob_state(String job_state) {
        this.job_state = job_state;
    }

    public Double getConsult_reward() {
        return consult_reward;
    }

    public void setConsult_reward(Double consult_reward) {
        this.consult_reward = consult_reward;
    }

    public Double getGuide_reward() {
        return guide_reward;
    }

    public void setGuide_reward(Double guide_reward) {
        this.guide_reward = guide_reward;
    }

    public Boolean getIs_cash_deposit() {
        return is_cash_deposit;
    }

    public void setIs_cash_deposit(Boolean is_cash_deposit) {
        this.is_cash_deposit = is_cash_deposit;
    }

    public Double getCash_deposit() {
        return cash_deposit;
    }

    public void setCash_deposit(Double cash_deposit) {
        this.cash_deposit = cash_deposit;
    }

    @Override
    public String  toString() {
        return "Job{" +
                "employer_id='" + employer_id + '\'' +
                ", employer_name='" + employer_name + '\'' +
                ", job_picture='" + job_picture + '\'' +
                ", employee_name='" + employee_name + '\'' +
                ", job_time='" + job_time + '\'' +
                ", job_accept_time='" + job_accept_time + '\'' +
                ", job_title='" + job_title + '\'' +
                ", job_content='" + job_content + '\'' +
                ", job_type='" + job_type + '\'' +
                ", job_deadline_time='" + job_deadline_time + '\'' +
                ", job_state='" + job_state + '\'' +
                ", consult_reward=" + consult_reward +
                ", guide_reward=" + guide_reward +
                ", is_cash_deposit=" + is_cash_deposit +
                ", cash_deposit=" + cash_deposit +
                '}';
    }
}
