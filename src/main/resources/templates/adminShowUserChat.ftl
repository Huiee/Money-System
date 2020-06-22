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

<button type="button" class="btn-return btn-dark btn-block  headertop-cover" onclick="location.href='/checkUserAppeal'"> ${speaker_name!}(id:${speaker_id}) 与${listener_name!}(id:${listener_name!})的聊天记录</button>


<div class="middle_message middle_inner">
    <#list chat as chat>
        <#list users as user>
        <#if chat.speaker_id == speaker_id && user.user_id == speaker_id>
            <table class="table-message">
                <tr>
                    <td align="right" class="td-message2">
                        <button class="tags">
                            ${chat.mes_content!}</button>&nbsp;&nbsp;</td>
                    <td align="right" class="td-message">
                        <img class="media-message-right" src="../images/${user.user_picture!}" aria-hidden="true"></img>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </#if>
        <#if chat.speaker_id != speaker_id && user.user_id == listener_id>
            <table class="table-message">
                <tr >
                    <td class="td-message">
                        <img class="media-message-left" src="../images/${user.user_picture!}" aria-hidden="true"></img></td>
                    <td class="td-message2"align="left" >
                        <button class="tags">${chat.mes_content!}</button></td>
                </tr>
            </table>
        </#if>
        </#list>
    </#list>

</div>
<div class="tabbable tabs-below footertop footertop-message ">

</div>
</body>
</html>