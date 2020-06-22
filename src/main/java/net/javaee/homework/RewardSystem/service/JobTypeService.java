package net.javaee.homework.RewardSystem.service;

import net.javaee.homework.RewardSystem.dao.JobTypeDao;
import net.javaee.homework.RewardSystem.entity.JobType;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class JobTypeService {
    @Resource
    JobTypeDao jobTypeDao;

    public List<JobType> checkAllJobType(){
        return jobTypeDao.checkAllJobType();
    }


    public int insertJobType(String job_type,String job_type_content){
        return jobTypeDao.insertJobType(job_type,job_type_content);
    }

    public     int updJobTypePicture(String job_type,String job_type_picture){
        return jobTypeDao.updJobTypePicture(job_type, job_type_picture);
    }
}
