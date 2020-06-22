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

</head>


<body>
<meta name="viewport" content="width=device-width, initial-scale=1" />
    <button type="button" class="btn-return btn-dark btn-block  headertop-cover" onclick="location.href='/showLogin'"></button>
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
    </li>
    <table width="100%" class="table-leader">
        <tr>
            <td><button class="btn btn-dark-leader">首页</button></td>
            <td><button class="btn btn-white-leader" onclick="location.href='/showUserMessage.do?id=${user_id!}'">个人信息</button></td>
            <td><button class="btn btn-white-leader"  onclick="location.href='/showMyJob'">我的任务</button></td>
            <td><button class="btn btn-white-leader"  onclick="location.href='/showPublishJob'">发布任务</button></td>
        </tr>
    </table>
<div class="div-form-cover">
    <form method="post" action="/coverOrder" class="form-cover-left" id="orderform" name="orderform">
        <table width="100%" height="40" class="table-cover-search">
            <tr><td>
                    <div class="select"><select id="selectOrder" name="selectOrder" onchange="document.orderform.submit()">
                        <option>选择顺序</option><option>默认排序</option>
                        <option>赏金最高</option><option>赏金最低</option>
                        </select></div></td>
            </tr>
        </table>
    </form>
    <form method="post" action="/searchTitle" class="form-cover-right form-f" >
    <table width="100%" height="40" class="table-cover-search">
        <tr>
        <td width="45%" align="center">
            <input  type="text" class="form-control-cover"  name="search_title" placeholder="输入关键词"></td>
            <td align="center" width="20%"><button class="btn btn-white-cover-check" >搜索</button></td>
        </tr>
    </table>
    </form>
</div>
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
<div class="tabbable tabs-below footertop footertop-cover ">
    <button class="btn-dark-message-cover" onclick="location.href='/showMessageList'">
        <span class="glyphicon glyphicon-envelope" ></span>
    </button>
</div>
</body>
</html>