package net.javaee.homework.RewardSystem.service;

import net.javaee.homework.RewardSystem.dao.UserDao;
import net.javaee.homework.RewardSystem.entity.Job;
import net.javaee.homework.RewardSystem.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {
    @Resource
    UserDao userDao;
    //注册
    //1.查询ID是否重复(注册)
    public boolean checkUserId(String user_id){
        List<User> user = userDao.checkUserId(user_id);
        if(!user.isEmpty()){
            return false;
        }
        return true;
    }
    //2.ID不重复则可增加新用户
    public int addUser( String user_id , String user_name , String user_password , String user_birthday , String user_phone ,String user_sex,Boolean user_state,Boolean user_money_state){
        return userDao.addUser(user_id , user_name ,user_password , user_birthday , user_phone ,user_sex,user_state,user_money_state);
    }

    //登陆验证
    public List<User> checkUser(String user_id, String user_password){
        return  userDao.checkUser(user_id,user_password);
    }

    //查看个人信息
    public User checkUserMessage(String user_id){
       return  userDao.checkUserMessage(user_id);
    }

    //充值
    public void addMoney(String user_id,Double user_money){
        userDao.addMoney(user_id, user_money);
    }
//修改个人信息
    public void updUserPicture(String user_id,String picture){
        userDao.updUserPicture(user_id,picture);
    }


    public void updUserName(String user_id,String user_name){
        userDao.updUserName(user_id, user_name);
    }


    public void updUserPhone(String user_id,String user_phone){
        userDao.updUserPhone(user_id, user_phone);
    }


    public void updUserPassword(String user_id,String user_password){
        userDao.updUserPassword(user_id, user_password);
    }

    public List<User> checkAllUser(){
        return  userDao.checkAllUser();
    }

    public List<User> searchUserId(String user_id){return userDao.searchUserId(user_id);}

    public void updUserIntroduce(String user_id,String user_introduce){
        userDao.updUserIntroduce(user_id, user_introduce);
    }


    public void updUserIntroducePicture(String user_id,String user_introduce_picture){
        userDao.updUserIntroducePicture(user_id, user_introduce_picture);
    }

    public void updUserMoney(String user_id,Boolean user_money_state){
       userDao.updUserMoney(user_id, user_money_state);
    }

    //   账号状态调整
    public void updUserState(String user_id,Boolean user_state,String user_bolock_time){
        userDao.updUserState(user_id, user_state, user_bolock_time);
    }
}
