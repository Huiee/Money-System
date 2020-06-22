<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="悬赏系统">
    <title>我发布的任务</title>
    <script  type="text/javascript" src = "/js/job.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
</head>

<body>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<button type="button" class="btn-return btn-dark btn-block  headertop-cover" onclick="location.href='/showMyJob'"></button>

<form action="/updateJob.do" method="post" class=" middle_publish_job middle_inner ">
    <div class="btn btn-center">
    <table class="table table-hover">
        <#list jobContent as job>
            <#assign sum =job.consult_reward + job.guide_reward >
            <tr><th colspan="2">${job.job_title!}(${job.job_state!})</th></tr>
            <tr><th colspan="2">具体要求</th></tr>
            <tr><td colspan="2"><textarea name="job_content"class="form-control" rows="3">${job.job_content!}</textarea></td></tr>
            <#if  job.job_picture ??>
                <#if job.job_picture == "null"><#else >
                    <tr><td colspan="2">
                            <img src="..\images\${job.job_picture!}" width="40%" height="auto">
                        </td></tr>
                </#if>
            </#if>
            <tr><th>任务类型</th><td>${job.job_type!}</td>
            <tr><th>任务限期</th><td>${job.job_deadline_time!}</td></tr>
            <tr><th colspan="2">悬赏金额</th></tr>
            <tr><td>咨询：${job.consult_reward}</td><td>
                    <button type="button" class="btn btn-white" id="addConsultBtn" style="display:block" onclick="showAddConsultReward()">增加金额</button>
                    <input type="text"  name="new_consult_reward" id="new_consult_reward" style="display:none;" class="form-control" placeholder="增加咨询奖金"></td></tr>
            <tr><td>指导：${job.guide_reward}</td><td>
                    <button type="button" class="btn btn-white"  id="addGuideBtn" style="display:block;" onclick="showAddGuideReward()">增加金额</button>
                    <input type="text"  name="new_guide_reward" id="new_guide_reward" style="display:none;" class="form-control" placeholder="增加指导奖金"></td></tr>
            <tr><td colspan="2">合计：${(sum)!}</td></tr>
            <tr><th colspan="2">保险金：${job.cash_deposit}</th></tr>
            <tr><td align="center">
                    <button type="button" class="btn btn-dark" onclick="location.href='/deleteMyJob.do?job_time=${job.job_time}&&sum=${(sum)!}'">删除</button>
                </td><td align="center">
                    <input type="text" style="display: none" name="job_time" value="${job.job_time!}">
                    <input type="text" style="display: none" name="old_consult_reward" value="${job.consult_reward!}">
                    <input type="text" style="display: none" name="old_guide_reward" value="${job.guide_reward!}">
                    <button type="submit" class="btn btn-dark" >确认修改</button></td></tr>
        </#list>
    </table>
    </div>
</form>

</body>
</html>