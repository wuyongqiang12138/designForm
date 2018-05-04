<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<link href="<%=basePath%>/lib/bootstrap-combined.min.css"
	rel="stylesheet">
<link href="<%=basePath%>/bootstrap/formDesign/css/layoutit.css" rel="stylesheet">
<!-- 引入css -->
<link href="<%=basePath%>/resources/css/layui.css" rel="stylesheet">
<link href="<%=basePath%>/resources/css/modules/laydate/default/laydate.css" rel="stylesheet">
<link href="<%=basePath%>/resources/css/my.css" rel="stylesheet">

<!-- 全局js -->
<script src="<%=basePath%>/resources/js/jquery-3.3.1.js"></script>
<script src="<%=basePath%>/resources/js/jquery.validate.min.js"></script>
<script src="<%=basePath%>/resources/js/dwz.regional.zh_CN.js"></script>
<script src="<%=basePath%>/resources/js/common.js"></script>
<script src="<%=basePath%>/resources/js/jquery.fastLiveFilter.js"></script>
<script src="<%=basePath%>/resources/js/layui.all.js"></script>
<script src="<%=basePath%>/my.js"></script>
