package net.javaee.homework.RewardSystem.dao;

import net.javaee.homework.RewardSystem.entity.Job;
import net.javaee.homework.RewardSystem.entity.JobType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface JobTypeDao extends JpaRepository<JobType,String> {
    //查看所有用户
    @Query(value = "select * from job_type",nativeQuery = true)
    List<JobType> checkAllJobType();

    @Transactional
    @Modifying
    @Query(value = "insert into job_type(job_type,job_type_content) value(?1,?2)",nativeQuery = true)
    int insertJobType(String job_type,String job_type_content);

    @Transactional
    @Modifying
    @Query(value = "update job_type set job_type_picture=?2 where job_type=?1",nativeQuery = true)
    int updJobTypePicture(String job_type,String job_type_picture);
}
