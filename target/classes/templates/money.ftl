<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
<div class="media-list headertop_message">
    <button type="button" class="btn-return btn-dark btn-block  headertop" onclick="location.href='/showUserMessage'">充值</button>
</div>

<div class="middle_message_list middle_inner">
<form action="/addMoney.do" name="addMoney" class="navbar-form navbar-left" role="search">
    <div class="btn btn-center">
        <table class="table">
            <tr><th width="38%">当前余额</th><td align="left">${money!} RMB</td>

            <tr><th>充值金额</th><td><input type="text" name="user_money" class="form-control" placeholder="请输入充值金额"></td></tr>
                <tr>
                <td colspan="2" align="right">
                    <input type="text" name="old_money" value="${money!}" style="display: none">
                    <button type="submit" class="btn btn-dark" onclick="checkMoney()">充值</button>
                </td></tr>
        </table>
    </div>
</form>
    <form action="/getMoney.do" name="getMoney" class="navbar-form navbar-left" role="search">
        <div class="btn btn-center">
            <table class="table">
                <tr><th width="38%">当前余额</th><td align="left">${money!} RMB</td>

                <tr><th>提取金额</th><td><input type="text" name="user_money" class="form-control" placeholder="请输入提取金额"></td></tr>
                <tr><td>${getMoneyFalse!}</td></tr>
                <tr>
                    <td colspan="2" align="right">
                        <input type="text" name="old_money" value="${money!}" style="display: none">
                        <#if money_state == true>
                            <button type="submit" class="btn btn-dark">提取</button>
                        </#if>
                    </td></tr>
            </table>
        </div>
    </form>
    <table class="table">
        <tr><td align="right">
                <button type="submit" class="btn btn-dark" onclick="location.href='/showAddMoney'">刷新</button>
            </td></tr>
    </table>
</div>

<div class="tabbable tabs-below footertop footertop-message ">

</div>
</body>
</html>