//检查发布工作信息
function checkNewJob() {
    if(document.newJob.job_title.value == "") {
            alert("请输入标题！");
            document.newJob.job_title.focus();
            return false;
    }
    if(document.newJob.job_content.value == "") {
        alert("请输入工作要求！");
        document.newJob.job_content.focus();
        return false;
    }
    if(document.newJob.job_type.value == ""){
        alert("请选择任务类型");
        document.newJob.job_type.focus();
        return false;
    }
    var consult_reward = 0.00;
    var guide_reward =0.00;
    if(document.newJob.consult_reward.value !="" ){
        consult_reward =document.newJob.consult_reward.value;
    }
    if(document.newJob.guide_reward.value !="" ){
        guide_reward =document.newJob.guide_reward.value;
    }
    var sum = parseFloat(guide_reward )+parseFloat(consult_reward);
    var money =document.newJob.user_money.value;
    if(sum > money){
        alert("余额不足！");
        return false;
    }
    alert("提交成功");
    document.newJob.submit();
}

function showAddConsultReward() {
    var showAddConsultReward= document.getElementById("new_consult_reward");
    showAddConsultReward.style.display="block";
    var showConsultBtn= document.getElementById("addConsultBtn");
    showConsultBtn.style.display="none";
}

function showAddGuideReward() {
    var showAddGuideReward= document.getElementById("new_guide_reward");
    showAddGuideReward.style.display="block";
    var showGuideBtn= document.getElementById("addGuideBtn");
    showGuideBtn.style.display="none";
}

function checkJobContent() {
    if(document.submitJob.employee_job_content.value == "") {
        alert("请输入任务内容！");
        document.submitJob.employee_job_content.focus();
        return false;
    }
    document.submitJob.submit();
}
