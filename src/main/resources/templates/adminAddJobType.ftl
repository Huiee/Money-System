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
        margin-left: 30%;
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
    <button type="button"  class="btn btn-dark" onclick="location.href='/'">任务分类</button>
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
<div class="middle_outer_cover_appeal middle_inner ">
    <form action="/addJobType.do" method="post" name="">
        <div class="table-style">
            <table ><tr><th>任务类型</th><th>说明</th><th>图片</th><th>操作</th></tr>
                <#list job_type as job>
                    <tr><td>${job.job_type!}</td><td>
                            <#if job.job_type_content??>${job.job_type_content!}<#else >无说明</#if>
                        </td><td><#if job.job_type_picture??>
                                <img src="..\images\${job.job_type_picture!}" width="50%" height="auto">
                            <#else ></#if></td><td></td></tr>
                </#list>
                <td><input type="text"  name="job_type" id="job_type"  class="form-control" placeholder="任务类型">
                </td><td><textarea rows="5" name="job_type_content"></textarea></td>
                <td><input type="file" name="job_type_picture" class="btn-picture"></td>
                <td><button type="submit"  class="btn btn-blue" >增加</button></td>
            </table>
        </div>
    </form>
</div>

</body>
</html>