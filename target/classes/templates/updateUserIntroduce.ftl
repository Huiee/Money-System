<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="悬赏系统">
    <title>修改个人介绍</title>
    <script  type="text/javascript" src = "/js/job.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
</head>

<body>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<div class="media-list headertop">
    <button type="button" class="btn-return btn-dark btn-block  headertop"></button>
</div>
<div class="middle_message_list middle_inner">
    <form action="/updateUserIntroduce.do" name="submitJob" class="navbar-form navbar-left" role="search">
        <div class="btn btn-center">
            <table class="table">
                    <tr><th colspan="3">简介</th></tr>
                    <tr><td colspan="3">
                   <textarea name="user_introduce"class="form-control" rows="3" >${user.user_introduce!}</textarea>
                        </td></tr>
                    <tr><th colspan="3">上传图片</th></tr>
                <#if user.user_introduce_picture??>
                <tr><td colspan="3"><img src="..\images\${user.user_introduce_picture!}" width="40%" height="auto">
                    </td></tr>
                        </#if>
                    <tr><td colspan="3"><input type="file" name="user_introduce_picture" class="btn-picture"></td></tr>
                <tr><td colspan="3">
                        <button type="submit" class="btn btn-dark">提交</button>
                    </td></tr>
            </table>
        </div>
    </form>

</div>

<div class="tabbable tabs-below footertop footertop-message ">

</div>
</body>
</html>