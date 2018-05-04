<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<%@include file="head.jsp"%>
<title>Insert title here</title>
<style>
.layui-form-label {
	text-align: left;
	padding: 6px 0;
	width: 60px;
}

input[type='date'] {
	cursor: pointer;
}

#file_load_hide {
	display: none;
}
</style>
</head>
<body style="margin-left: 0px; padding: 10px;">
	<!-- 这里包含你用表单设计器设计的表单文件 -->
	<jsp:include page="test0001.html"></jsp:include>
	<div id="file_load_hide">
		<div class="display_container model">
			<div class="display_content">
				<div class="top">文件上传</div>
				<div class="middle">
					<div class="layui-upload-drag" style="width:89%;">
						<i class="layui-icon"></i>
						<p>点击上传，或将文件拖拽到此处</p>
					</div>
					<div class="layui-upload">
						<div class="layui-upload-list">
							<table class="layui-table">
								<thead>
									<tr>
										<th>文件名</th>
										<th>大小</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody class="fileList"></tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="foot">
					<button type="button" class="layui-btn listAction">开始上传</button>
					<button class="layui-btn layui-btn layui-btn-primary cancel_btn" onclick="cancelClick(this)">取消</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>