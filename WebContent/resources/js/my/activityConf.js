var triggerToEdit = "";
var pageConfig = {
	    pageNum: 1,
	    pageSize: 5,
	    total: 0,
	    triTitle: "",
	    triType: ""
	};

layui.use('form', function(){
    var form = layui.form;
    form.on('select(assignType)', function(data){         
          if(data.value=="roleAndDepartment"){ 
          	$("#handleRole_div").show();
          	$("#handleTeam_div").hide();
          	$("#handleUser_div").hide();
          	$("#handleField_div").hide();
          }else  if(data.value=="roleAndCompany"){ 
          	$("#handleRole_div").show();
              $("#handleTeam_div").hide();
              $("#handleUser_div").hide();
              $("#handleField_div").hide();
          }else  if(data.value=="teamAndDepartment"){ 
              $("#handleRole_div").hide();
              $("#handleTeam_div").show();
              $("#handleRole_div").hide();
              $("#handleField_div").hide();
          }else  if(data.value=="teamAndCompany"){ 
          	$("#handleRole_div").hide();
              $("#handleTeam_div").show();
              $("#handleUser_div").hide();
              $("#handleField_div").hide();
          }else if(data.value=="leaderOfPreActivityUser"){ 
          	$("#handleRole_div").hide();
              $("#handleTeam_div").hide();
              $("#handleUser_div").hide();
              $("#handleField_div").hide();
          }else if(data.value=="users"){ 
          	$("#handleRole_div").hide();
              $("#handleTeam_div").hide();
              $("#handleUser_div").show();
              $("#handleField_div").hide();
          }else if(data.value=="processCreator"){ 
          	$("#handleRole_div").hide();
              $("#handleTeam_div").hide();
              $("#handleUser_div").hide();
              $("#handleField_div").hide();
          }else if(data.value=="byField"){ 
          	$("#handleRole_div").hide();
              $("#handleTeam_div").hide();
              $("#handleUser_div").hide();
              $("#handleField_div").show();
          }           
      }); 
    
      form.on('select(rejectType)', function(data){
      	if (data.value == "toActivities"){
      		$("#rejectActivities_div").show();
        } else {
        	$("#rejectActivities_div").hide();
        }
      });   
      
      form.on('radio(canReject)', function(data){
    	  if (data.value == "TRUE") {
    		  $("#rejectType_div").show();
    		  if ($('select[name="actcRejectType"]').val() == 'toActivities') {
    			  $("#rejectActivities_div").show();
    		  } else {
    			  $("#rejectActivities_div").hide();
    		  }
    	  } else {
    		  $("#rejectType_div").hide();
    		  $("#rejectActivities_div").hide();
    	  }
      });
  });

