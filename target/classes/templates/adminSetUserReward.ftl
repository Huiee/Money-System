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
        margin-left: 20%;
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
    <form action="/UpdateUserGetMoney.do" method="post" name="updUserMoney">
        <table>
            <tr><th>账号</th><th>昵称</th><th>余额</th><th>资金状态</th><th>赏金提成</th><th colspan="5">修改赏金提成</th></tr>
            <#list users as user>
                <#list userMoney as money>
                    <#if user.user_id == money.user_id>
                <tr>
                    <td>${user.user_id!}</td><td>${user.user_name!}</td>
                    <td>${user.user_money!}</td>
                    <td>
                        <#if user.user_money_state ==true>正常<#else >资金已被冻结</#if>
                    </td>
                    <td><#if money.user_get_money??>${money.user_get_money}<#else>暂无提成</#if></td>
                    <td colspan="3">
                        <input type="text"  name="user_get_money" id="user_get_money"  class="form-control" placeholder="提成金额">
                    </td><td colspan="2">  <button type="submit"  class="btn btn-blue" name="user_id" value="${user.user_id!} ">修改</button>
                    </td>
                </tr></#if>
                    </#list>
            </#list>
        </table>
    </form>
</div>

</body>
</html>