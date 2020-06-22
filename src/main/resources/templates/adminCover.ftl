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

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <#--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">-->

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/admin.css">
</head>


<body>
<#--<meta name="viewport" content="width=device-width, initial-scale=1" />-->
<div  class="btn-return btn-dark btn-block  headertop-cover">
    <button type="button" class="btn btn-dark"  onclick="location.href='/checkAllUser.do'">账号管理</button>
    <button type="button"  class="btn btn-dark" onclick="location.href='/checkUserAppeal'">申诉处理</button>
    <button type="button"  class="btn btn-dark" onclick="location.href='/checkUserMoney'">赏金提成</button>
    <button type="button"  class="btn btn-dark" onclick="location.href='/addJobType'">任务分类</button>
</div>

<ul class="media-list">
    <li class="media">
        <a class="pull-left" href="#">
            <img class="media-object" src="..\images\p17.jpg" />
        </a>
        <div class="media-body">
<form action="/adminSearchTitle" method="post">
            <table class="cover-top-table">
                <tr><th width="20%">管理员</th>

                    <td width="30%" align="center" rowspan="3">
                        <input  type="text" class="form-control-cover"  name="search_title" placeholder="输入关键词"></td>
                    <td align="center" width="15%" rowspan="3"><button class="btn btn-white-cover-check" >搜索</button></td>
                </tr>
                <tr><td colspan="1">&nbsp;</td></tr>
                <tr><td>账号：Admin</td></tr>
            </table></form>
    </li>
</ul>
<div class="div-cover-center backgroud-color-cover">
    <div class="middle_outer_cover middle_inner ">
        <#list allJob as job>
            <#assign sum =job.consult_reward + job.guide_reward >
            <button type="button" class="btn btn-center-cover" onclick="location.href='/showJobContent.do?employer_id=${job.employer_id}&&job_title=${job.job_title}&&job_time=${job.job_time}'">
                <table class="table table-cover-list">
                    <tr><td rowspan="2">
                            <#list allUser as user>
                                <#if user.user_id == job.employer_id>
                                    <#if user.user_picture??>
                                        <img class="media-object-message" src="..\images\${user.user_picture!}" />
                                    <#else >
                                        <img class="media-object-message" src="..\images\p1.jpg" />
                                    </#if>
                                </#if>
                            </#list></td>
                        <th align="left" colspan="2">【${job.job_type}】${job.job_title!}</th></tr>
                    <tr> <td align="left">&nbsp;&nbsp;${(sum)!}RMB</td>
                        <td align="right" colspan="2">${job.job_time!}</td></tr> </table>
            </button>
        </#list>
    </div>
</div>

</body>
</html>