<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<link href="<%=basePath%>/bootstrap/formDesign/css/bootstrap-combined.min.css"
	rel="stylesheet">
<link href="<%=basePath%>/bootstrap/formDesign/css/layoutit.css" rel="stylesheet">
<link href="<%=basePath%>/bootstrap/formDesign/css/docs.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="<%=basePath%>/bootstrap/formDesign/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=basePath%>/bootstrap/formDesign/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="<%=basePath%>/bootstrap/formDesign/fileinput/css/fileinput.min.css">

<script type="text/javascript"
	src="<%=basePath%>/bootstrap/formDesign/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap/formDesign/js/common.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/bootstrap/formDesign/fileinput/js/fileinput.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/bootstrap/formDesign/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/bootstrap/formDesign/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/bootstrap/formDesign/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/bootstrap/formDesign/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/bootstrap/formDesign/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/bootstrap/formDesign/js/jquery.htmlClean.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/bootstrap/formDesign/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/bootstrap/formDesign/ckeditor/config.js"></script>
<script src="<%=basePath%>/bootstrap/formDesign/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap/formDesign/js/scripts.js"></script>
<script type="text/javascript"
	src="<%=basePath%>/bootstrap/formDesign/js/FileSaver.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap/formDesign/js/blob.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap/formDesign/js/myjs.js"></script>
<script type="text/javascript" src="<%=basePath%>/bootstrap/formDesign/js/docs.min.js"></script>