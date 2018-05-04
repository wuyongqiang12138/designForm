var triggerToEdit;
var firstChooseRole = true;
var firstChooseTeam = true;
var pageConfig = {
    pageNum: 1,
    pageSize: 5,
    total: 0,
    triTitle: "",
    triType: ""
}
$(function() {
	getPermissionStart();
	
    $('#form1').validate({
        rules : {
            proTime : {
                number : true
            },
            proDynaforms: {
            	maxlength: 100
            },
            proDerivationScreenTpl: {
            	maxlength: 128
            }
        }
    });
    $("#form4").validate({
        rules : {
            proHeight : {
                digits : true
            },
            proWidth : {
                digits : true
            },
            proTitleX: {
                digits : true
            },
            proTitleY: {
                digits : true
            }
        }
    });
    // “返回”按钮
    $("#back_btn").click(function () {
        window.history.back();
    });

    // “保存”按钮
    $("#save_btn").click(function () {
        if (!$("#form1").valid() || !$("#form4").valid()) {
        	layer.alert("表单填写有异常参数，请检查后再提交");
            return;
        }

        var dataToSend = getData();
        console.log(dataToSend);
        if (!dataToSend.isOk) {
            layer.alert(dataToSend.msg);
            return;
        }
        dataToSend.proStatus = "SETTING";
        $.ajax({
            url: common.getPath() + "/processDefinition/update",
            type: "post",
            dataType: "json",
            data: dataToSend,
            success: function (result) {
                if (result.status == 0) {
                    layer.alert("保存成功");
                } else {
                    layer.alert(result.msg);
                }
            }
        });

    });

    // “配置完成”按钮
    $("#finish_btn").click(function () {
    	 if (!$("#form1").valid() || !$("#form4").valid()) {
             return;
         }

         var dataToSend = getData();
         console.log(dataToSend);
         if (!dataToSend.isOk) {
             layer.alert(dataToSend.msg);
             return;
         }
         dataToSend.proStatus = "SETTED";
         $.ajax({
             url: common.getPath() + "/processDefinition/update",
             type: "post",
             dataType: "json",
             data: dataToSend,
             success: function (result) {
                 if (result.status == 0) {
                     layer.alert("保存成功");
                 } else {
                     layer.alert(result.msg);
                 }
             }
         });
    });

    // 点击选择触发器
    $(".choose_tri").click(function () {
        triggerToEdit = $(this).data('identify');
        getInfo();
        $("#chooseTrigger_container").show();
    });

    // “确认”选择触发器
    $("#chooseTrigger_sureBtn").click(function () {
        var cks = $("[name='tri_check']:checked");
        if (!cks.length) {
            $("#" + triggerToEdit).val('');
            $("#" + triggerToEdit + "Title").val('');
            $("#chooseTrigger_container").hide();
            return;
        }
        if (cks.length > 1) {
            layer.alert("请选择一个触发器，不能选择多个");
            return;
        }
        var ck = cks.eq(0);
        var triUid = ck.val();
        var triTitle = ck.parent().next().html();

        $("#" + triggerToEdit).val(triUid);
        $("#" + triggerToEdit + "Title").val(triTitle);
        $("#chooseTrigger_container").hide();
    });

    // “取消”选择触发器
    $("#chooseTrigger_cancelBtn").click(function () {
        $("#chooseTrigger_container").hide();
    });

    // “查询”按钮
    $("#searchTrigger_btn").click(function () {
        pageConfig.triTitle = $("#triTitle_input").val().trim();
        pageConfig.triType = $("#triType_sel").val();
        pageConfig.pageNum = 1;
        getInfo();
    })

    // 选择发起人员
    $("#chooseUser_btn").click(function () {
    	common.chooseUser('permissionStartUser', 'false');
    });
    
    // 选择发起角色
    $("#chooseRole_btn").click(function(){
    	common.chooseRole('permissionStartRole', 'false');
    });
    
    // 选择发起角色组
    $("#chooseTeam_btn").click(function(){
    	common.chooseTeam('permissionStartTeam', 'false');
    });
    
});

