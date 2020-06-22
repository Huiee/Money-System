<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="悬赏系统">
    <title>查看个人资料</title>
    <script  type="text/javascript" src = "/js/common.js"></script>
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
        任务结果
    </button>
</div>


<div class="middle_publish_job middle_inner">

    <#list myJobResult as list>

        <div type="button" class="btn btn-center">
            <form action="/setJobResult.do" method="post" name="setJobResult">
            <table class="table table-cover-list">
                <tr><th align="left" colspan="1" width="20%">
        <#list myJobUser as user>
                        <#if user.user_id == list.employee_id>
                            <#if user.user_picture??>
                                <img class="media-object-photo" src="..\images\${user.user_picture!}" />
                            <#else >
                                <img class="media-object-photo" src="..\images\p1.jpg" />
                            </#if>
                        </#if></#list></th><th align="left" colspan="2">
                        ${list.employee_name}</th></tr>
                <tr><td colspan="3">
                        <#if list.employee_job_state =="待完成">
                            该用户任务还在进行中，暂时没有信息
                            <#else>
                                任务结果：${list.employee_job_content!}
                        </#if>
                    </td></tr>
                <tr><td colspan="3" align="right">
                        <#if list.employee_job_result??>
                            ${list.employee_job_result!}
                        <#elseif list.employee_job_state =="已完成">
                            <select name="employee_job_result">
                                <option value="通过">通过</option>
                                <option value="不通过">不通过</option>
                            </select>
                            <input type="text" name="employee_id" value="${list.employee_id}" style="display:none;">
                            <input type="text" name="job_time" value="${list.job_time}" style="display:none;">

                            <button type="submit" class="btn btn-dark">提交结果</button>
                        </#if>
                    </td></tr>
            </table>
            </form>
        </div>
        <br><br>
    </#list>

</div>
<div class="tabbable tabs-below footertop footertop-message ">

</div>
</body>
</html>