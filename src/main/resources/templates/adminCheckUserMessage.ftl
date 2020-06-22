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
        margin-left: 7%;
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
<form action="/ChangeUserState" method="post">
    <table>
        <tr><th>账号</th><th>昵称</th><th>性别</th><th>联系方式</th><th>余额</th><th>资金状态</th><th>资金操作</th><th>账号状态</th><th>冻结时间</th><th colspan="3">账号操作</th></tr>
    <#list users as user>
<tr>
    <td>${user.user_id!}</td><td>${user.user_name!}</td><td>${user.user_sex!}</td><td>${user.user_phone!}</td>
    <td>${user.user_money!}</td>
    <td>
        <#if user.user_money_state ==true>正常<#else >资金已被冻结</#if>
    </td>
    <td>
        <#if user.user_money_state ==true>
        <button class="btn btn-blue" type="button" name="user_money_state_block" onclick="location.href='UserMoneyBlock?user_id=${user.user_id!}'">冻结</button>
        <#else >  <button class="btn btn-blue" type="button" name="user_money_state_free" onclick="location.href='UserMoneyFree?user_id=${user.user_id!}'">解冻</button>
        </#if>
    </td>
    <td>
        <#if user.user_state ==true>正常<#else>封号中</#if>
    </td>

    <td>
        <#if user.user_bolock_time??>${user.user_bolock_time!}<#else ></#if>
    </td>
    <td colspan="2">
        <#if user.user_bolock_time?? >
            <#if user.user_bolock_time=="">
                <input name="new_user_bolock_time" class="form-control" type="date"  placeholder="封号时间" >
            <#else >            ${user.user_bolock_time!}
            </#if>
            <#else >
            <input name="new_user_bolock_time" class="form-control" type="date"  placeholder="封号时间" >
<#--            min="${today!}"-->
        <#--            <input name="user_birthday" class="form-control" min="${today!}" type="date" placeholder="出生日期" value="${register_birthday!}">-->

        </#if>
    </td>
    <td>
        <#if user.user_state ==true>
            <button class="btn btn-blue" name="user_id" value="${user.user_id!}">封号</button>
        <#else><button type="button" class="btn btn-blue" name="new_user_tate" onclick="location.href='UserStateFree?user_id=${user.user_id!}'">解封</button>
        </#if>
    </td>
</tr>
    </#list>
    </table>
</form>
</div>

</body>
</html>