// 获取页面上的数据
function getData() {
    var data = {};
    data.isOk = true; // 数据是否都正常
    data.msg = "";    // 错误信息
    data.proUid = $('[name="proUid"]').val();
    data.proAppId = $('[name="proAppId"]').val();
    data.proVerUid = $('[name="proVerUid"]').val();
    data.proTime = $('[name="proTime"]').val();
    data.proDynaforms = $('[name="proDynaforms"]').val();
    data.proTimeUnit = $('[name="proTimeUnit"]').val();
    data.proDerivationScreenTpl = $('[name="proDerivationScreenTpl"]').val();
    data.proTriStart = $('[name="proTriStart"]').val();
    data.proTriPaused = $('[name="proTriPaused"]').val();
    data.proTriReassigned = $('[name="proTriReassigned"]').val();
    data.proTriDeleted = $('[name="proTriDeleted"]').val();
    data.proTriUnpaused = $('[name="proTriUnpaused"]').val();
    data.proTriCanceled = $('[name="proTriCanceled"]').val();
    data.proHeight = $('[name="proHeight"]').val();
    data.proWidth = $('[name="proWidth"]').val();
    data.proTitleX = $('[name="proTitleX"]').val();
    data.proTitleY = $('[name="proTitleY"]').val();
    data.permissionStartUser = $('[name="permissionStartUser"]').val();
    data.permissionStartRole = $('[name="permissionStartRole"]').val();
    data.permissionStartTeam = $('[name="permissionStartTeam"]').val();
    // if(!/^[0-9]*[1-9][0-9]*$/.test(data.proHeight) || !/^[0-9]*[1-9][0-9]*$/.test(data.proWidth)
    //     || !/^[0-9]*[1-9][0-9]*$/.test(data.proTitleX) || !/^[0-9]*[1-9][0-9]*$/.test(data.proTitleY)){
    //     data.isOk = false;
    //     data.msg = "流程图信息，需要输入正整数";
    // }
    return data;
}

/* 向服务器请求数据   */
function getInfo() {
    $.ajax({
        url: common.getPath() + "/trigger/search",
        type: "post",
        dataType: "json",
        data: {
            "pageNum": pageConfig.pageNum,
            "pageSize": pageConfig.pageSize,
            "triTitle": pageConfig.triTitle,
            "triType": pageConfig.triType
        },
        success: function(result) {
            if (result.status == 0) {
                drawTable(result.data);
            }
        }
    });
}

function drawTable(pageInfo) {
    pageConfig.pageNum = pageInfo.pageNum;
    pageConfig.pageSize = pageInfo.pageSize;
    pageConfig.total = pageInfo.total;
    doPage();
    $("#chooseTrigger_tbody").html("");
    if (pageInfo.total == 0) {
        return;
    }

    var list = pageInfo.list;
    var startSort = pageInfo.startRow;//开始序号
    var trs = "";
    for(var i=0; i<list.length; i++) {
        var trigger = list[i];
        var sortNum = startSort + i;
        var tempWebbot;
        var tempParam;
        if (trigger.triWebbot.length > 20) {
            tempWebbot = trigger.triWebbot.substring(0, 20) + "...";
        } else {
            tempWebbot = trigger.triWebbot;
        }
        if (trigger.triParam.length > 20) {
            tempParam = trigger.triParam.substring(0, 20) + "...";
        } else {
            tempParam = trigger.triParam;
        }
        console.log(tempWebbot)
        trs += '<tr><td><input type="checkbox" name="tri_check" value="' + trigger.triUid + '" lay-skin="primary">'+ sortNum +'</td>'
            + '<td>'+trigger.triTitle+'</td>'
            + '<td>'+trigger.triType+'</td>'
            + '<td title="'+trigger.triWebbot+'">'+tempWebbot+'</td>'
            + '<td title="'+trigger.triParam+'">'+tempParam+'</td>'
            + '</tr>';
    }
    $("#chooseTrigger_tbody").append(trs);
}
// 分页插件刷新
function doPage() {
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage,layer = layui.layer;
        //完整功能
        laypage.render({
            elem: 'lay_page',
            curr: pageConfig.pageNum,
            count: pageConfig.total,
            limit: pageConfig.pageSize,
            layout: ['count', 'prev', 'page', 'next', 'skip'],
            jump: function(obj, first){
                // 点击新页码进入此方法，obj包含了点击的页数的信息
                pageConfig.pageNum = obj.curr;
                pageConfig.pageSize = obj.limit;
                if (!first) {
                    getInfo();
                }
            }
        });
    });
}

// 获得该流程的发起权限
function getPermissionStart() {
	$.ajax({
		url: common.getPath() + "/permission/processStart",
		dataType: "json",
		type: "post",
		data: {
			"proAppId": $('[name="proAppId"]').val(),
			"proUid": $('[name="proUid"]').val(),
		    "proVerUid": $('[name="proVerUid"]').val()
		},
		success: function(result) {
			if (result.status == 0) {
				var map = result.data;
		        $("#permissionStartUser").val(map.permissionStartUser);
		        $("#permissionStartUser_view").val(map.permissionStartUserView);
		        $("#permissionStartRole").val(map.permissionStartRole);
		        $("#permissionStartRole_view").val(map.permissionStartRoleView);
		        $("#permissionStartTeam").val(map.permissionStartTeam);
		        $("#permissionStartTeam_view").val(map.permissionStartTeamView);
			} else {
				layer.alert(result.msg);
			}
		}
	});
}

