package net.javaee.homework.RewardSystem.service;

import net.javaee.homework.RewardSystem.dao.JobDao;
import net.javaee.homework.RewardSystem.entity.Job;
import net.javaee.homework.RewardSystem.entity.JobType;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class JobService {
    @Resource
    JobDao jobDao;

    public int addJob(String employer_id,String employer_name ,
                String job_title , String job_content , String job_type ,
                String job_deadline_time ,
                Double consult_reward , Double guide_reward,
                Boolean is_cash_deposit, Double cash_deposit,String job_picture){
        Date date=new Date();
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String job_time = sim.format(date);
        String job_state = "招募中";
        System.out.println(job_time);
        return jobDao.addJob(employer_id, employer_name, job_time, job_title, job_content, job_type, job_deadline_time, job_state, consult_reward, guide_reward, is_cash_deposit, cash_deposit,job_picture);
    }

    public List<Job> checkMyPublishJob(String user_id){
        return jobDao.checkMyPublishJob(user_id);
    }

    public List<Job> searchTitleJob(String job_title){ return  jobDao.searchTitleJob(job_title);}

//    金额排序
    public List<Job> checkAllJobByLargeMoney(){
        return jobDao.checkAllJobByLargeMoney();
    }
    public List<Job> checkAllJobByLessMoney(){
        return jobDao.checkAllJobByLessMoney();
    }


    public  List<Job> checkAllJob(){
        return jobDao.checkAllJob();
    }

    public List<Job> checkJobContent(String employer_id,String job_title,String job_time){
        return jobDao.checkJobContent(employer_id, job_title, job_time);
    }

    public List<Job> checkMyJobContent(String employer_id,String job_time){
        return jobDao.checkMyJobContent(employer_id, job_time);
    }

    public int updateJob(String employer_id,String job_time,String job_content,Double guide_reward,Double consult_reward){
        return jobDao.updateJob(employer_id, job_time, job_content, guide_reward, consult_reward);
    }

    public void deleteJob(String employer_id,String job_time){
        jobDao.deleteJob(employer_id, job_time);
    }


}
