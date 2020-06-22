<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="悬赏系统">
    <title>注册</title>
    <!--LINK href="css/Gjun.css" rel=stylesheet-->
    <script type="text/javascript" src = "/js/common.js"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">

</head>
<body>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<div class="media-list headertop">
    <button type="button" class="btn-return btn-dark btn-block  headertop" onclick="href:location'/showLogin'"></button>
</div>

<form action="/addUser.do" method="post" name="register" accept-charset="UTF-8">
        <table cellpadding=15  cellspacing=1 align=center >
            <tr><th colspan="5">注 册</th></tr>

            <tr>
                <td valign=middle colspan="5">
                    <input name="user_id" class="form-control" type="text" placeholder="用户名" value="${register_id!}">
                    ${exist_id!}
                </td>
            </tr>

            <tr>
                <td valign=middle colspan="5">
                    <input name="user_name" class="form-control" type="text" placeholder="昵 称" value="${register_name!}">
                </td>
            </tr>

            <tr>
                <td valign=middle colspan="5">
                    <input name="user_password" class="form-control" type="password" placeholder="密 码">
                </td>
            </tr>

            <tr>
                <td valign=middle colspan="5">
                    <input name="user_phone" class="form-control" type="text" placeholder="联系方式" value="${register_phone!}">
                </td>
            </tr>


            <tr>
                <td valign=middle colspan="5">
                    <input name="user_birthday" class="form-control" max="${today!}" type="date" placeholder="出生日期" value="${register_birthday!}">
                </td>
            </tr>
            <tr><td colspan="3">
                    <input type="radio" name="user_sex" value="男">男
                </td>
                <td colspan="2"><input type="radio" name="user_sex" value="女">女
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button type="button" class="btn btn-dark" onclick="location.href='/showLogin'">返 回</button>
                </td>
                <td></td>
                <td colspan="2">
                    <button type="button" class="btn btn-dark" onclick="checkRegister()">注 册</button>
                </td>
            </tr>

        </table>
    </form>

</body>
</html>