package net.javaee.homework.RewardSystem.dao;

import net.javaee.homework.RewardSystem.entity.User;
import net.javaee.homework.RewardSystem.entity.UserMoney;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface UserMoneyDao extends JpaRepository<UserMoney,String> {
    //   资金状态调整
    @Transactional
    @Modifying
    @Query(value = "update user_money set user_get_money=?2 where user_id=?1",nativeQuery = true)
    void updUserGetMoney(String user_id,String user_get_money);

    //查看所有用户
    @Query(value = "select * from user_money",nativeQuery = true)
    List<UserMoney> checkAllUserMoney();
}
