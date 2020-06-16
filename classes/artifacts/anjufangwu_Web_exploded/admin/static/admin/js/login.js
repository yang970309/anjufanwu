// JavaScript Document
//验证登陆的用户名是否存在
function checkuname() {
    var name = $("#username").val();
    if (name == "" || (name.length < 3 || name.length > 12)) {
        $("#checku").html("用户账号不能为空且长度在3～12位之间！");
        $("input[id=username]").focus();
    } else {
        $("#checku").html("");
        $.ajax({
            url: "checkUname.do",
            type: "post",
            data: "uname=" + name,

            dataType: "json",
            success: function (result) {
                if (result.info == "ng") {
                    $("#checku").html("用户名存在，请更换！");
                    $("input[id=username]").html("");
                    return false;
                } else {
                    $("#checku").html("可以用");
                    return true;
                }
            },
            error: function () {
                alert("请求失败！");
                return false;
            }

        });
    }

}

function checkpwd() {
    var pwd = $("#txtPwd").val();
    if (pwd == "" || pwd.length < 6 || pwd.length > 12) {
        $("#prompt_pwd").html("密码不能为空且长度在6～12位之间！");
        $("input[id=txtPwd]").html("");
        $("input[id=txtPwd]").focus();
        return false;
    } else {
        $("#prompt_pwd").html("密码格式正确！");
        return true;
    }

}

function checkpwdc() {
    var pwd = $("#txtPwd").val();
    var pwdc = $("#txtConfirmPwd").val();
    if (pwdc == "" || pwdc != pwd) {
        $("#prompt_confirmpwd").html("两次密码要一致 ！");
        $("input[id=txtConfirmPwd]");
        // $("input[name=passwordc]").focus();
        return false;
    } else {
        $("#prompt_confirmpwd").html("密码一致 ！");
        return true;
    }

}

function checktel() {
    var tel = $("#txtPhone").val();
    var regtel = /^(13|14|15|16|17|18|19)\d{9}$/;
    if (tel == "" || !regtel.test(tel)) {
        $("#prompt_phone").html("电话号码不能为空，且以13，14，15，16，17，18，19开头的11位");
        $("input[id=txtPhone]").html("");
        $("input[id=txtPhone]").focus();
        return false;
    } else {
        $("#prompt_phone").html("电话号码格式正确！");
        return true;
    }

}

function checkname1() {
    var uname = $("#txtName1").val();
    if (uname == "" || uname.length < 2) {
        $("#prompt_name1").html("不能为空且长度在2位以上！");
        $("input[id=txtName1]").html("");
        $("input[id=txtName1]").focus();
        return false;
    } else {

        $("#prompt_name1").html("ok");
        return true;
    }
}

function checkname2() {
    var uname = $("#txtName2").val();
    if (uname == "" || uname.length < 2) {
        $("#prompt_name1").html("不能为空且长度在2位以上！");
        $("input[id=txtName2]").html("");
        $("input[id=txtName2]").focus();
        return false;
    } else {

        $("#prompt_name2").html("ok");
        return true;
    }
}

function checkAll() {
    //alert("kkkkk");
    var flag = false;
    var aa = $("#username").val();
    var pwd = $("#txtPwd").val();
    var pwdc = $("#txtConfirmPwd").val();
    var tel = $("#txtPhone").val();
    /* var name1=$("#txtName1").val();
    var name2=$("#txtName2").val(); */
    var regtel = /^(13|14|15|16|17|18|19)\d{9}$/;
    if (aa != "" && (tel != "" || regtel.test(tel)) &&
        /* (name1!=""||name1.length>2)&&(name2!=""||name2.length>2)&& */
        (pwd != "" || pwd.length > 6 || pwd.length < 12) && (pwdc != "" || pwdc == pwd)) {
        flag = true;
    } else {
        alert("注册信息不完整或不合规范！");
    }
    return flag;

}

// 更新类别名称
function updateTypeName() {
    var name = $("#ftype").val();
    var fid = $("#fid").val();
    if (name == "" || (name.length < 1 || name.length > 12)) {
        $("#checkTypeName").html("名称不能为空且长度在1～12位之间！");
        $("input[id=ftype]").focus();
    } else {
        $("#checkTypeName").html("");
        $.ajax({
            url: "updateTypeName.do",
            type: "post",
            data: {"name": name, "id": fid},
            dataType: "json",
            success: function (result) {
                if (result.info == "ng") {
                    $("#checkTypeName").html("名称存在，请更换！");
                    return false;
                } else {
                    $("#checkTypeName").html("更新成功！");
                    return true;
                }
            },
            error: function () {
                alert("系统处理中！");
                return false;
            }

        });
    }

}

var question = "";
var pwd = "";

// 忘记密码
function checkLossPwd() {
    var name = $("#uname_loss").val();
    if (name == "" || (name.length < 3 || name.length > 12)) {
        $("#checkUname").html("用户账号不能为空且长度在3～12位之间！");
        $("input[id=uname_loss]").focus();
    } else {
        $("#checku").html("");
        $.ajax({
            url: "checkLossPwd.do",
            type: "post",
            data: "uname=" + name,
            dataType: "json",
            success: function (result) {
                if (result.info == "ng") {
                    $("#checkUname").html("用户名不存在，请重新输入！");
                    $("input[id=uname_loss]").focus();
                    return false;
                } else {
                    $("#checkUname").html("用户名正确！");
                    $("input[id=mbanswer_loss]").val(result.answer);
                    question = result.question;
                    pwd = result.pwd;
                    $("#showMbanswer").show();
                    $("#showQuestion").show();
                    return true;
                }
            },
            error: function () {
                alert("请求失败！");
                return false;
            }

        });
    }

}

// 验证密保答案
function checkMiBao() {

    var mbquestion = $("#miBaoQuestion").val();
    if (mbquestion != question) {
        $("#checkMbquestion").html("问题不正确！请重新输入");
    } else {
        $("#checkMbquestion").html("您的密码是" + pwd);
        /*$("#checku").html("");
        $.ajax({
            url : "checkMiBao.do",
            type : "post",
            data : "uname=" + name,
            dataType : "json",
            success : function(result) {
                if (result.info == "ng") {
                    $("#checkUname").html("用户名不存在，请重新输入！");
                    $("input[id=uname_loss]").focus();
                    return false;
                } else {
                    $("#checkUname").html("用户名正确！");
                    $("input[id=mbanswer_loss]").val(result.info);
                    $("#showMbanswer").show();
                    $("#showQuestion").show();
                    return true;
                }
            },
            error : function() {
                alert("请求失败！");
                return false;
            }

        });*/
    }

}



