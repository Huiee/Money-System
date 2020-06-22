package net.javaee.homework.RewardSystem.service;

import net.javaee.homework.RewardSystem.dao.UserTagDao;
import net.javaee.homework.RewardSystem.entity.UserTag;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserTagService {
    @Resource
    UserTagDao userTagDao;
    //查询标签
    public List<UserTag> checkUserTags(String user_id){
        return userTagDao.checkUserTags(user_id);
    }

//    public List<UserTag> checkUserTag(String user_id){
//        return userTagDao.checkUserTags(user_id);
//    }
    //检查标签是否重复
    public List<UserTag> checkAddUserTag(String user_id,String user_tag){
        return userTagDao.checkAddUserTag(user_id, user_tag);
    }

    //增加标签
    public int addUserTag( String user_id , String user_tag){
        return userTagDao.addUserTag(user_id, user_tag);
    }

    //删除
    public void deleteUserTag(String user_id){
        userTagDao.deleteUserTag(user_id);
    }


}
