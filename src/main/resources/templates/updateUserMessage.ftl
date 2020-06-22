<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/html">
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
<button type="button" class="btn-return btn-dark btn-block  headertop-cover" onclick=""></button>
<ul class="media-list">
    <li class="media">
        <a class="pull-left" href="#"><img class="media-object" src="..\images\${user_picture!}" /></a>
        <div class="media-body">
            <br>
            <h4 class="media-heading">${user_name!}</h4>
            <!-- Nested media object -->
            <div class="media-id">
                账号：${user_id!}
            </div>
        </div>
    </li>
</ul>
<table width="100%">
    <tr>
        <td><button class="btn btn-white-leader"  onclick="location.href='/showCover'">首页</button></td>
        <td><button class="btn btn-dark-leader" onclick="">个人信息</button></td>
        <td><button class="btn btn-white-leader" onclick="location.href='/showMyJob'">我的任务</button></td>
        <td><button class="btn btn-white-leader"  onclick="location.href='/showPublishJob'">发布任务</button></td>
    </tr>
</table>

<div class="middle_outer middle_inner">
    <form action="/updateUserMessage.do" method="post" name="updateMessageForm">
    <table class="table table-hover" >
<#--        名字头像密码生日手机-->
        <tr><td width="20%">头像</td>
            <td colspan="2" >
                <#if  userMessage.user_picture ?? >
                <img src="..\images\${userMessage.job_picture!}" width="20%" height="auto" >
                    <input type="file" name="new_user_picture" class="btn-picture">
                <#else>
                    <input type="file" name="new_user_picture" class="btn-picture">
                </#if></td>
        </tr>
        <tr><td width="20%">昵称</td>
            <td>
                <input id="new_user_name" name="new_user_name" value="${userMessage.user_name!}" type="text" class="form-control" placeholder="新昵称">
             </td>
        </tr>
        <tr><td width="20%">手机</td>

            <td>
                <input id="new_user_phone" name="new_user_phone" value="${userMessage.user_phone!}" type="text" class="form-control" placeholder="新手机号码">
            </td>
        </tr>
        <tr><td width="20%">密码</td>
             <td><button type="button" id="newUserPasswordBtn" onclick="showNewPassword()" style="display: block" class="btn btn-white">修改密码</button>
            </td>
        </tr>

        <tr><td></td><td colspan="1">
                <input id="new_user_password" name="new_user_password" type="text" class="form-control" placeholder="新密码" style="display: none">
            </td></tr>
        <tr><td colspan="2" align="right">
                <button type="submit"  class="btn btn-dark"">确认修改</button></td></tr>

    </table>
    </form>
</div>
</body>
</html>