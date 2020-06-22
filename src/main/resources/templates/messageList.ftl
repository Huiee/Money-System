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
<div class="media-list headertop">
    <button type="button" class="btn-return btn-dark btn-block  headertop" onclick="location.href='/showCover'">
       聊一聊
    </button>
</div>


<div class="middle_message_list middle_inner">

    <#list messageList as list>
        <button type="button" class="btn btn-center" onclick="location.href='/message.do?employer_id=${list.speaker_id}&&employer_name=${list.speaker_name}'">
            <table class="table table-cover-list">
                <tr><td width="20%">
                 <#list userList as user>
                  <#if user.user_id == list.speaker_id>
                      <#if user.user_picture??>
                           <img class="media-object-message" src="..\images\${user.user_picture!}" />
                       <#else >
                           <img class="media-object-message" src="..\images\p1.jpg" />

                </#if>
                            </#if>

                        </#list>

                </td><th align="left" colspan="2">

                        ${list.speaker_name!}
                        </th></tr>

            </table>
        </button>

    </#list>
</div>
<div class="tabbable tabs-below footertop footertop-message ">

</div>
</body>
</html>