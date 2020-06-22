package net.javaee.homework.RewardSystem.dao;

import net.javaee.homework.RewardSystem.entity.Job;
import net.javaee.homework.RewardSystem.entity.JobType;
import net.javaee.homework.RewardSystem.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


public interface JobDao extends JpaRepository<Job,String> {
    //查看我发布的任务
    @Query(value = "select * from job where employer_id=?1 order by job_time desc ",nativeQuery = true)
    List<Job> checkMyPublishJob(String user_id);
    //模糊标题查询
    @Query(value = " select * from job where job_title like %?1% order by job_time desc ",nativeQuery = true)
    List<Job> searchTitleJob(String job_title);

    //查看全部的任务
    @Query(value = "select * from job order by job_time desc ",nativeQuery = true)
    List<Job> checkAllJob();

    //按金额排序
    @Query(value = "select* from(select employer_id,job_title,job_time,job_type,guide_reward,consult_reward,cash_deposit,job_content,employee_name,is_cash_deposit,job_accept_time,job_state,employer_name,job_deadline_time,job_picture,sum(consult_reward+ guide_reward) as sumReward from job group by employer_id,job_title,job_time,job_type,guide_reward,consult_reward,cash_deposit,job_content,employee_name,is_cash_deposit,job_accept_time,job_state,employer_name,job_deadline_time,job_picture) a order by a.sumReward DESC",nativeQuery = true)
    List<Job> checkAllJobByLargeMoney();

    //按金额排序
    @Query(value = "select* from(select employer_id,job_title,job_time,job_type,guide_reward,consult_reward,cash_deposit,job_content,employee_name,is_cash_deposit,job_accept_time,job_state,employer_name,job_deadline_time,job_picture,sum(consult_reward+ guide_reward) as sumReward from job group by employer_id,job_title,job_time,job_type,guide_reward,consult_reward,cash_deposit,job_content,employee_name,is_cash_deposit,job_accept_time,job_state,employer_name,job_deadline_time,job_picture) a order by a.sumReward ",nativeQuery = true)
    List<Job> checkAllJobByLessMoney();
    //查看该任务详情
    @Query(value = "select * from job where employer_id=?1 and job_title=?2 and job_time=?3 ",nativeQuery = true)
    List<Job> checkJobContent(String employer_id,String job_title,String job_time);
    //发布新任务
    @Transactional
    @Modifying
    @Query(value = "insert into job(employer_id,employer_name,job_time,job_title,job_content ,job_type,job_deadline_time ,job_state,consult_reward ,guide_reward,is_cash_deposit,cash_deposit,job_picture) values(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12,?13)",nativeQuery = true)
    int addJob(String employer_id,String employer_name , String job_time ,
            String job_title , String job_content , String job_type ,
            String job_deadline_time , String job_state,
            Double consult_reward , Double guide_reward,
            Boolean is_cash_deposit, Double cash_deposit,String job_picture);
    //查看该任务详情
    @Query(value = "select * from job where employer_id=?1  and job_time=?2 ",nativeQuery = true)
    List<Job> checkMyJobContent(String employer_id,String job_time);
    //修改任务
    @Transactional
    @Modifying
    @Query(value = "update job set job_content=?3,guide_reward=?4 , consult_reward=?5 where employer_id=?1 and job_time=?2",nativeQuery = true)
    int updateJob(String employer_id,String job_time,String job_content,Double guide_reward,Double consult_reward);

    //删除任务
    @Transactional
    @Modifying
    @Query(value = "delete from job where employer_id=?1 and job_time=?2",nativeQuery = true)
    void deleteJob(String employer_id,String job_time);
}
