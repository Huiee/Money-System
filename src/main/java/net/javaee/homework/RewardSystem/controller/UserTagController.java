package net.javaee.homework.RewardSystem.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import net.javaee.homework.RewardSystem.entity.UserTag;
import net.javaee.homework.RewardSystem.service.UserTagService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class UserTagController {
    @Resource
    UserTagService userTagService;

    @RequestMapping("/addUserTag.do")
    public String addUserTag(Model model, String user_id, String user_tag){
        System.out.println(user_id+"--"+user_tag);
        List<UserTag> userTags = userTagService.checkAddUserTag(user_id, user_tag);
        if(!userTags.isEmpty()){
            model.addAttribute("tag_exist","标签已存在");
        }
        else {
            userTagService.addUserTag(user_id,user_tag);
        }
        return "showUserMessage";
    }
}
