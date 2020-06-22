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
<div class="media-list headertop">
    <button type="button" class="btn-return btn-dark btn-block  headertop" onclick="location.href='/showMyJob'">
        我的回答
    </button>
</div>
<div class="middle_message_list middle_inner">

    <table class="table">

        <#list allMyAcceptJob as job>
            <tr><td>
                    <button type="button" class="btn btn-center" onclick="location.href='/showJobContent.do?employer_id=${job.employer_id}&&job_title=${job.job_title}&&job_time=${job.job_time}'">
                        <table class="table table-cover-list">
                            <tr><th align="left" colspan="1" width="20%">
                                    <#list EmployerUser as user>
                                        <#if user.user_id == job.employer_id>
                                            <#if user.user_picture??>
                                                <img class="media-object-photo" src="..\images\${user.user_picture!}" />
                                            <#else >
                                                <img class="media-object-photo" src="..\images\p1.jpg" />
                                            </#if>
                                        </#if></#list></th><th align="left" colspan="2">
                                    ${job.job_title!}(${job.employee_job_state!})</th></tr>
                            <tr><td align="right" colspan="3">最后期限：${job.job_time!}</td></tr>
                            <#if  job.employee_job_result??>
                                <tr><td align="right" colspan="3"><#if job.job_appeal??>
                                        😡
                                        <#if job.job_appeal_result??>
                                            <span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
                                            <#else >
                                            <span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>
                                        </#if>
                                    <#else>😀</#if>审核完毕</td></tr>
                            <#else>
                            <tr><td align="right" colspan="2">
                                    <span class="glyphicon glyphicon-hourglass" aria-hidden="true"></span>审核中
                            </td>
                            </tr>
                            </#if>
                        </table>

<#--                        <#if job.job_employee_result == "通过">-->
<#--                            <tr><td colspan="4" align="right">-->
<#--                              <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>-->
<#--        </td></tr>-->
<#--                               </#if>-->
<#--                                  <#if job.job_employee_result == "不通过">-->
<#--                          <tr><td colspan="4" align="right">-->

<#--                              </td></tr></#if>-->



                    </button>
            </td></tr>

        </#list>

    </table>
<div>

</body>
</html>