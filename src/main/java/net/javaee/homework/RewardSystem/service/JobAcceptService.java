package net.javaee.homework.RewardSystem.service;

import net.javaee.homework.RewardSystem.dao.JobAcceptDao;
import net.javaee.homework.RewardSystem.entity.JobAccept;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class JobAcceptService {
    @Resource
    JobAcceptDao jobAcceptDao;

        public List<JobAccept> checkMyAcceptJob(String user_id){
        return jobAcceptDao.checkMyAcceptJob(user_id);
    }
    public List<JobAccept> checkMyPublishJob(String user_id){
        return jobAcceptDao.checkMyPublishJob(user_id);
    }

    //查看是否接过该工作
   public List<JobAccept> checkIsAcceptJob(String employee_id,String employer_id,String job_time){
            return jobAcceptDao.checkIsAcceptJob(employee_id, employer_id, job_time);
    }
//接任务
    public void acceptJob(String employer_id,String job_title , String job_time ,String job_deadline_time ,
                           String employee_id,String  employee_name){
        Date date=new Date();
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String job_accept_time = sim.format(date);
        String employee_job_state = "待完成";
        System.out.println(job_accept_time);
        jobAcceptDao.acceptJob(employer_id, job_title, job_time, job_deadline_time, employee_id, employee_name, employee_job_state,job_accept_time);
    }
    //提交任务
    public int submitJob(String user_id,String employer_id,String job_time,String employee_job_content){
        Date date=new Date();
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String job_finish_time = sim.format(date);
        String employee_job_state = "已完成";
        System.out.println(job_finish_time);
        return jobAcceptDao.submitJob(user_id,employer_id,job_time,employee_job_content,job_finish_time,employee_job_state);
    }
    //查看我发布的任务接受情况
    public List<JobAccept> checkMyJobIsAccept(String employer_id,String job_time){
            return jobAcceptDao.checkMyJobIsAccept(employer_id,job_time);
    }

    //
    public int setJobResult(String employer_id,String employee_id,String job_time,String employee_job_result){
            return jobAcceptDao.setJobResult(employer_id, employee_id, job_time, employee_job_result);
    }

//    申诉
    public void updAppealJob(String employer_id,String employee_id,String job_time,Boolean job_appeal){
            jobAcceptDao.updAppealJob(employer_id, employee_id, job_time, job_appeal);
    }

    public     void updAppealJobResult(String employer_id,String employee_id,String job_time,String job_appeal_result){
            jobAcceptDao.updAppealJobReulst(employer_id, employee_id, job_time, job_appeal_result);
    }

    public List<JobAccept> checkUserAppeal(){
            Boolean job_accept =true;
          return jobAcceptDao.checkUserAppeal(job_accept);
    }

}
