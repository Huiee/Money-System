package net.javaee.homework.RewardSystem.service;

import net.javaee.homework.RewardSystem.dao.ChatDao;
import net.javaee.homework.RewardSystem.entity.Chat;
import net.javaee.homework.RewardSystem.entity.ChatList;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ChatService {
    @Resource
    ChatDao chatDao;
    public List<ChatList> checkMessageList(String user_id){
        return chatDao.checkMessageList(user_id);
    }
//
    public     List<ChatList> checkMessageListPlus(String user_id){return chatDao.checkMessageListPlus(user_id);}

    public List<Chat> checkMessage(String speaker_id, String listener_id){
        return chatDao.checkMessage(speaker_id, listener_id);
    }

        public int sendMessage(String speaker_id,String speaker_name ,String listener_id ,String listener_name,String mes_content){
            Date date=new Date();
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String mes_time = sim.format(date);
        System.out.println(mes_time);
         System.out.println(speaker_id+"=="+speaker_name+"=="+listener_id+"=="+listener_name+"=="+mes_content);
        return chatDao.sendMessage(speaker_id, speaker_name, listener_id, listener_name, mes_content, mes_time);
        }


}
