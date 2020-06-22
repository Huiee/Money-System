package net.javaee.homework.RewardSystem.dao;

import net.javaee.homework.RewardSystem.entity.Chat;
import net.javaee.homework.RewardSystem.entity.ChatList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ChatDao extends JpaRepository<Chat,String> {
    //查看聊天列表
   @Query(value = "select distinct new net.javaee.homework.RewardSystem.entity.ChatList(a.speaker_id,a.speaker_name,a.listener_id) from Chat a where a.listener_id = ?1")
    List<ChatList> checkMessageList(String user_id);
    //
    @Query(value = "select distinct new net.javaee.homework.RewardSystem.entity.ChatList(a.listener_id,a.listener_name,a.speaker_id) from Chat a where a.speaker_id = ?1")
    List<ChatList> checkMessageListPlus(String user_id);
    //查看聊天记录
    @Query(value = "select * from chat where (speaker_id=?1 and listener_id =?2) or (speaker_id=?2 and listener_id =?1) order by mes_time",nativeQuery = true)
    List<Chat> checkMessage(String speaker_id, String listener_id);

   @Transactional
    @Modifying
    @Query(value = "insert into  chat(speaker_id,speaker_name ,listener_id,listener_name,mes_content,mes_time) values(?1,?2,?3,?4,?5,?6)",nativeQuery = true)
    int sendMessage(String speaker_id,String speaker_name ,String listener_id ,String listener_name,String mes_content,String mes_time);
}
