package net.javaee.homework.RewardSystem.service;

import net.javaee.homework.RewardSystem.dao.UserMoneyDao;
import net.javaee.homework.RewardSystem.entity.UserMoney;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserMoneyService {
    @Resource
    UserMoneyDao userMoneyDao;
    public void updUserGetMoney(String user_id,String user_get_money){userMoneyDao.updUserGetMoney(user_id, user_get_money);}

    public List<UserMoney> checkAllUserMoney(){return userMoneyDao.checkAllUserMoney();}

}