// 页面加载完成
$(function(){
	initCollapse();
	getConfData(firstHumanMeteConf);
	
	$('#sla_form').validate({
        rules : {
        	actcTime : {
                number : true
            }
           
        }
    });
	
	$("#back_btn").click(function() {
		window.history.back();
	});
	
	$("#choose_outtimeTri_btn").click(function() {
		triggerToEdit = 'actcOuttimeTrigger';
		getTriggerInfo();
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
    $("#chooseTrigger_cancelBtn").click(function(){
    	$("#chooseTrigger_container").hide();
    });
    
    // 选择处理人（人员）
    $("#choose_handle_user").click(function() {
    	common.chooseUser('handleUser', 'false');
    });
    // 选择处理人（角色）
    $("#choose_handle_role").click(function() {
    	common.chooseRole('handleRole', 'false');
    });
    // 选择处理人（角色组）
    $("#choose_handle_team").click(function() {
    	common.chooseTeam('handleTeam', 'false');
    });
    
    
});

// 初始化折叠菜单
function initCollapse() {
	$.ajax({
		url : common.getPath() + "/activityMeta/getActivitiyMetasForConfig",
		type : "post",
		dataType : "json",
		data : {
			"proAppId": proAppId,
			"proUid": proUid,
			"proVerUid": proVerUid
		},
		success : function(result){
			if(result.status == 0){
			    printCollapse(result.data);
			}else{
				layer.alert(result.msg);
			}
		},
		error : function(){
			layer.alert('操作失败');
		}
	});
}
function printCollapse(list) {
	var str = '';
	for (var i=0; i<list.length; i++) {
		var process = list[i];
		var name = process.name;
		var children = process.children;
		str += '<div class="layui-colla-item">'
		    +     '<h2 class="layui-colla-title">'+name+'</h2>';
		if (process.id == 'main') {
			str += '<div class="layui-colla-content layui-show" id="content'+i+'">';
		} else {
			str += '<div class="layui-colla-content " id="content'+i+'">';
		}
		str += '<ul class="link_list">';    
		for (var j=0; j<children.length; j++) {
			var meta = children[j];
			if (meta.activityId == firstHumanMeta) {
				str += '<li data-uid="'+meta.actcUid+'" class="link_active" onclick="clickLi(this);">'+meta.activityName+'</li>';
			} else {
				str += '<li data-uid="'+meta.actcUid+'" onclick="clickLi(this);">'+meta.activityName+'</li>';
			}
		}
		str +=   '</ul>'
			  + '</div>'
			+ '</div>';
	}
	$("#my_collapse").append(str);
	layui.use('element', function(){
		var element = layui.element;
		element.init();
	});
	
}
// 点击 li
function clickLi(li) {
	var $li = $(li);
	if ($li.hasClass('link_active')) {
		return;
	} else {
		$("#my_collapse li").each(function() {
			$(this).removeClass('link_active');
		});
		$li.addClass('link_active');
		console.log($li.data('uid'));
	}
}
function getConfData(actcUid) {
	$.ajax({
		url: common.getPath() + "/activityConf/getData",
		type: "post",
		dataType: "json",
		data: {
			"actcUid": actcUid
		},
		success : function(result){
			if(result.status == 0){
			    console.log(result.data);
			    initConf(result.data);
			}else{
				layer.alert(result.msg);
			}
		},
		error : function(){
			layer.alert('操作失败,请稍后再试');
		}
	});
}
function initConf(map) {
	var conf = map.conf;
	console.log(conf);
	$('input[name="actcSort"]').val(conf.actcSort);
	$('input[name="actcTime"]').val(conf.actcTime);
	$('input[name="actcMailNotifyTemplate"]').val(conf.actcMailNotifyTemplate);
	$('input[name="actcOuttimeTrigger"]').val(conf.actcOuttimeTrigger);
	$('input[name="actcOuttimeTriggerTitle"]').val(conf.actcOuttimeTriggerTitle);
	
	$('textarea[name="actcResponsibility"]').val(conf.actcResponsibility);
	
	$('select[name="actcTimeunit"]').val(conf.actcTimeunit);
	$('select[name="actcAssignType"]').val(conf.actcAssignType);
	showHandleDiv(conf.actcAssignType);
	
	$('select[name="actcAssignVariable"]').val(conf.actcAssignVariable);
	$('select[name="signCountVarname"]').val(conf.signCountVarname);
	$('select[name="actcRejectType"]').val(conf.actcRejectType);
	if (conf.actcRejectType == "toActivities") {
		$("#rejectType_div").show();
	} else {
		$("#rejectType_div").hide();
	}
	
	$('input[name="actcCanEditAttach"]').each(function(){
		if ($(this).val() == conf.actcCanEditAttach) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	$('input[name="actcCanUploadAttach"]').each(function(){
		if ($(this).val() == conf.actcCanUploadAttach) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	$('input[name="actcCanDeleteAttach"]').each(function(){
		if ($(this).val() == conf.actcCanDeleteAttach) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	$('input[name="actcCanDelegate"]').each(function(){
		if ($(this).val() == conf.actcCanDelegate) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	$('input[name="actcCanMessageNotify"]').each(function(){
		if ($(this).val() == conf.actcCanMessageNotify) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	$('input[name="actcCanMailNotify"]').each(function(){
		if ($(this).val() == conf.actcCanMailNotify) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	$('input[name="actcCanReject"]').each(function(){
		if ($(this).val() == conf.actcCanReject) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	
	
	$('input[name="actcCanRevoke"]').each(function(){
		if ($(this).val() == conf.actcCanRevoke) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	$('input[name="actcCanAutocommit"]').each(function(){
		if ($(this).val() == conf.actcCanAutocommit) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	$('input[name="actcCanAdd"]').each(function(){
		if ($(this).val() == conf.actcCanAdd) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	$('input[name="actcCanApprove"]').each(function(){
		if ($(this).val() == conf.actcCanApprove) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	$('input[name="actcCanChooseUser"]').each(function(){
		if ($(this).val() == conf.actcCanChooseUser) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	$('input[name="actcCanTransfer"]').each(function(){
		if ($(this).val() == conf.actcCanTransfer) {
			$(this).prop("checked", true);
		} else {
			$(this).prop("checked", false);
		}
	});
	
	
	
	layui.form.render();
}

/* 向服务器请求数据   */
function getTriggerInfo() {
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
    doTriggerPage();
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
//分页插件刷新
function doTriggerPage() {
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
                    getTriggerInfo();
                }
            }
        });
    });
}
// “查询”按钮
$("#searchTrigger_btn").click(function () {
    pageConfig.triTitle = $("#triTitle_input").val().trim();
    pageConfig.triType = $("#triType_sel").val();
    pageConfig.pageNum = 1;
    getTriggerInfo();
})

function showHandleDiv(assignType) {
    if(assignType=="roleAndDepartment"){ 
    	$("#handleRole_div").show();
    	$("#handleTeam_div").hide();
    	$("#handleUser_div").hide();
    	$("#handleField_div").hide();
    }else if(assignType=="roleAndCompany"){ 
    	$("#handleRole_div").show();
        $("#handleTeam_div").hide();
        $("#handleUser_div").hide();
        $("#handleField_div").hide();
    }else if(assignType=="teamAndCompany"){ 
        $("#handleRole_div").hide();
        $("#handleTeam_div").show();
        $("#handleRole_div").hide();
        $("#handleField_div").hide();
    }else  if(assignType=="teamAndCompany"){ 
    	$("#handleRole_div").hide();
        $("#handleTeam_div").show();
        $("#handleUser_div").hide();
        $("#handleField_div").hide();
    }else if(assignType=="leaderOfPreActivityUser"){ 
    	$("#handleRole_div").hide();
        $("#handleTeam_div").hide();
        $("#handleUser_div").hide();
        $("#handleField_div").hide();
    }else if(assignType=="users"){ 
    	$("#handleRole_div").hide();
        $("#handleTeam_div").hide();
        $("#handleUser_div").show();
        $("#handleField_div").hide();
    }else if(assignType=="processCreator"){ 
    	$("#handleRole_div").hide();
        $("#handleTeam_div").hide();
        $("#handleUser_div").hide();
        $("#handleField_div").hide();
    }else if(assignType=="byField"){ 
    	$("#handleRole_div").hide();
        $("#handleTeam_div").hide();
        $("#handleUser_div").hide();
        $("#handleField_div").show();
    }  
}
