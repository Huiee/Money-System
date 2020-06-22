package net.javaee.homework.RewardSystem.controller;

import net.javaee.homework.RewardSystem.entity.Chat;
import net.javaee.homework.RewardSystem.entity.Job;
import net.javaee.homework.RewardSystem.entity.JobAccept;
import net.javaee.homework.RewardSystem.entity.User;
import net.javaee.homework.RewardSystem.service.*;
import org.hibernate.annotations.Entity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class AdminController {
    @Resource
    UserService userService;
    @Resource
    JobService jobService;
    @Resource
    JobAcceptService jobAcceptService;
    @Resource
    ChatService chatService;
    @Resource
    UserMoneyService userMoneyService;
    @Resource
    JobTypeService jobTypeService;
    //登陆
    @RequestMapping("/showAdminLogin")
    public String showAdminLogin(){
        return "adminLogin";
    }
    @RequestMapping("/adminLogin.do")
    public String adminLogin(HttpSession httpSession,String user_id, String user_password){
        if(user_id.equals("Admin")&&user_password.equals("123")){
           httpSession.setAttribute("user_id",user_id);
            return "showAdminCover";
        }
        else {
            return "adminLogin";
        }
    }
    //首页搜索任务内容
    @RequestMapping("/adminSearchTitle")
    public String searchTitle(HttpSession httpSession,String search_title){
        httpSession.setAttribute("isSearch",true);
        httpSession.setAttribute("searchTitle",search_title);
        System.out.println(search_title);
        return "showAdminCover";
    }
    @RequestMapping("/showAdminCover")
    public String showAdminCover(HttpSession httpSession, Model model){
        //查询全部任务
        if(httpSession.getAttribute("isSearch")!=null){
            System.out.println(httpSession.getAttribute("searchTitle"));
            System.out.println(jobService.searchTitleJob((String)httpSession.getAttribute("searchTitle")));
            model.addAttribute("allJob",jobService.searchTitleJob((String)httpSession.getAttribute("searchTitle")));
        }else{
            model.addAttribute("allJob",jobService.checkAllJob());
        }
        //全部用户
        List<User> allUser = userService.checkAllUser();
        model.addAttribute("allUser",allUser);
        String user_id = (String)httpSession.getAttribute("user_id");
        User userMessage = userService.checkUserMessage(user_id);
        if(userMessage.getUser_picture()!=null){
            model.addAttribute("user_picture",userMessage.getUser_picture());
        }else {
            model.addAttribute("user_picture","p1.jpg");
        }
        return "adminCover";
    }
    //查看用户信息
    @RequestMapping("/checkAllUser.do")
    public String checkAllUser(Model model){
        List<User> users = userService.checkAllUser();
        model.addAttribute("users",users);
        Date date=new Date();
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        String today = sim.format(date);
        model.addAttribute("today",today);
        return "adminCheckUserMessage";
    }

    //首页搜索任务内容
    @RequestMapping("/adminSearchUserId")
    public String searchUserId(HttpSession httpSession,Model model,String search_user_id){
        httpSession.setAttribute("isSearchUserId",true);
        httpSession.setAttribute("searchUserId",search_user_id);
        List<User> users = userService.searchUserId(search_user_id);
        model.addAttribute("users",users);
        Date date=new Date();
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        String today = sim.format(date);
        model.addAttribute("today",today);
        return "adminCheckUserMessage";
    }

//    资金操作
    @RequestMapping("/UserMoneyBlock")
    public String UserMoneyBlock(String user_id){
        System.out.println(user_id+"冻结");
        userService.updUserMoney(user_id,false);
        return "checkAllUser.do";
    }
    @RequestMapping("/UserMoneyFree")
    public String UserMoneyFree(String user_id){
        System.out.println(user_id+"解冻");
        userService.updUserMoney(user_id,true);

        return "checkAllUser.do";
    }
    // 账号操作
    @RequestMapping("/ChangeUserState")
    public String changeUserState(String user_id,String new_user_bolock_time){
        System.out.println(user_id);
        String user_bolock_time =new_user_bolock_time;
        user_bolock_time = user_bolock_time.replace(",","");
        System.out.println(user_bolock_time);
//        冻结账号
        if(user_bolock_time.length()>=2){
            userService.updUserState(user_id,false,user_bolock_time);
        }
        return "checkAllUser.do";
    }
    @RequestMapping("/UserStateFree")
    public String UserStateFree(String user_id){
        System.out.println(user_id);
        String user_bolock_time = "";
        userService.updUserState(user_id,true,user_bolock_time);
        return "checkAllUser.do";
    }

    //申诉处理
    @RequestMapping("/checkUserAppeal")
    public String checkUserAppeal(Model model){
        List<JobAccept> jobAcceptServices = jobAcceptService.checkUserAppeal();
        List<Job> jobs = jobService.checkAllJob();
        System.out.println(jobs);
        System.out.println(jobAcceptServices);
        model.addAttribute("users",jobAcceptServices);
        model.addAttribute("jobMessage",jobs);
        return "adminUserAppeal";
    }

    @RequestMapping("/setUserResult")
    public String setUserResult(String employee_id){
        String job_appeal_result=null;
        System.out.println("--"+employee_id+"--");
        String employer_id = null;
        String job_time =null;
        Double consult_reward=0.00;
        Double guide_reward=0.00;
        Double cash_deposit=0.00;

        String[] strArr = employee_id.split("\\|");
        System.out.println(strArr.length); //这里输出3
        for (int i = 0; i <strArr.length; i++){
            System.out.println(strArr[i]);//这里输出a b c
            if(i==0){
                employee_id=strArr[0];
            }
            if (i==1){
                employer_id=strArr[1];
            }
            if(i==2){
                job_time=strArr[2];
            }
            if(i==3){
                job_appeal_result=strArr[3];
            }
            if (i==4){
                consult_reward=changeStringPrice(strArr[4]);
            }
            if(i==5){
                guide_reward=changeStringPrice(strArr[5]);
            }
            if(i==6){
                if(strArr[6].length()>0){
                cash_deposit=changeStringPrice(strArr[6]);}
            }
        }
        jobAcceptService.updAppealJobResult(employer_id,employee_id,job_time,job_appeal_result);
        if(job_appeal_result.equals("通过")){
            Double sum= consult_reward+guide_reward+cash_deposit;
            Double money =userService.checkUserMessage(employee_id).getUser_money();
            Double addMoney =sum+money;
            userService.addMoney(employee_id,addMoney);
        }
        return "checkUserAppeal";
    }
    @RequestMapping("/checkUserChat.do")
    public String checkUserChat(Model model,String speaker_id,String listener_id){
        List<Chat> chats = chatService.checkMessage(speaker_id, listener_id);
        if(!chats.isEmpty()) {
            model.addAttribute("users",userService.checkAllUser());
            model.addAttribute("chat",chats);
            model.addAttribute("speaker_id",chats.get(0).getSpeaker_id());
            model.addAttribute("speaker_name",chats.get(0).getSpeaker_name());
            model.addAttribute("listener_id",chats.get(0).getListener_id());
            model.addAttribute("listener_name",chats.get(0).getListener_name());
            return "adminShowUserChat";
        }else {
            return "/checkUserAppeal";
        }
    }

    @RequestMapping("/checkUserMoney")
    public String checkUerMoney(Model model){
        model.addAttribute("users",userService.checkAllUser());
        model.addAttribute("userMoney",userMoneyService.checkAllUserMoney());
        return "adminSetUserReward";
    }

    @RequestMapping("/UpdateUserGetMoney.do")
    public String updateUserGetMoney(String user_id,String user_get_money){
        String money =user_get_money;
        money= money.replace(",","");

        userMoneyService.updUserGetMoney(user_id, money);

        System.out.println(user_id+"-----"+money);
        return "checkUserMoney";
    }

    @RequestMapping("/addJobType")
    public String addJobType(Model model){
       model.addAttribute("job_type", jobTypeService.checkAllJobType());
        return "adminAddJobType";
    }
    @RequestMapping("/addJobType.do")
    public String addJobTypeDo(String job_type,String job_type_content,String job_type_picture){
        if(job_type.length()>0&&job_type_content.length()>0){
            jobTypeService.insertJobType(job_type, job_type_content);
            if(job_type_picture.length()>0){
                jobTypeService.updJobTypePicture(job_type,job_type_picture);
            }
        }
        System.out.println(job_type+"=="+job_type_content);

        return "addJobType";
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
