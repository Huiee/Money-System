package net.javaee.homework.RewardSystem.controller;

import net.javaee.homework.RewardSystem.entity.User;
import net.javaee.homework.RewardSystem.entity.UserTag;
import net.javaee.homework.RewardSystem.service.JobService;
import net.javaee.homework.RewardSystem.service.UserService;
import net.javaee.homework.RewardSystem.service.UserTagService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {
    @Resource
    UserService userService;
    @Resource
    UserTagService userTagService;
    @Resource
    JobService jobService;

    //登陆
    @RequestMapping("showLogin")
    public String showLogin(){
        return "login";
    }
    @RequestMapping("login.do")
    public String checkUser(Model model , HttpSession httpSession,String user_id , String user_password){
        List<User> user = userService.checkUser(user_id,user_password);

        if(!user.isEmpty()){
           Boolean user_state= user.get(0).getUser_state();//检查账号是否正常
           System.out.println(user_state);
           if(user_state==false){
               //获取今天日期如果超过就解封
               Date date=new Date();
               SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
               String today = sim.format(date);
                String bolock_time = user.get(0).getUser_bolock_time();
               try {
                   Date date1 = sim.parse(today);
                   Date date2 = sim.parse(bolock_time);
                   int compareTo = date1.compareTo(date2);
                   System.out.println(compareTo);
                    if(compareTo>=0){
                        String user_bolock_time = "";
                        userService.updUserState(user_id,true,user_bolock_time);
                        User userMes = userService.checkUserMessage(user_id);
                        if(userMes.getUser_picture()!=null){
                            model.addAttribute("user_picture",userMes.getUser_picture());
                        }else {
                            model.addAttribute("user_picture","p1.jpg");
                        }
                        httpSession.setAttribute("user_name",user.get(0).getUser_name());
                        httpSession.setAttribute("user_id",user_id);
                        return "showCover";
                    }else{
                        System.out.println("账号被冻结，暂时无法登陆，冻结至:"+user.get(0).getUser_bolock_time());
                        model.addAttribute("block_id","账号被冻结，暂时无法登陆");
                        model.addAttribute("block_time","冻结至："+user.get(0).getUser_bolock_time());
                        return "login";
                    }
               } catch (ParseException e) {
                   e.printStackTrace();
               }
           }

            User userMes = userService.checkUserMessage(user_id);
            if(userMes.getUser_picture()!=null){
               model.addAttribute("user_picture",userMes.getUser_picture());
            }else {
                model.addAttribute("user_picture","p1.jpg");
            }
            httpSession.setAttribute("user_name",user.get(0).getUser_name());
            httpSession.setAttribute("user_id",user_id);
           return "showCover";
        }
        else {
            if(user_id!=null){
            model.addAttribute("login_id",user_id);
            model.addAttribute("error_id","密码错误!");}
            return "login";
        }
    }

    //注册
    @RequestMapping("register.do")
    public String register(Model model){
        Date date=new Date();
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        String today = sim.format(date);
        model.addAttribute("today",today);
        return "register";
    }
    @RequestMapping("addUser.do")
    public String addUser(Model model,HttpSession httpSession,String user_id , String user_name , String user_password , String user_birthday , String user_phone,String user_sex){
        Boolean checkUserID = userService.checkUserId(user_id);
        model.addAttribute("register_id",user_id);
        model.addAttribute("register_phone",user_phone);
        model.addAttribute("register_name",user_name);
        model.addAttribute("register_birthday",user_birthday);
        System.out.println(user_sex);
        //检查用户账号是否存在
        if(checkUserID){
            Boolean user_state = true;
            Boolean user_money_state = true;
            userService.addUser(user_id, user_name, user_password, user_birthday, user_phone,user_sex,user_state,user_money_state);
            return "login";
        }
        model.addAttribute("exist_id","该账号已存在!");
        return "register";
    }
    @RequestMapping("/searchTitle")
    public String searchTitle(HttpSession httpSession,String search_title){
        httpSession.setAttribute("isSearch",true);
        httpSession.setAttribute("searchTitle",search_title);
        System.out.println(search_title);
        return "showCover";
    }
    //首页
    @RequestMapping("/showCover")
    public String showCover(Model model,HttpSession httpSession){
        //查询全部任务
        if(httpSession.getAttribute("isSearch")!=null){
            System.out.println(httpSession.getAttribute("searchTitle"));
            System.out.println(jobService.searchTitleJob((String)httpSession.getAttribute("searchTitle")));
            model.addAttribute("allJob",jobService.searchTitleJob((String)httpSession.getAttribute("searchTitle")));
        }
        //全部用户
         else if(httpSession.getAttribute("selectOrder")!=null){
            if(httpSession.getAttribute("selectOrder").equals("赏金最高")){
                model.addAttribute("allJob",jobService.checkAllJobByLargeMoney());
            }
            if(httpSession.getAttribute("selectOrder").equals("赏金最低")){
                model.addAttribute("allJob",jobService.checkAllJobByLessMoney());
            }
            if(httpSession.getAttribute("selectOrder").equals("默认排序")){
                model.addAttribute("allJob",jobService.checkAllJob());
            }
        }
             else{
                model.addAttribute("allJob",jobService.checkAllJob());
            }

        List<User> allUser = userService.checkAllUser();
        model.addAttribute("allUser",allUser);
        String user_id = (String)httpSession.getAttribute("user_id");
        User userMessage = userService.checkUserMessage(user_id);
        if(userMessage.getUser_picture()!=null){
            model.addAttribute("user_picture",userMessage.getUser_picture());
        }else {
            model.addAttribute("user_picture","p1.jpg");
        }

        return "cover";
    }

    //
    @RequestMapping("/coverOrder")
    public String coverOrder(HttpSession httpSession,String selectOrder){
       httpSession.setAttribute("selectOrder",selectOrder);
        return "showCover";
    }
    //查看用户个人资料
    @RequestMapping("/showUserMessage.do")
    public String getUserId(Model model,HttpSession httpSession,String id){
        httpSession.setAttribute("user_id",id);
        return "showUserMessage";
    }
//查看个人资料
    @RequestMapping("/showUserMessage")
    public String showUserMessage(Model model,HttpSession httpSession){
        String user_id = (String)httpSession.getAttribute("user_id");
        String user_name = (String)httpSession.getAttribute("user_name");
        User userMessage = userService.checkUserMessage(user_id);
        List<UserTag> userTag = userTagService.checkUserTags(user_id);
        if(userMessage.getUser_picture()!=null){
            model.addAttribute("user_picture",userMessage.getUser_picture());
        }else {
            model.addAttribute("user_picture","p1.jpg");

        }
        httpSession.setAttribute("user_name",user_name);
        httpSession.setAttribute("user_id",user_id);
        model.addAttribute("user_sex",userMessage.getUser_sex());
        model.addAttribute("user_birthday",userMessage.getUser_birthday());
        model.addAttribute("user_phone",userMessage.getUser_phone());
        System.out.println(userMessage.getUser_money_state());
        boolean user_money_state =userMessage.getUser_money_state();
            model.addAttribute("user_money_state",userMessage.getUser_money_state());
        if (userMessage.getUser_money()!=null){
            model.addAttribute("user_money",userMessage.getUser_money()+"元");
        }
        else{ model.addAttribute("user_money","0.00元"); }

        if(userMessage.getUser_introduce()!=null){
            model.addAttribute("user_introduce",userMessage.getUser_introduce());}
        else { model.addAttribute("user_introduce","暂无个人简介"); }
        if(userMessage.getUser_introduce_picture()!=null){
            model.addAttribute("isPicture",true);
            model.addAttribute("user_introduce_picture",userMessage.getUser_introduce_picture());
        }
        else{
            model.addAttribute("isPicture",false);
        }
        if(!userTag.isEmpty()){ model.addAttribute("list",userTag); }
        else{
            List<UserTag> list = userTag;
            model.addAttribute("list",list);
        }
        if(userMessage.getUser_money_state()!=true){
            model.addAttribute("user_money_state",userMessage.getUser_money_state());
        }
        return "userMessage";
    }
//进入用户个人资料修改页面
    @RequestMapping("/showMyMessage.do")
    public String showMyMessage(HttpSession httpSession,Model model){
        String user_id = (String)httpSession.getAttribute("user_id");
        User userMessage = userService.checkUserMessage(user_id);
        model.addAttribute("userMessage",userMessage);
        if(userMessage.getUser_picture()!=null){
            model.addAttribute("user_picture",userMessage.getUser_picture());
        }else {
            model.addAttribute("user_picture","p1.jpg");
        }
        return "updateUserMessage";
    }
//    修改用户个人资料
    @RequestMapping("/updateUserMessage.do")
    public  String updateUserMessage(HttpSession httpSession,String new_user_picture,String new_user_name,
                                     String new_user_phone,String new_user_password){
        String user_id = (String)httpSession.getAttribute("user_id");
        User userMessage = userService.checkUserMessage(user_id);
        if(new_user_picture.length()>0){
            userService.updUserPicture(user_id,new_user_picture);
        }
        if (new_user_name!=""&&(!new_user_name.equals(userMessage.getUser_name()))){
            httpSession.setAttribute("user_name",new_user_name);
            userService.updUserName(user_id,new_user_name);
        }
        if (new_user_phone!=""&&(!new_user_phone.equals(userMessage.getUser_phone()))){
            userService.updUserPhone(user_id,new_user_phone);
        }
        if(new_user_password!=""&&(!new_user_password.equals(userMessage.getUser_password()))){
            userService.updUserPassword(user_id,new_user_password);
        }
        System.out.println(new_user_name+"=="+new_user_phone+"=="+new_user_password);
        return "showUserMessage";
    }
//    修改个人介绍
    @RequestMapping("/showUserIntroduce")
    public String showUserIntroduce(HttpSession httpSession,Model model){
        String user_id = (String)httpSession.getAttribute("user_id");
        User userMessage = userService.checkUserMessage(user_id);
        model.addAttribute("user",userMessage);
        return "updateUserIntroduce";
    }
    @RequestMapping("/updateUserIntroduce.do")
    public String updateUserIntroduce(HttpSession httpSession,
                                      String user_introduce,String user_introduce_picture){
        String user_id = (String)httpSession.getAttribute("user_id");
        if(user_introduce_picture.length()>0){
            userService.updUserIntroducePicture(user_id,user_introduce_picture);
        }
        if(user_introduce!=""){
            userService.updUserIntroduce(user_id,user_introduce);
        }
        return "showUserMessage";
    }
    //显示钱包页面
    @RequestMapping("/showAddMoney")
    public String showMoney(HttpSession httpSession,Model model){
        String user_id = (String)httpSession.getAttribute("user_id");
        User userMessage = userService.checkUserMessage(user_id);

        if(userMessage.getUser_money_state()==true) {
            model.addAttribute("money_state",true);
        }
        else {
            model.addAttribute("money_state",true);
        }
            if (userMessage.getUser_money()!=null){
                model.addAttribute("money",userMessage.getUser_money());
                System.out.println("存放"+userMessage.getUser_money());
            }
            else{
                model.addAttribute("money","0.00");
            }
            return "money";
    }

    @RequestMapping("/addMoney.do")
    public String addMoeny(HttpSession httpSession,Model model,String user_money){
        String user_id = (String)httpSession.getAttribute("user_id");
        User user = userService.checkUserMessage(user_id);
        Double oldMoney =0.00;
        if(user.getUser_money()!=null){
            oldMoney=user.getUser_money();
        }
        System.out.println(user_money+"--"+oldMoney);
        Double userMoney =changeStringPrice(user_money);
        Double new_money = userMoney +oldMoney;
        userService.addMoney(user_id, new_money );
        System.out.println(new_money);
        model.addAttribute("money",new_money);

        System.out.println("充值成功");
        return "showAddMoney";
    }

    @RequestMapping("/getMoney.do")
    public String getMoeny(HttpSession httpSession,Model model,String user_money){
        String user_id = (String)httpSession.getAttribute("user_id");
        User user = userService.checkUserMessage(user_id);
        Double oldMoney =0.00;
        if(user.getUser_money()!=null){
            oldMoney=user.getUser_money();
        }
        System.out.println(user_money+"--"+oldMoney);
        Double userMoney =changeStringPrice(user_money);
        Double new_money = oldMoney - userMoney;
        System.out.println(new_money);
        if(new_money<0){
            System.out.println("提取失败");
            model.addAttribute("getMoneyFalse","余额不足");
        }
        else {
        userService.addMoney(user_id, new_money);
        }
        System.out.println("提取成功");
        return "showAddMoney";
    }



    public double changeStringPrice(String price){
        double p = -1;
        try{
            p = Double.parseDouble(price);
        }catch (Exception e){

        }finally {
            return p;
        }
    }
}
