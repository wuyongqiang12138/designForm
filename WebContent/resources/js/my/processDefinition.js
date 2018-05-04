$(function() {
	doPage();
});

function zTreeOnClick(event, treeId, treeNode) {
	if (treeNode.itemType == "processMeta") {
		pageConfig.metaUid = treeNode.id;
		getInfo();
	} else {
		$('#definitionList_tbody').html('');
		pageConfig.pageNum = 1;
		pageConfig.total = 0;
		doPage();
	}
}

function getInfo() {
	// 查询
	$.ajax({
		url : common.getPath()
				+ "/processDefinition/listDefinitionByProcessMeta",
		dataType : "json",
		data : {
			"metaUid" : pageConfig.metaUid,
			"pageNum" : pageConfig.pageNum,
			"pageSize" : pageConfig.pageSize
		},
		type : "post",
		success : function(result) {
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

	$('#definitionList_tbody').html('');
	if (pageInfo.total == 0) {
		return;
	}

	var list = pageInfo.list;
	var startSort = pageInfo.startRow;
	var trs = "";
	for (var i = 0; i < list.length; i++) {
		var vo = list[i];
		var sortNum = startSort + i;

		trs += '<tr>'
				+ '<td><input type="checkbox" name="definition_ck" lay-skin="primary" '
				+ 'data-prouid="'
				+ vo.proUid
				+ '" data-proappid="'
				+ vo.proAppId
				+ '" data-proveruid="'
				+ vo.proVerUid
				+ '" >'
				+ sortNum
				+ '</td>'
				+ '<td>'
				+ vo.proName
				+ '</td>'
				+ '<td>'
				+ vo.proVerUid
				+ '</td>'
				+ '<td>'
				+ vo.verName
				+ '</td>'
				+ '<td>'
				+ vo.isActive
				+ '</td>'
				+ '<td>'
				+ vo.verCreateTime
				+ '</td>'
				+ '<td>'
				+ vo.proStatus
				+ '</td>'
				+ '<td>'
				+ vo.updator
				+ '</td>'
				+ '<td>'
				+ vo.updateTime
				+ '</td>'
				+ '</tr>';
	}
	$("#definitionList_tbody").append(trs);

}

function doPage() {
	layui.use([ 'laypage', 'layer' ], function() {
		var laypage = layui.laypage, layer = layui.layer;
		laypage.render({
			elem : 'lay_page',
			curr : pageConfig.pageNum,
			count : pageConfig.total,
			limit : pageConfig.pageSize,
			layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
			jump : function(obj, first) {
				pageConfig.pageNum = obj.curr;
				pageConfig.pageSize = obj.limit;
				if (!first) {
					getInfo();
				}
			}
		});
	});
}

$(function() {
	// 同步
	$("#synchr_btn").click(function() {
		var cks = $("[name='definition_ck']:checked");
		if (!cks.length) {
			layer.alert("请选择要同步的流程定义");
			return;
		}
		if (cks.length > 1) {
			layer.alert("请选择一个要同步的流程定义，不能选择多个");
			return;
		}

		var ck = cks.eq(0);
		var proUid = ck.data('prouid');
		var proVerUid = ck.data('proveruid');
		var proAppId = ck.data('proappid');

		$.ajax({
			url : common.getPath() + "/processDefinition/create",
			type : "post",
			dataType : "json",
			data : {
				"proUid" : proUid,
				"proVerUid" : proVerUid,
				"proAppId" : proAppId
			},
			success : function(result) {
				if (result.status == 0) {
					getInfo();
					layer.alert("同步成功");
				} else {
					layer.alert(result.msg);
				}
			},
			error : function() {
				layer.alert("同步失败，请稍后再试");
			}
		});
	});

	// “流程配置”按钮
	$("#toEditDefinition_btn")
			.click(
					function() {
						var cks = $("[name='definition_ck']:checked");
						if (!cks.length) {
							layer.alert("请选择一个流程定义");
							return;
						}
						if (cks.length > 1) {
							layer.alert("请选择一个流程定义，不能选择多个");
							return;
						}
						var ck = cks.eq(0);
						var proUid = ck.data('prouid');
						var proVerUid = ck.data('proveruid');
						var proAppId = ck.data('proappid');

						$
								.ajax({
									url : common.getPath()
											+ "/processDefinition/tryEditDefinition",
									dataType : "json",
									type : "post",
									data : {
										"proUid" : proUid,
										"proVerUid" : proVerUid,
										"proAppId" : proAppId
									},
									success : function(result) {
										if (result.status == 0) {
											window.location.href = common
													.getPath()
													+ "/processDefinition/editDefinition?proUid="
													+ proUid
													+ "&proAppId="
													+ proAppId
													+ "&proVerUid="
													+ proVerUid;
										} else {
											layer.alert(result.msg);
										}
									},
									error : function() {
										layer.alert("流程配置异常，请稍后再试");
									}
								});
					});
});

$(function() {
	$("#snapshotFlowChart_btn").click(function() {
		var cks = $("[name='definition_ck']:checked")
		if (!cks.length) {
			layer.alert("请选择一个流程定义");
			return;
		}
		if (cks.length > 1) {
			layer.alert("请选择一个流程定义，不能选择多个");
			return;
		}
		var ck = cks.eq(0);
		var proUid = ck.data('prouid');
		var proVerUid = ck.data('proveruid');
		var proAppId = ck.data('proappid');

		$.ajax({
			url : common.getPath() + "/processDefinition/snapshotFlowChart",
			dataType : "text",
			type : "POST",
			data : {
				"proUid" : proUid,
				"proVerUid" : proVerUid,
				"proAppId" : proAppId
			},
			success : function(result) {
				layer.open({
					type : 2,
					title : '流程快照',
					shadeClose : true,
					shade : 0.8,
					area : [ '790px', '580px' ],
					content : result
				});
			}
		})
	})

	$("#toEditActivityConf_btn").click(
			function() {
				var cks = $("[name='definition_ck']:checked");
				if (!cks.length) {
					layer.alert("请选择一个流程定义");
					return;
				}
				if (cks.length > 1) {
					layer.alert("请选择一个流程定义，不能选择多个");
					return;
				}
				var ck = cks.eq(0);
				var proUid = ck.data('prouid');
				var proVerUid = ck.data('proveruid');
				var proAppId = ck.data('proappid');
				$.ajax({
					url : common.getPath()
							+ "/processDefinition/tryEditDefinition",
					dataType : "json",
					type : "post",
					data : {
						"proUid" : proUid,
						"proVerUid" : proVerUid,
						"proAppId" : proAppId
					},
					success : function(result) {
						if (result.status == 0) {
							window.location.href = common.getPath()
									+ "/activityConf/edit?proUid=" + proUid
									+ "&proAppId=" + proAppId + "&proVerUid="
									+ proVerUid;
						} else {
							layer.alert(result.msg);
						}
					},
					error : function() {
						layer.alert("操作失败，请稍后再试");
					}
				});

			});

});