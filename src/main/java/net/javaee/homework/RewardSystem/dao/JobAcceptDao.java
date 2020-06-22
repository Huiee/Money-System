package net.javaee.homework.RewardSystem.dao;

import net.javaee.homework.RewardSystem.entity.JobAccept;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface JobAcceptDao extends JpaRepository<JobAccept,String> {
    //查看我接的任务
    @Query(value = "select * from job_accept where employee_id=?1 ",nativeQuery = true)
    List<JobAccept> checkMyAcceptJob(String user_id);

    //查看我发布的
    @Query(value = "select * from job_accept where employer_id=?1 ",nativeQuery = true)
    List<JobAccept> checkMyPublishJob(String user_id);
    //查看是否接过该任务
    @Query(value = "select * from job_accept where employee_id=?1 and employer_id =?2 and job_time=?3 ",nativeQuery = true)
    List<JobAccept> checkIsAcceptJob(String employee_id,String employer_id,String job_time);
    //接任务
    @Transactional
    @Modifying
    @Query(value = "insert into job_accept(employer_id,job_title,job_time,job_deadline_time,employee_id,employee_name,employee_job_state,job_accept_time) values(?1,?2,?3,?4,?5,?6,?7,?8)",nativeQuery = true)
    void acceptJob(String employer_id,String job_title , String job_time ,String job_deadline_time ,
                String employee_id,String  employee_name,
                String employee_job_state,String job_accept_time);
    //提交任务
    @Transactional
    @Modifying
    @Query(value = "update job_accept set employee_job_content=?4,job_finish_time=?5 , employee_job_state=?6 where employee_id=?1 and employer_id=?2 and job_time=?3",nativeQuery = true)
    int submitJob(String user_id,String employer_id,String job_time,String employee_job_content,String job_finish_time,String employee_job_state);

    //查询该任务是否被接
    @Query(value = "select * from job_accept where employer_id=?1 and job_time=?2 ",nativeQuery = true)
    List<JobAccept> checkMyJobIsAccept(String employer_id,String job_time);

    //审核任务结果
    @Transactional
    @Modifying
    @Query(value = "update job_accept set employee_job_result=?4 where employer_id=?1 and employee_id=?2 and job_time=?3",nativeQuery = true)
    int setJobResult(String employer_id,String employee_id,String job_time,String employee_job_result);

    //审核任务结果

    @Transactional
    @Modifying
    @Query(value = "update job_accept set job_appeal=?4 where employer_id=?1 and employee_id=?2 and job_time=?3",nativeQuery = true)
    void updAppealJob(String employer_id,String employee_id,String job_time,Boolean job_appeal);
//    查询该任务是否被接
    @Query(value = "select * from job_accept where job_appeal=?1 ",nativeQuery = true)
    List<JobAccept> checkUserAppeal(Boolean job_appeal);
    //审核任务结果

    @Transactional
    @Modifying
    @Query(value = "update job_accept set job_appeal_result=?4 where employer_id=?1 and employee_id=?2 and job_time=?3",nativeQuery = true)
    void updAppealJobReulst(String employer_id,String employee_id,String job_time,String job_appeal_result);

}

