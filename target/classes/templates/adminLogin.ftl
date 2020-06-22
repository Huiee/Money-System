<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="悬赏系统">
    <title>登陆</title>
    <script  type="text/javascript" src = "/js/common.js"></script>
    <!--LINK href="css/Gjun.css" rel=stylesheet-->
</head>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/common.css">

<body  >
<meta name="viewport" content="width=device-width, initial-scale=1" />
<div class="media-list headertop">
    <button type="button" class="btn-return btn-dark btn-block  headertop"></button>
</div>

<div class="middle_login">

    <br><br>
    <form action="/adminLogin.do" method="post" name="login" accept-charset="UTF-8" >
        <table cellpadding=20 cellspacing=1 align=center >
            <tr><th align="center" colspan="7">登 陆</th></tr>
            <tr><td colspan="7"></td></tr>
            <tr>
                <td valign=middle colspan="7">
                    <input name="user_id" class="form-control input-login" type="text" placeholder="账 号" value="${login_id!}">

                </td>
            </tr>
            <tr>
                <td valign=middle  colspan="7">
                    <input name="user_password" class="form-control input-login" type="password" placeholder="密 码" >
                </td>
            </tr>
            <tr><td>${error_id!}</td></tr>
            <tr>
                <td colspan="7">
                    <button type="button" class="btn btn-dark btn-block" onclick="javascript:checkLogin()">登 录</button>
                </td>
            </tr>

        </table>
    </form>
</div>
</body>
</html>