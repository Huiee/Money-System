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
    <button type="button" class="btn-return btn-dark btn-block  headertop-cover" onclick=""></button>

<ul class="media-list">
    <li class="media">
        <a class="pull-left" href="#">
            <img class="media-object" src="..\images\${user_picture!}" />

        </a>
        <div class="media-body">
            <br>
            <h4 class="media-heading">${user_name!}</h4>
            <div class="media-id">
                账号：${user_id!}
            </div>
        </div>
    </li>
</ul>
<table width="100%" class="table-leader">
    <tr>
        <td><button class="btn btn-white-leader"  onclick="location.href='/showCover'">首页</button></td>
        <td><button class="btn btn-white-leader" onclick="location.href='/showUserMessage.do?id=${user_id!}'">个人信息</button></td>
        <td><button class="btn btn-dark-leader" onclick="location.href='/showMyJob'">我的任务</button></td>
        <td><button class="btn btn-white-leader"  onclick="location.href='/showPublishJob'">发布任务</button></td>
    </tr>
</table>

<div class="middle_outer_job middle_inner">
    <table class="table table-myJob">
        <tr><th >我的发布</th></tr>
        <tr><td><button type="button" class="btn btn-center"<#if myPublishJob??> onclick="location.href='/showJobContent.do?employer_id=${myPublishJob.employer_id!}&&job_title=${myPublishJob.job_title!}&&job_time=${myPublishJob.job_time!}'"</#if> >

                <table class="table table-cover-list"
                  <tr><th align="left" colspan="2"> ${myPublishJobNull!} <#if myPublishJob??> ${myPublishJob.job_title!}</#if></th></tr>
                   <#if myPublishJob??><tr><td align="right" colspan="2">${myPublishJob.job_time!}</td></tr></#if>
                </table>
                </button></td></tr>
        <tr><td align="right"><button type="button" class="btn btn-dark" onclick="location.href='/showMyPublishJobList.do'">查看全部</button></td></tr>
        <tr><th >我的回答</th></tr>

        <tr><td><button type="button" class="btn btn-center"  <#if myAcceptJob_job_deadline_time??> onclick="location.href='/showJobContent.do?employer_id=${myAcceptJob_employer_id!}&&job_title=${myAcceptJob_job_title!}&&job_time=${myAcceptJob_job_time!}'"</#if> >
                    <table class="table table-cover-list">
                        <tr><th align="left" colspan="2">  ${myAccpectJobNull!} <#if myAcceptJob_job_title??>${myAcceptJob_job_title!}</#if></th></tr>
                        <#if myAcceptJob_job_deadline_time??><tr><td align="right" colspan="2">最后期限：${myAcceptJob_job_deadline_time!}</td></tr></#if>

                    </table>
                </button></td></tr>
        <tr><td align="right"><button type="button" class="btn btn-dark" onclick="location.href='/showMyAcceptJobList.do'">查看全部</button></td></tr>

    </table>
</div>

</body>
</html>