package net.javaee.homework.RewardSystem.controller;

import net.javaee.homework.RewardSystem.entity.*;
import net.javaee.homework.RewardSystem.service.ChatService;
import net.javaee.homework.RewardSystem.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ChatController {
    @Resource
    ChatService chatService;
    @Resource
    UserService userService;
    @RequestMapping("/showMessageList")
    public String showMessage(Model model,HttpSession httpSession){
        String user_id =(String) httpSession.getAttribute("user_id");
        List<ChatList> checkMessageList =  chatService.checkMessageList(user_id);
        System.out.println(checkMessageList);
        if(checkMessageList.isEmpty()){
            List<ChatList> checkMessageListPlus =  chatService.checkMessageListPlus(user_id);

            if(!checkMessageListPlus.isEmpty()){
                model.addAttribute("isSpeaker",1);
                model.addAttribute("messageList",checkMessageListPlus);
                System.out.println(chatService.checkMessageListPlus(user_id)+"----");
            }
            else {
            return "showCover";
        }
        }
        else {
            model.addAttribute("isSpeaker",0);
            model.addAttribute("messageList",checkMessageList);
            System.out.println(checkMessageList);

        }
       List<User> checkAllUserList = userService.checkAllUser();
        model.addAttribute("userList",checkAllUserList);
        return "messageList";
    }
    //发送聊天信息
    @RequestMapping("/sendMessage.do")
    public String sendMessage(Model model,HttpSession httpSession,String listener_id, String listener_name, String mes_content){
        model.addAttribute("listener_name",listener_name);
        model.addAttribute("listener_id",listener_id);
        String speaker_id = (String)httpSession.getAttribute("user_id");
        String speaker_name = (String)httpSession.getAttribute("user_name");
        chatService.sendMessage(speaker_id, speaker_name, listener_id, listener_name, mes_content);
        List<Chat> chats = chatService.checkMessage(speaker_id,listener_id);
        System.out.println(chats);
        if (!chats.isEmpty()){
            model.addAttribute("chat",chats);

//        用户本人头像
            User userMessage1 = userService.checkUserMessage(speaker_id);
            if(userMessage1.getUser_picture()!=null){
                model.addAttribute("my_picture",userMessage1.getUser_picture());
            }else {
                model.addAttribute("my_picture","p1.jpg");
            }
//        聊天对象头像
            User userMessage2 = userService.checkUserMessage(listener_id);
            if(userMessage2.getUser_picture()!=null){
                model.addAttribute("user_picture",userMessage2.getUser_picture());
            }else {
                model.addAttribute("user_picture","p1.jpg");
            }
        }
        else{
            List<Chat> list = chats;
//            model.addAttribute("list",list);
            model.addAttribute("chat",list);

        }
        return "message";
    }
    //打开聊天界面
    @RequestMapping("/message.do")
    public  String message(Model model, HttpSession httpSession,String employer_id, String employer_name){
        model.addAttribute("listener_name",employer_name);
        model.addAttribute("listener_id",employer_id);
        String user_id =(String) httpSession.getAttribute("user_id");
        List<Chat> chats = chatService.checkMessage(user_id,employer_id);

//        用户本人头像
        User userMessage1 = userService.checkUserMessage(user_id);
        if(userMessage1.getUser_picture()!=null){
            model.addAttribute("my_picture",userMessage1.getUser_picture());
        }else {
            model.addAttribute("my_picture","p1.jpg");
        }
//        聊天对象头像
        User userMessage2 = userService.checkUserMessage(employer_id);
        if(userMessage2.getUser_picture()!=null){
            model.addAttribute("user_picture",userMessage2.getUser_picture());
        }else {
            model.addAttribute("user_picture","p1.jpg");
        }
        if (!chats.isEmpty()){
            model.addAttribute("chat",chats);
        }
        else{
           List<Chat> list = chats;
//            model.addAttribute("list",list);
            model.addAttribute("chat",chats);

        }
        return "message";
    }
}
