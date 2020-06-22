<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="悬赏系统">
    <title>查看个人资料</title>
    <script  type="text/javascript" src = "/js/job.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
</head>

<body>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<div class="media-list headertop_message">
    <button type="button" class="btn-return btn-dark btn-block  headertop" onclick="location.href='/showMyAcceptJobList.do'"></button>
</div>

<div class="middle_message_list middle_inner">
    <form action="/submitJob.do" name="submitJob" class="navbar-form navbar-left" role="search">
        <div class="btn btn-center">
            <table class="table">
                <#list submitJobContent as job>
                <tr><th colspan="2">${job.job_title!}(${job.job_state!})</th></tr>
                    <tr><th>发布者</th><td>${job.employer_name!}</td></tr>
                <tr><th colspan="2">具体要求</th></tr>
                <tr><td colspan="2">
                        ${job.job_content!}</td></tr>
                    <tr><th>任务类型</th><td>${job.job_type!}</td></tr>
                    <tr><th>最后期限</th><td>${job.job_deadline_time!}</td></tr>

                <tr><th colspan="1">任务内容</th></tr>
                <tr><td colspan="3">
                        <#if isFinish = false >
                        <textarea name="employee_job_content"class="form-control" rows="3" ></textarea>
                        </#if>
                        <#if isFinish = true>
                            <textarea name="employee_job_content"class="form-control" rows="3" disabled>${employee_job_content!}</textarea>

                        </#if>
                    </td></tr></table>
            <table class="table">
                    <tr><td colspan="3" align="right">
                            <#if isFinish =true && result =0>
                                审核中
                            </#if>
<#--                            审核结果通过-->
                            <#if isFinish =true && result =1>
                                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>

                            </#if>
<#--                            审核结果不通过-->
                            <#if isFinish =true && result =2>
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </#if>
                        </td></tr>
                    <#if isFinish =true && (result =1 || result =2)>
                    <tr>
                        <td valign=middle class=tablebody1 colspan="3" align="right">
                            <input type="radio" name="score" value="1">😟
                            <input type="radio" name="score" value="2">😐
                            <input type="radio" name="score" value="3">😂
                            <input type="radio" name="score" value="4">🙂
                            <input type="radio" name="score" value="5">😘
                        </td>
                    </tr>
                        <tr><td colspan="3" align="right">
                 <#if isAppeal == 0>
                   <button type="button" value="" class="btn btn-dark" onclick="location.href='/appeal.do?employer_id=${job.employer_id!}&&job_time=${job.job_time!}'">申诉</button>&nbsp;&nbsp;
                 </#if>
                 <#if isAppeal == 1>
                     <button  class="btn btn-dark" disabled >申诉中</button>&nbsp;
                 </#if>
                 <#if isAppeal == 2>
                      <button class="btn btn-dark" disabled>${job_appeal_result!}</button>&nbsp;
                </#if>
                     <button value="" class="btn btn-dark">评价</button></td></tr>
                </#if>
                    <tr>
                    <td colspan="3" align="right">
                        <input type="text" name="employer_id" value="${job.employer_id!}" style="display: none">
                        <input type="text" name="job_time" value="${job.job_time!}" style="display: none">
                        <input type="text" name="job_title" value="${job.job_title!}" style="display: none">
                        <#if isFinish = false >
                        <button type="button" class="btn btn-dark" onclick="checkJobContent()">提交任务</button>
                        </#if>
                    </td></tr>
                </#list>
            </table>
        </div>
    </form>

</div>

<div class="tabbable tabs-below footertop footertop-message ">

</div>
</body>
</html>