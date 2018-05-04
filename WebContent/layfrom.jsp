<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java"  pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="resources/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
	<textarea class="layui-textarea" id="LAY_demo1" style="display: none">  
	  把编辑器的初始内容放在这textarea即可
	</textarea>

	<div class="site-demo-button" style="margin-top: 20px;">
		<button class="layui-btn site-demo-layedit" data-type="content">获取编辑器内容</button>
		<button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>
		<button class="layui-btn site-demo-layedit" data-type="selection">获取编辑器选中内容</button>
	</div>
	<script src="resources/js/layui.all.js" charset="utf-8"></script>
<script>
	layui.use('layedit', function(){
	  var layedit = layui.layedit
	  ,$ = layui.jquery;
	  
	  //构建一个默认的编辑器
	  var index = layedit.build('LAY_demo1',{
		  tool: [
			  'strong' //加粗
			  ,'italic' //斜体
			  ,'underline' //下划线
			  ,'del' //删除线
			  
			  ,'|' //分割线
			  
			  ,'left' //左对齐
			  ,'center' //居中对齐
			  ,'right' //右对齐
			]
	  });
	  
	  //编辑器外部操作
	  var active = {
	    content: function(){
	      alert(layedit.getContent(index)); //获取编辑器内容
	    }
	    ,text: function(){
	      alert(layedit.getText(index)); //获取编辑器纯文本内容
	    }
	    ,selection: function(){
	      alert(layedit.getSelection(index));
	    }
	  };
	  
	  $('.site-demo-layedit').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
	});
</script>

</body>
</html>