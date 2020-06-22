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
        <a class="pull-left" href="#">
            <img class="media-object" src="..\images\${user_picture!}" />
        </a>
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
<table width="100%" class="table-leader">
    <tr>
        <td><button class="btn btn-white-leader"  onclick="location.href='/showCover'">首页</button></td>
        <td><button class="btn btn-dark-leader" onclick="">个人信息</button></td>
        <td><button class="btn btn-white-leader" onclick="location.href='/showMyJob'">我的任务</button></td>
        <td><button class="btn btn-white-leader"  onclick="location.href='/showPublishJob'">发布任务</button></td>
    </tr>
</table>
<div class="middle_outer middle_inner middle_outer_job">
    <table class="table table-hover" >
        <tr><td width="20px" align="center"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></td>
            <td align="left">${user_sex!}</td>
            <td align="left">${user_birthday!}</td>
            <td align="right "><button type="button" class="btn btn-dark" onclick="location.href='/showMyMessage.do'">修改个人资料</button>
            </td>
        </tr>

        <tr><td width="20px" align="center"><span class="glyphicon glyphicon-usd" aria-hidden="true"></td>
            <td align="left" colspan="2">余额：${user_money!}&nbsp;${(user_money_state!)?string(" ","(冻结中)")}</td>
            <td colspan="1" align="right">
                 <button type="button" class="btn btn-dark" onclick="location.href='/showAddMoney'">钱包</button>
        </tr>
        <tr><td width="20px" align="center">
                <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span></td>
            <td align="left" colspan="2">${user_phone!}</td></tr>
    </table>
    <table class="table">
        <tr><th colspan="4"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;简介</th></tr>

        <tr><td colspan="4" >${user_introduce!}
            </td></tr>
        <#if isPicture == true><tr><td colspan="4" >
            <img src="..\images\${user_introduce_picture!}" width="40%" height="auto">
            </td></tr>
        </#if>
        <tr><td colspan="4" align="right">
                <button type="button" class="btn btn-dark" onclick="location.href='/showUserIntroduce'">编辑</button></td></tr>
        <tr>
            <th colspan="3" align="left">
                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>&nbsp;&nbsp;个性标签</th></tr>
        <tr><td colspan="4" >
                <#list list as list>
                    <button type="button" class="tags">${list.user_tag!}</button>
                </#list>
               <button type="button" class="tags"   onclick="showText()">+</button>
            </td></tr>
    </table>
    <form action="/addUserTag.do" name="addTag" method="post">
        <table>
            <tr>
                <td>
                    <input type="text" name="user_id" value="${user_id!}" style="display: none">
                    <input type="text" class="tags" name="user_tag" id="user_tag" style="display: none">
                </td>
                <td>
                    <button type="button" class="tags" id="addTagBtn" style="display: none" onclick="checkTag()">添加</button>
                </td>
            </tr>
            <tr><td>${tag_exist!}</td></tr>
        </table>
    </form></div>
</body>
</html>