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
import java.util.List;

@Controller
public class JobAcceptController {
    @Resource
    JobAcceptService jobAcceptService;
    @Resource
    JobService jobService;
    @Resource
    UserService userService;

    //接任务
    @RequestMapping("/acceptJob.do")
    public String acceptJob(Model model, HttpSession httpSession,String user_money,String cash_deposit,String employer_id, String job_title , String job_time , String job_deadline_time ){
        String employee_id = (String)httpSession.getAttribute("user_id");
        String employee_name = (String)httpSession.getAttribute("user_name");
        //将数据保存到数据库
        jobAcceptService.acceptJob(employer_id,job_title ,job_time ,job_deadline_time ,employee_id, employee_name);
       //减去保证金
        if(cash_deposit !=null){
            Double money = changeStringPrice(user_money) - changeStringPrice(cash_deposit);
            userService.addMoney(employee_id,money);
        }
        List<Job> jobList = jobService.checkJobContent(employer_id, job_title, job_time);
        model.addAttribute("submitJobContent",jobList);
        List<JobAccept> jobAccepts = jobAcceptService.checkIsAcceptJob(employee_id,employer_id,job_time);
        if(jobAccepts.get(0).getEmployee_job_state().equals("待完成")){
            model.addAttribute("isFinish",false);
        }
        else{
            model.addAttribute("employee_job_content",jobAccepts.get(0).getEmployee_job_content());
            model.addAttribute("isFinish",true);
        }
        //        返回提交任务页面
        return "submitJob";
    }
    //进入提交任务页面
    @RequestMapping("showSubmitJob")
    public String showSubmitJob(HttpSession httpSession,Model model,String employer_id,String job_time,String job_title){
        List<Job> jobList = jobService.checkJobContent(employer_id, job_title, job_time);
        model.addAttribute("submitJobContent",jobList);
        String employee_id = (String)httpSession.getAttribute("user_id");
        //查询完成情况
        List<JobAccept> jobAccepts = jobAcceptService.checkIsAcceptJob(employee_id,employer_id,job_time);
        System.out.println(jobAccepts);
        if(jobAccepts.get(0).getEmployee_job_state().equals("待完成")){
            model.addAttribute("isFinish",false);
        }
        else{
            model.addAttribute("employee_job_content",jobAccepts.get(0).getEmployee_job_content());
            model.addAttribute("isFinish",true);
        }
        //查询审核情况
        if(jobAccepts.get(0).getEmployee_job_result()==null){
            model.addAttribute("result",0);
        }
        else{
            if(jobAccepts.get(0).getEmployee_job_result().equals("通过")){
                model.addAttribute("result",1);
            }
            else{
                model.addAttribute("result",2);
            }
        }
//        查询申诉情况
        if(jobAccepts.get(0).getJob_appeal()==null){
            model.addAttribute("isAppeal",0);
        }
        else {
            if(jobAccepts.get(0).getJob_appeal_result()==null){
//                申诉中
                model.addAttribute("isAppeal",1);
            }
            else{
                model.addAttribute("isAppeal",2);
                String appeal_result = jobAccepts.get(0).getJob_appeal_result();
                model.addAttribute("job_appeal_result",appeal_result);
            }
        }
        return "submitJob";
    }
    //提交任务
    @RequestMapping("/submitJob.do")
    public String submitJob(HttpSession httpSession,String employer_id,String job_time,String employee_job_content){
        String user_id = (String)httpSession.getAttribute("user_id");
        //提交任务
        jobAcceptService.submitJob(user_id,employer_id,job_time,employee_job_content);
        return "showMyJob";
    }

    //查看个人发布任务详情
    @RequestMapping("/showMyAcceptJobList.do")
    public  String showMyPublishJobContent(HttpSession httpSession,Model model){
        String user_id =(String) httpSession.getAttribute("user_id");
        model.addAttribute("allMyAcceptJob",jobAcceptService.checkMyAcceptJob(user_id));
        List<User> users = userService.checkAllUser();
        model.addAttribute("EmployerUser",users);
        return "myAcceptJobList";
    }
    //查看当前任务所有结果
    @RequestMapping("/showJobResult.do")
    public  String showJobResult(HttpSession httpSession,Model model,String job_time){
        String user_id =(String)httpSession.getAttribute("user_id");
        List<JobAccept> jobAcceptList = jobAcceptService.checkMyJobIsAccept(user_id,job_time);
        List<User> users = userService.checkAllUser();
        model.addAttribute("myJobResult",jobAcceptList);
        model.addAttribute("myJobUser",users);

        return "myJobResultList";
    }

    //审核当前任务结果
    @RequestMapping("/setJobResult.do")
    public String setJobResult(HttpSession httpSession,Model model,String employee_id,String job_time,String employee_job_result){
        String employer_id =(String)httpSession.getAttribute("user_id");
        jobAcceptService.setJobResult(employer_id,employee_id,job_time,employee_job_result);
        List<JobAccept> jobAcceptList = jobAcceptService.checkMyJobIsAccept(employer_id,job_time);
        model.addAttribute("myJobResult",jobAcceptList);
        List<Job> jobs =jobService.checkMyJobContent(employer_id,job_time);
        List<User> users = userService.checkAllUser();
        model.addAttribute("myJobUser",users);
//        奖金
        if(employee_job_result.equals("通过")){
            Double reward = jobs.get(0).getConsult_reward()+jobs.get(0).getGuide_reward();
            //查看是否需要保证金，如需要则退还
            if(jobs.get(0).getIs_cash_deposit()==true){
                reward=reward+jobs.get(0).getCash_deposit();
                System.out.println("加保证金");
            }
            Double old_money = 0.00;

            if(userService.checkUserMessage(employee_id).getUser_money()!=null){
                old_money = userService.checkUserMessage(employee_id).getUser_money();
            }
            System.out.println("赏金："+reward+"余额"+old_money);
        Double new_money = reward+old_money;
            userService.addMoney(employee_id,new_money);
        }
        return "myJobResultList";
    }

    //申诉
    @RequestMapping("/appeal.do")
    public String appeal(HttpSession httpSession,String employer_id,String job_time){
        Boolean job_appeal =true;
        String employee_id = (String)httpSession.getAttribute("user_id");
        System.out.println(employee_id+"-----"+employer_id+"=="+job_time+"=="+job_appeal);
        jobAcceptService.updAppealJob(employer_id,employee_id,job_time,job_appeal);
        System.out.println("ok");
        return "showMyAcceptJobList.do";
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

