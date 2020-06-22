package net.javaee.homework.RewardSystem.dao;

import net.javaee.homework.RewardSystem.entity.User;
import net.javaee.homework.RewardSystem.entity.UserTag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface UserTagDao extends JpaRepository<UserTag,String> {
    //查询标签
    //查询个人信息
    @Query(value = "select * from user_tags where user_id=?1",nativeQuery = true)
    List<UserTag> checkUserTags(String user_id);

    //检查标签是否重复
    @Query(value = "select * from user_tags where user_id=?1 and user_tag=?2 ",nativeQuery = true)
    List<UserTag> checkAddUserTag(String user_id,String user_tag);
    //增加标签
    @Transactional
    @Modifying
    @Query(value = "insert into user_tags(user_id ,user_tag) values(?1,?2)",nativeQuery = true)
    int addUserTag( String user_id , String user_tag);

    //删除标签
    @Transactional
    @Modifying
    @Query(value = "delete from user_tags where user_id=?1",nativeQuery = true)
    void deleteUserTag(String user_id);

}
