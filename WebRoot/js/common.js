$(function () {
    //手机端菜单栏特效 开始
    $(document).ready(function () {
        // 浏览器的高度
        var height = $(window).height();
        // 浏览器的高度加在类名为box的DIV 上
        $(".navmain").height(height)
    })
    //点击menuOpen显示MNenuMain菜单
    $('#menuOpen').on('click', function () {
        var menuNav = document.getElementById('MNenuMain');
        menuNav.style.display = "block";
        //一开始直接隐藏菜单
        $(".SonContent").hide();
        //给标题添加点击事件
        $(".mbut").click(function () {
            //当点击的时候,打开菜单,同时其他的菜单隐藏
            $(this).next().slideDown().parent().siblings().children(".SonContent").slideUp();
        }).first().next().slideDown();
        //默认之后第一个菜单打开
    })
    $('#menuClose').on('click', function () {
        var menuNav = document.getElementById('MNenuMain');
        $("#MNenuMain").delay(100).fadeOut("hide");
        //menuNav.style.display="none";
    })
    //手机端菜单栏特效 结束

    //打开顶部搜索框
    $('#searchBut').on('click', function () {
        $("#searchDiv").delay(500).fadeIn("show");
        $("#CommonMask").delay(500).fadeIn("show");
    })
    //关闭顶部搜索框
    $('#CommonMask').on('click', function () {
        $("#searchDiv").delay(500).fadeOut("hide");
        $("#CommonMask").delay(500).fadeOut("hide");
    })
    //首页-打开视频
    $('#openVideoBut').on('click', function () {
        $("#videoDiv").delay(300).fadeIn("show");
        $("#CommonMask").delay(200).fadeIn("show");
    })
    //首页-关闭视频
    $('#CommonMask').on('click', function () {
        $("#videoDiv").delay(400).fadeOut("hide");
        $("#CommonMask").delay(500).fadeOut("hide");
    })

    //顶部搜索关键词不能为空
    $('#serachText').on('click', function () {
        var serachKey = $("#serachKey").val();
        var url = '/why/list.html?key=' + serachKey;
        //alert(1);
        if (serachKey == '') {
            $("#UpdateHint").fadeIn("slow");
            $("#UpdateHint").delay(3000).fadeOut("hide");
            $('#UpdateHint').html('<span>关键词不能为空</span>');
        } else {
            window.setTimeout(location.href = url, 100);
        }
    })


})


//统计评论框输入的字数
function changebyte1(value, length, textareaId) {
    var l = strlengthComm(value);
    if (l <= length) {
        document.getElementById("byte2_" + textareaId).innerText = (length - l);
        document.getElementById("byte1_" + textareaId).innerText = "(您还可输入";
        document.getElementById("byte3_" + textareaId).innerText = "/" + length + "字)";
        return true;
    } else {
        document.getElementById("byte2_" + textareaId).innerText = "(输入字数超出范围)";
        document.getElementById("byte1_" + textareaId).innerText = "";
        document.getElementById("byte3_" + textareaId).innerText = "";
        document.getElementById(textareaId).value = substrComm(value, length);
    }
}

function substrComm(str, len) {
    if (!str || !len) {
        return "";
    }
    //预期计数：中文2字节，英文1字节  
    var a = 0;
    //循环计数  
    var i = 0;
    //临时字串  
    var temp = "";
    for (i = 0; i < str.length; i++) {
        //if (str.charCodeAt(i) > 255) {  
        //按照预期计数增加2  
        //  a += 2;  
        //} else {  
        a++;
        //}  
        //如果增加计数后长度大于限定长度，就直接返回临时字符串  
        if (a > len) {
            return temp;
        }
        //将当前内容加到临时字符串  
        temp += str.charAt(i);
    }
}

function strlengthComm(str) {
    var l = str.length;
    var n = l;
    //for (var i = 0; i < l; i++) {  
    //if (str.charCodeAt(i) < 0 || str.charCodeAt(i) > 255) {  
    //      n++;  
    //}  
    //}  
    return n;
}

