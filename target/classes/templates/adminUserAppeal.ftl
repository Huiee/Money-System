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
<style type="text/css">
    .table-style{
        border-collapse:collapse;
        border-spacing:0;
        border:none white;
        margin-left: 0%;
    }
    .table-style th{
        text-align:center;
        height:35px;
        width:95px;
        background:#383838;
        border: 2px solid #FFFFFF;
        font-size:12px;
        color:#FFFFFF;
    }

    .table-style td{
        text-align:center;
        height:35px;
        width:95px;
        background:	#F0F0F0;
        border: 2px solid #FFFFFF ;
        font-size:12px;
    }
</style>

<body>
<#--<meta name="viewport" content="width=device-width, initial-scale=1" />-->
<div  class="btn-return btn-dark btn-block  headertop-cover">
    <button type="button" class="btn btn-dark" onclick="location.href='/showAdminCover'">首页</button>
    <button type="button" class="btn btn-dark"  onclick="location.href='checkAllUser.do'">账号管理</button>
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
            <form action="/adminSearchUserId" method="post">
                <table class="cover-top-table">
                    <tr><th width="20%">管理员</th>
                        <td width="30%" align="center" rowspan="3">
                            <input  type="text" class="form-control-cover"  name="search_user_id" placeholder="输入用户账号"></td>
                        <td align="center" width="15%" rowspan="3"><button class="btn btn-white-cover-check" >搜索</button></td>
                    </tr>
                    <tr><td colspan="1">&nbsp;</td></tr>
                    <tr><td>账号：Admin</td></tr>
                </table></form>
    </li>
</ul>
<div class="middle_outer_cover_appeal middle_inner table-style">
    <form action="/setUserResult" method="post">
        <table>
            <tr><th>发布者账号</th><th>发布者昵称</th>
                <th>标题</th><th>类型</th><th>要求</th><th>指导赏金</th><th>咨询赏金</th><th>保证金</th>
                <th>发布时间</th><th>最后期限</th>
                <th>申诉者账号</th><th>申诉者昵称</th><th>任务内容</th>
                <th>完成时间</th><th>任务结果</th><th>聊天记录</th><th colspan="2">申诉结果</th></tr>
            <#list jobMessage as job>
            <#list users as user>

              <#if job.employer_id = user.employer_id && job.job_time =user.job_time >

                      <tr>
                      <td>${user.employer_id!}</td><td>${job.employer_name!}</td>
                      <td>${user.job_title!}</td>
                            <td>${job.job_type!}</td>
                            <td>${job.job_content!}</td>
                            <td>${job.guide_reward!}</td>
                            <td>${job.consult_reward!}</td>
                            <td><#if job.cash_deposit !=0>${job.cash_deposit!}</#if></td>
                          <td>${user.job_time!}</td><td>${user.job_deadline_time!}</td>
                          <td>${user.employee_id!}</td><td>${user.employee_name!}</td>

                          <td>${user.employee_job_content!}</td>
                          <td>${user.job_finish_time!}</td>

                          <td>${user.employee_job_result!}</td>
                          <td >
                              <button type="button" onclick="location.href='/checkUserChat.do?speaker_id=${user.employer_id!}&&listener_id=${user.employee_id!}'" class="btn btn-blue">查看</button>
                          </td>
                          <td>
                              <#if user.job_appeal_result??>
                              ${user.job_appeal_result!}</td><td>
                              <#else >

                              <button type="submit" class="btn btn-blue" name="employee_id" value="${user.employee_id!}|${user.employer_id!}|${job.job_time!}|通过|${job.consult_reward}|${job.guide_reward}|${job.cash_deposit}">通过</button></td>
                          <td>
                              <button type="submit" class="btn btn-blue" name="employee_id" value="${user.employee_id!}|${user.employer_id!}|${job.job_time!}|不通过">不通过</button></td>

                              </#if>
                          </td>
                      </tr>
                        </#if>
                        </#list>

            </#list>
        </table>
    </form>
</div>

</body>
</html>