<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="悬赏系统">
    <title>首 页</title>
    <script  type="text/javascript" src = "/js/common.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
</head>

<body>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<div class=" headertop">
    <button type="button" class="btn-return btn-dark btn-block  headertop" onclick="location.href='/showMyPublishJobList.do'">
        </button>
</div>
<form action="/acceptJob.do" method="post" name="acceptJob" class=" middle_publish_job middle_inner ">
    <div class="btn btn-center">
    <table class="table">
        <#list jobContent as job>
            <#assign sum =job.consult_reward + job.guide_reward >
            <tr><th colspan="2">${job.job_title!}(${job.job_state!})</th></tr>
            <tr><th width="35%">发布者</th><td>${job.employer_name}</td></tr>
            <tr><th colspan="2">具体要求</th></tr>
        <tr><td colspan="2">${job.job_content!}</td></tr>
            <#if  job.job_picture ?? >
                <#if job.job_picture == "null"><#else >
            <tr><td colspan="2">
                    <img src="..\images\${job.job_picture!}" width="40%" height="auto">
                </td></tr>
                </#if>
            </#if>
        <tr><th>任务类型</th><td>${job.job_type!}</td>
        <tr><th>任务限期</th><td>${job.job_deadline_time!}</td></tr>
        <tr><th colspan="2">悬赏金额</th></tr>
        <tr><td>咨询：${job.consult_reward!}</td><td>指导：${job.guide_reward!}</td></tr>
        <tr><td colspan="2">合计：${(sum)!}</td></tr>
        <tr><th colspan="2">保险金：${job.cash_deposit!}</th></tr>

            <tr>
            <td align="center">
                  <#if isAccept = 0 || isAccept =1 || isAccept =2>
                <button type="button" class="btn btn-dark" onclick="location.href='/message.do?employer_id=${job.employer_id!}&&employer_name=${job.employer_name!}'">聊一聊</button></td>
                </#if>
            <td align="right">
<#--                当前任务尚未被人接-->
                <#if isAccept = 0>
                    <input type="text" style="display: none" name="user_money" value="${user_money!}">
                    <input type="text" style="display: none" name="job_time" value="${job.job_time!}">
                    <input type="text" style="display: none" name="job_deadline_time" value="${job.job_deadline_time!}">
                    <input type="text" style="display: none" name="employer_id" value="${job.employer_id!}">
                    <input type="text" style="display: none" name="job_title" value="${job.job_title!}">
                    <input type="text" style="display: none" name="cash_deposit" value="${cash_deposit!}">

                    <button type="button" class="btn btn-dark" onclick="checkAcceptMoney()">接受任务</button>
                </#if>
<#--                当前用户已接该任务但尚未完成该任务-->
                <#if isAccept = 1>
                    <button type="button" class="btn btn-dark" onclick="location.href='/showSubmitJob?employer_id=${job.employer_id}&&job_title=${job.job_title}&&job_time=${job.job_time}'">实现任务</button>
                </#if>
<#--                当前用户已完成该任务-->
                <#if isAccept = 2>
                    <button type="button" class="btn btn-dark" onclick="location.href='/showSubmitJob?employer_id=${job.employer_id}&&job_title=${job.job_title}&&job_time=${job.job_time}'">已完成</button>
                </#if>
<#--                发布者为当前用户且任务已被接-->
                <#if isAccept = 3>
                    <button type="button" class="btn btn-dark" onclick="location.href='/showJobResult.do?job_time=${job.job_time}'">查看结果</button>
                </#if>
                </td></tr>
        </#list>
    </table>
</div>
</form>

</body>
</html>