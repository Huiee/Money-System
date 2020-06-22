package net.javaee.homework.RewardSystem.controller;

import net.javaee.homework.RewardSystem.entity.Job;
import net.javaee.homework.RewardSystem.entity.JobAccept;
import net.javaee.homework.RewardSystem.entity.User;
import net.javaee.homework.RewardSystem.service.JobAcceptService;
import net.javaee.homework.RewardSystem.service.JobService;
import net.javaee.homework.RewardSystem.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class JobController {
    @Resource
    JobService jobService;
    @Resource
    UserService userService;
    @Resource
    JobAcceptService jobAcceptService;
    @RequestMapping("/showPublishJob")
    public String showPublishJob(Model model,HttpSession httpSession){
        //查询今天日期
        Date date=new Date();
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
        String today = sim.format(date);
        model.addAttribute("today",today);
        //查询余额
        String user_id = (String)httpSession.getAttribute("user_id");
        User userMessage = userService.checkUserMessage(user_id);
        model.addAttribute("user_money",userMessage.getUser_money());
        return "publishJob";
    }

    //查看任务详情
    @RequestMapping("/showJobContent.do")
    public String showJobContent(Model model,HttpSession httpSession,String employer_id,String job_title,String job_time){
        List<Job> jobContent = jobService.checkJobContent(employer_id, job_title, job_time);
        model.addAttribute("jobContent",jobContent);
        String user_id = (String)httpSession.getAttribute("user_id");
        String employee_id = user_id;
        List<JobAccept> isAcceptJob = jobAcceptService.checkIsAcceptJob(employee_id,employer_id,job_time);
        System.out.println(user_id+"=="+employer_id+"=="+job_time);
//        System.out.println(isAcceptJob);
        //判断是否接受过该任务如果接受过返回true
        if(isAcceptJob.isEmpty()){
                model.addAttribute("isAccept",0);
            }
        else{
             if(isAcceptJob.get(0).getEmployee_job_state().equals("待完成")){
                model.addAttribute("isAccept",1);
             }
             else{
                 model.addAttribute("isAccept",2);

             }
        }
        //如果发布者是本人
        if(user_id.equals(employer_id)){
            List<JobAccept> myJobIsAccept = jobAcceptService.checkMyJobIsAccept(employer_id,job_time);
            //无人接任务可修改
            if(myJobIsAccept.isEmpty()){
                return "myPublishJob";
            }
            else {
                //不可修改任务可查看任务
                model.addAttribute("isAccept",3);
            }
        }
        //查询余额
        Double user_money = 0.00;
        if(userService.checkUserMessage(user_id).getUser_money()!=null){
            user_money =userService.checkUserMessage(user_id).getUser_money();
        }
        model.addAttribute("user_money",user_money);
        return "job";
    }

    //查看个人任务信息
    @RequestMapping("/showMyJob")
    public String showMyJob(Model model,HttpSession httpSession){
        String user_id = (String)httpSession.getAttribute("user_id");
        List<Job> myPublishJob = jobService.checkMyPublishJob(user_id);
        List<JobAccept> myAccpectJob =jobAcceptService.checkMyAcceptJob(user_id);
        User userMessage = userService.checkUserMessage(user_id);
        if(userMessage.getUser_picture()!=null){
            model.addAttribute("user_picture",userMessage.getUser_picture());
        }else {
            model.addAttribute("user_picture","p1.jpg");
        }
        if(myPublishJob.isEmpty()){
            model.addAttribute("myPublishJobNull","还没有发布任务，快去发布一条新任务吧！");
        }
        else{
            model.addAttribute("myPublishJob",myPublishJob.get(0));

        }
        if(myAccpectJob.isEmpty()){
            model.addAttribute("myAccpectJobNull","还没有接任务哦，快去接一条新任务吧！");
        }
        else{
            model.addAttribute("myAcceptJob_job_time",myAccpectJob.get(0).getJob_time());
            System.out.println(myAccpectJob.get(0).getEmployer_id());
            model.addAttribute("myAcceptJob_employer_id",myAccpectJob.get(0).getEmployer_id());
            model.addAttribute("myAcceptJob_job_title",myAccpectJob.get(0).getJob_title());
            model.addAttribute("myAcceptJob_job_deadline_time",myAccpectJob.get(0).getJob_deadline_time());
        }
        return "myJob";
    }
    //查看个人用户发布的全部任务
    @RequestMapping("/showMyPublishJobList.do")
    public String showMyPublishJobList(Model model,HttpSession httpSession){
        String user_id =(String) httpSession.getAttribute("user_id");
        model.addAttribute("allMyPublishJob",jobService.checkMyPublishJob(user_id));
        model.addAttribute("acceptJob",jobAcceptService.checkMyPublishJob(user_id));

        return "myPublishJobList";
    }

    //发布任务
    @RequestMapping("/addJob.do")
    public String addJob(HttpSession httpSession,Model model,String user_money,
                         String job_title , String job_content , String job_type ,
                         String job_deadline_time ,
                         String consult_reward , String guide_reward,
                         Boolean is_cash_deposit, String cash_deposit,String job_picture){
        String employer_id = (String)httpSession.getAttribute("user_id");
        String employer_name = (String)httpSession.getAttribute("user_name");
        Double new_consult_reward= changeStringPrice(consult_reward);
        Double new_guide_reward= changeStringPrice(guide_reward);
        Double new_cash_deposit= changeStringPrice(cash_deposit);
        Double new_user_money= changeStringPrice(user_money);
        System.out.println("--"+job_title+"--"+ job_content +"--"+ job_type +"--"+
                        job_deadline_time
                 +"--"+consult_reward +"--"+guide_reward+"--"+is_cash_deposit+"--"+ cash_deposit+"--"+job_picture);
        if(consult_reward.length()<=0){
            new_consult_reward =0.00;
        }
        if(guide_reward.length()<=0){
            new_guide_reward = 0.00;
        }
        if(is_cash_deposit == false){
            new_cash_deposit = 0.00;
        }
        if (job_picture.length()<=0){
            job_picture = "null";
        }
        model.addAttribute("job_title",job_title);
        model.addAttribute("job_content",job_content);
        model.addAttribute("job_type",job_type);
        model.addAttribute("job_deadline_time",job_deadline_time);
        model.addAttribute("consult_reward",new_consult_reward );
        model.addAttribute("guide_reward",new_guide_reward);
        model.addAttribute("cash_deposit",new_cash_deposit);
        jobService.addJob(employer_id, employer_name,  job_title, job_content, job_type, job_deadline_time, new_consult_reward, new_guide_reward, is_cash_deposit, new_cash_deposit,job_picture);
        Double sum =new_consult_reward+new_guide_reward;
        String user_id = (String)httpSession.getAttribute("user_id");
        System.out.println("赏金金额："+sum+"="+new_consult_reward+"--"+new_guide_reward);
        System.out.println("用户余额："+new_user_money);
        Double new_money = new_user_money -sum;

        System.out.println("新余额："+new_money);

        userService.addMoney(user_id, new_money);
        return "showMyJob";
    }

    @RequestMapping("/updateJob.do")
    public String updateJob(HttpSession httpSession,String job_time,String job_content,String old_consult_reward,String old_guide_reward,String  new_consult_reward,String new_guide_reward){
        String employer_id=(String) httpSession.getAttribute("user_id");
        Double add_consult_reward = 0.00;
        Double add_guide_reward=0.00;
        Double d_old_consult_reward= changeStringPrice(old_consult_reward);
        Double d_old_guide_reward= changeStringPrice(old_guide_reward);
        Double d_new_consult_reward= changeStringPrice(new_consult_reward);
        Double d_new_guide_reward= changeStringPrice(new_guide_reward);

        if (new_consult_reward.length()>0){
            add_consult_reward=d_new_consult_reward;
        }
        if (new_guide_reward.length()>0){
            add_guide_reward=d_new_guide_reward;
        }
        System.out.println(add_consult_reward+"=="+add_guide_reward+"=="+d_old_consult_reward+"=="+d_old_guide_reward);
        Double guide_reward = d_old_guide_reward + add_guide_reward;
        Double consult_reward = d_old_consult_reward + add_consult_reward;
        jobService.updateJob(employer_id, job_time, job_content, guide_reward, consult_reward);
        System.out.println(employer_id+"=="+job_time+"=="+job_content+"=="+guide_reward+"=="+consult_reward);
        return "showMyPublishJobList.do";
    }

    @RequestMapping("/deleteMyJob.do")
    public String deleteMyJob(HttpSession httpSession,String job_time,String sum){
        System.out.println(job_time);
        String user_id =(String) httpSession.getAttribute("user_id");
        jobService.deleteJob(user_id,job_time);
        Double new_sum = changeStringPrice(sum);
        Double user_money = userService.checkUserMessage(user_id).getUser_money();
        System.out.println(user_money+"---"+new_sum);
        Double new_money = new_sum+user_money;
        System.out.println(new_money+"====");
        userService.addMoney(user_id,new_money);
        return "showMyPublishJobList.do";
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
