<!--文件头开始-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="悬赏系统">
    <title>发布任务</title>
    <script  type="text/javascript" src = "/js/job.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css">
</head>

<body>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<button type="button" class="btn-return btn-dark btn-block  headertop-cover" onclick="location.href='/showCover'"></button>

<form action="/addJob.do" method="post" class=" middle_publish_job middle_inner " name="newJob">
    <div class="btn btn-center">
        <table class="table table-hover">
            <tr><th colspan="3">标题</th></tr>
            <tr><td colspan="3"><input type="text" name="job_title" id="job_title" class="form-control" placeholder="任务标题" value="${job_title!}"></td></tr>
            <tr><th colspan="3">具体要求</th></tr>
            <tr><td colspan="3"><textarea name="job_content"class="form-control" rows="3" >${job_content!}</textarea></td></tr>
            <tr><th colspan="1" width="35%">任务类型</th>
                <td colspan="2">
                    <select name="job_type">
                        <option value="教育">教育</option>
                        <option value="文学">文学</option>
                        <option value="艺术">艺术</option>
                        <option value="社科">社科</option>
                        <option value="影视">影视</option>
                        <option value="数码">数码</option>
                    </select>
                </td></tr>
            <tr><th colspan="1" width="35%">任务时间</th>
                <td colspan="2"><input name="job_deadline_time" type="date" min="${today!}" "></td></tr>
            <tr><th colspan="3">上传图片</th></tr>
            <tr>
                <td colspan="3"><input type="file" name="job_picture" class="btn-picture"></td>
            </tr>
            <tr><th colspan="3">任务方向</th></tr>
            <tr>
                <td colspan="1">
                    <input type="checkbox"  name="consult" id="consult" value="consult">咨询
                </td>
                <td colspan="2"><input type="text"  name="consult_reward" value="${consult_reward!}" class="form-control" placeholder="咨询奖金"></td>

            </tr>
            <tr>
                <td colspan="1">
                    <input type="checkbox" name="guide" id="guide" value="guide">指导
                </td>
                <td colspan="2"><input type="text"  name="guide_reward" value="${guide_reward!}" class="form-control" placeholder="指导奖金"></td>

            </tr>
            <tr><th colspan="3">保证金</th></tr>
            <tr>
                <td colspan="3"><input type="radio" name="is_cash_deposit" id="is_cash_deposit" value="false" checked>不需要</td>
            </tr>
            <tr>
                <td colspan="1" >
                    <input type="radio" name="is_cash_deposit" id="is_cash_deposit" value="true">需要</td>
                <td colspan="2" >
                    <input type="text" class="form-control" name="cash_deposit" value="${cash_deposit!}" placeholder="保证金">
                </td>
            </tr>
            <tr><td colspan="3" align="right">
                    <input type="text" style="display: none" name="user_money" value="${user_money!}">
                    <button type="button" class="btn btn-dark" onclick="checkNewJob()">发布</button>
                </td></tr>
        </table>
    </div>
</form>

</body>
</html>