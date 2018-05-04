<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<%@include file="formDesHead.jsp" %>
</head>
<body style="min-height: 660px; cursor: auto; background: url(formDesign/img/builderBg.png) repeat" class="edit">
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<div class="nav-collapse collapse">
					<ul class="nav" id="menu-layoutit">
						<!-- <li class="divider-vertical"></li> -->
						<li>
							<div class="btn-group">
								<button onclick="resizeCanvas('lg')" class="btn btn-primary">
									<i class="fa fa-desktop"></i>
								</button>
								<button onclick="resizeCanvas('md')" class="btn btn-primary">
									<i class="fa fa-laptop"></i>
								</button>
								<button onclick="resizeCanvas('sm')" class="btn btn-primary">
									<i class="fa fa-tablet"></i>
								</button>
								<button onclick="resizeCanvas('xs')" class="btn btn-primary">
									<i class="fa fa-mobile-phone"></i>
								</button>
							</div>
							<div class="btn-group" data-toggle="buttons-radio">
								<button type="button" id="edit" class="btn btn-primary active">
									<i class="icon-edit icon-white"></i>编辑
								</button>
								<button type="button" class="btn btn-primary" id="sourcepreview">
									<i class="icon-eye-open icon-white"></i>预览
								</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-primary"
									data-target="#downloadModal" rel="/build/downloadModal"
									role="button" data-toggle="modal">
									<i class="icon-chevron-down icon-white"></i>下载
								</button>
								<button class="btn btn-primary" href="#clear" id="clear">
									<i class="icon-trash icon-white"></i>清空
								</button>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="changeDimension">
			<div class="row-fluid">
				<div class="">
					<div class="sidebar-nav">
						<ul class="nav nav-list accordion-group">
							<li class="nav-header">
								<div class="pull-right popover-info">
									<i class="icon-question-sign "></i>
									<div class="popover fade right">
										<div class="arrow"></div>
										<h3 class="popover-title">帮助</h3>
										<div class="popover-content">在这里选择布局格式</div>
									</div>
								</div> <i class="icon-plus icon-white"></i>
								布局系统
							</li>
							<li style="display: list-item;" class="rows" id="estRows">
								<div class="lyrow ui-draggable">
									<a href="#close" class="remove label label-important"><i
										class="icon-remove icon-white"></i>删除</a> 
									<span class="drag label"><i class="icon-move"></i>拖动</span>
									<div class="preview">
										<input value="单列" type="text" disabled/>
									</div>
									<div class="view">
										<div class="row-fluid clearfix">
											<div class="span12 column"></div>
										</div>
									</div>
								</div>
								
								<div class="lyrow ui-draggable">
									<a href="#close" class="remove label label-important"><i
										class="icon-remove icon-white"></i>删除</a> 
									<span class="drag label"><i class="icon-move"></i>拖动</span>
									<div class="preview">
										<input value="双列" type="text" disabled/>
									</div>
									<div class="view">
										<div class="row-fluid clearfix">
											<div class="span6 column"></div>
											<div class="span6 column"></div>
										</div>
									</div>
								</div>
								
								<div class="lyrow ui-draggable">
									<a href="#close" class="remove label label-important"><i
										class="icon-remove icon-white"></i>删除</a> 
									<span class="drag label"><i class="icon-move"></i>拖动</span>
									<div class="preview">
										<input value="三列" type="text" disabled/>
									</div>
									<div class="view">
										<div class="row-fluid clearfix">
											<div class="span4 column"></div>
											<div class="span4 column"></div>
											<div class="span4 column"></div>
										</div>
									</div>
								</div>
								
								<div class="lyrow ui-draggable">
									<a href="#close" class="remove label label-important"><i
										class="icon-remove icon-white"></i>删除</a> 
									<span class="drag label"><i class="icon-move"></i>拖动</span>
									<div class="preview">
										<input value="四列" type="text" disabled/>
									</div>
									<div class="view">
										<div class="row-fluid clearfix">
											<div class="span3 column"></div>
											<div class="span3 column"></div>
											<div class="span3 column"></div>
											<div class="span3 column"></div>
										</div>
									</div>
								</div>
								
								<!-- 模板 -->
								<div class="lyrow ui-draggable">
									<a href="#close" class="remove label label-important"><i
										class="icon-remove icon-white"></i>删除</a> 
									<span class="drag label"><i class="icon-move"></i>拖动</span>
									<div class="preview">
										<input value="2 4 6" type="text"/>
									</div>
									<div class="view">
										<div class="row-fluid clearfix">
											<div class="span2 column"></div>
											<div class="span4 column"></div>
											<div class="span6 column"></div>
										</div>
									</div>
								</div>
							</li>
						</ul>
						<ul class="nav nav-list accordion-group">
							<li class="nav-header"><i class="icon-plus icon-white"></i>
								表单组件
								<div class="pull-right popover-info">
									<i class="icon-question-sign "></i>
									<div class="popover fade right">
										<div class="arrow"></div>
										<h3 class="popover-title">帮助</h3>
										<div class="popover-content">
											这里提供了一系列表单常用组件，你可以通过区块右上角的编辑按钮修改组件属性。</div>
									</div>
								</div>
							</li>
							<!-- 单行文本框 -->
							<li style="display: none;" class="boxes" id="elmBase">
								<div class="box box-element ui-draggable">
									<a href="#close" class="remove label label-important">
										<i class="icon-remove icon-white"></i>删除
									</a> 
									<span class="drag label">
										<i class="icon-move"></i>拖动
									</span> 
									<span class="configuration">
										<button type="button" class="btn btn-mini edit-attr" title="edit-text" onclick="showTextModal(this);"
												role="button" data-toggle="modal">编辑
										</button>  
									</span>
									<div class="preview">单行文本框</div>
									<div class="view">
										<div class="form-group">
											<div class="labelDiv" col="1">
												<label>text</label>
											</div>
											<div class="subDiv">
												<input type="text" col="1"/>
											</div>
										</div>
									</div>
								</div>
								<!-- 数字文本框 -->
								<div class="box box-element ui-draggable">
									<a href="#close" class="remove label label-important">
										<i class="icon-remove icon-white"></i>删除
									</a> 
									<span class="drag label">
										<i class="icon-move"></i>拖动
									</span> 
									<span class="configuration">
										<button type="button" class="btn btn-mini edit-attr" title="edit-number" onclick="showNumberModal(this);"
												role="button" data-toggle="modal">编辑
										</button>  
									</span>
									<div class="preview">数字文本框</div>
									<div class="view">
										<div class="form-group">
											<div class="labelDiv" col="1">
												<label>number</label>
											</div>
											<div class="subDiv">
												<input type="tel" col="1"/>
											</div>
										</div>
									</div>
								</div>
								<!-- 日期文本框 -->
								<div class="box box-element ui-draggable">
									<a href="#close" class="remove label label-important">
										<i class="icon-remove icon-white"></i>删除
									</a> 
									<span class="drag label">
										<i class="icon-move"></i>拖动
									</span> 
									<span class="configuration">
										<button type="button" class="btn btn-mini edit-attr" title="edit-date" onclick="showDateModal(this);"
												role="button" data-toggle="modal">编辑
										</button>  
									</span>
									<div class="preview">日期文本框</div>
									<div class="view">
										<div class="form-group">
											<div class="labelDiv" col="1">
												<label>date</label>
											</div>
											<div class="subDiv input-append date">
												<input type="date" col="1" readonly/>
												<span class="add-on"><i class="icon-calendar"></i></span>
											</div>
										</div>
									</div>
								</div>
								<!-- 多行文本框 -->
								<div class="box box-element ui-draggable">
									<a href="#close" class="remove label label-important">
										<i class="icon-remove icon-white"></i>删除
									</a> 
									<span class="drag label">
										<i class="icon-move"></i>拖动
									</span> 
									<span class="configuration">
										<button type="button" class="btn btn-mini edit-attr" title="edit-date" onclick="showTextareaModal(this);"
												role="button" data-toggle="modal">编辑
										</button>  
									</span>
									<div class="preview">多行文本框</div>
									<div class="view">
										<div class="form-group">
											<div class="labelDiv" col="1">
												<label>textarea</label>
											</div>
											<div class="subDiv">
												<textarea rows="1" col="1" style="resize:none"></textarea>
											</div>
										</div>
									</div>
								</div>
								<!-- 下拉列表框 -->
								<div class="box box-element ui-draggable">
									<a href="#close" class="remove label label-important">
										<i class="icon-remove icon-white"></i>删除
									</a> 
									<span class="drag label">
										<i class="icon-move"></i>拖动
									</span> 
									<span class="configuration">
										<button type="button" class="btn btn-mini edit-attr" title="edit-date" onclick="showSelectModal(this);"
												role="button" data-toggle="modal">编辑
										</button>  
									</span>
									<div class="preview">下拉列表框</div>
									<div class="view">
										<div class="form-group">
											<div class="labelDiv" col="1">
												<label>select</label>
											</div>
											<div class="subDiv">
												<select col="1">
													<option value="---请选择---">---请选择---</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<!-- 单选框 -->
								<div class="box box-element ui-draggable">
									<a href="#close" class="remove label label-important">
										<i class="icon-remove icon-white"></i>删除
									</a> 
									<span class="drag label">
										<i class="icon-move"></i>拖动
									</span> 
									<span class="configuration">
										<button type="button" class="btn btn-mini edit-attr" title="edit-date" onclick="showRadioModal(this);"
												role="button" data-toggle="modal">编辑
										</button>  
									</span>
									<div class="preview">单选框</div>
									<div class="view">
										<div class="form-group">
											<div class="labelDiv" col="1">
												<label>radio</label>
											</div>
											<div class="subDiv" col="1">
												<label class="radio">
													<input type="radio" name="optionsRadios" checked/>radioValue
												</label>
											</div>
										</div>
									</div>
								</div>
								<!-- 多选框 -->
								<div class="box box-element ui-draggable">
									<a href="#close" class="remove label label-important">
										<i class="icon-remove icon-white"></i>删除
									</a> 
									<span class="drag label">
										<i class="icon-move"></i>拖动
									</span> 
									<span class="configuration">
										<button type="button" class="btn btn-mini edit-attr" title="edit-date" onclick="showCheckboxModal(this);"
												role="button" data-toggle="modal">编辑
										</button>  
									</span>
									<div class="preview">多选框</div>
									<div class="view">
										<div class="form-group">
											<div class="labelDiv" col="1">
												<label>checkbox</label>
											</div>
											<div class="subDiv" col="1">
												<label class="checkbox">
													<input type="checkbox" checked/>checkboxValue
												</label>
											</div>
										</div>
									</div>
								</div>
								<!-- 文件上传按钮 -->
								<div class="box box-element ui-draggable">
									<a href="#close" class="remove label label-important">
										<i class="icon-remove icon-white"></i>删除
									</a> 
									<span class="drag label">
										<i class="icon-move"></i>拖动
									</span> 
									<span class="configuration">
										<button type="button" class="btn btn-mini edit-attr" title="edit-date" onclick="showLoadFileModal(this);"
												role="button" data-toggle="modal">编辑
										</button>  
									</span>
									<div class="preview">文件上传按钮</div>
									<div class="view">
										<div class="form-group">
											<div class="labelDiv" col="1">
												<label>loadbutton
												</label>
											</div>
											<div class="subDiv" col="1">
												<input class="btn btn-primary" onclick="btnClick(this);" type="button" value="文件上传"/>
											</div>
											<div class="hidden-value" style="display:none">
												<input type="hidden" class="maxFileSize" value="20"/>
												<input type="hidden" class="maxFileCount" value="10"/>
												<input type="hidden" class="fileFormat" value="jpg,png,xlsx,xls,exe"/>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
						<!-- 文本组件 -->
						<ul class="nav nav-list accordion-group">
							<li class="nav-header"><i class="icon-plus icon-white"></i>
								文本组件
								<div class="pull-right popover-info">
									<i class="icon-question-sign "></i>
									<div class="popover fade right">
										<div class="arrow"></div>
										<h3 class="popover-title">帮助</h3>
										<div class="popover-content">
											这里提供了一系列文本组件，你可以通过区块右上角的编辑按钮修改组件属性。</div>
									</div>
								</div>
							</li>
							<li style="display: none;" class="boxes" id="elmBase">
								<div class="box box-element ui-draggable">
									<a href="#close" class="remove label label-important">
										<i class="icon-remove icon-white"></i>删除
									</a> 
									<span class="drag label">
										<i class="icon-move"></i>拖动
									</span> 
									<span class="configuration">
										<button type="button" class="btn btn-mini edit-attr" title="edit-date" data-target="#editorModal"
												role="button" data-toggle="modal">编辑
										</button>  
									</span>
									<div class="preview">文本块</div>
									<div class="view">
										<h5 contenteditable="true">标题</h5>
										<p contenteditable="true">这里是一个段落，可以直接编辑也可以通过点击编辑按钮去富文本编辑器编辑文本</p>
									</div>
								</div>

								<div class="box box-element ui-draggable">
									<a href="#close" class="remove label label-important">
										<i class="icon-remove icon-white"></i>删除
									</a> 
									<span class="drag label">
										<i class="icon-move"></i>拖动
									</span> 
									<span class="configuration">
										<button type="button" class="btn btn-mini edit-attr" title="edit-date" onclick="showEditorModal(this);"
												role="button" data-toggle="modal">编辑
										</button>  
									</span>
									<div class="preview">富文本编辑框</div>
									<div class="view">
										<div class="form-group">
											<div class="labelDiv" col="1">
												<label>editor</label>
											</div>
											<div class="subDiv">
												<textarea class="editor_textarea">  
												  把编辑器的初始内容放在这textarea即可
												</textarea>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="demo ui-sortable" style="min-height: 600px;">
				
				</div>
				<div id="download-layout">
					<div class="container-fluid"></div>
				</div>
			</div>
		</div>

		<div class="modal hide fade" role="dialog" id="editorModal">
			<div class="modal-body">
				<p>
					<textarea id="contenteditor"></textarea>
				</p>
			</div>
			<div class="modal-footer">
				<a id="savecontent" class="btn btn-primary" data-dismiss="modal">保存</a>
				<a class="btn btn-primary" data-dismiss="modal">取消</a>
			</div>
		</div>

		<!-- 设置单行文本框的属性 -->
		<div class="modal hide fade" role="dialog" id="textModal">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>单行文本框属性</h3>
			</div>
			<div class="modal-body">
				<div id="text-warn" class="hide alert alert-warning">
    				<strong>警告！</strong>必须填写组件ID。
				</div>

				<form>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">标签</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="text-name"
								value="text" placeholder="请输入组件标签">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							ID<span style="color:red;float:left;">*</span>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="text-id"
								placeholder="请输入组件ID">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-xs-7">
							<div class="checkbox">
								<label> <input type="checkbox" id="text-must">必须
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							标签占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写标签占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="text-label-width"
								placeholder="请输入标签占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							组件占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写组件占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="text-width"
								placeholder="请输入组件占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">默认值</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="text-default-value"
								placeholder="请输入组件默认值">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">占位符</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="text-place"
								placeholder="请输入组件占位符">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a id="save-text-content" class="btn btn-primary">保存</a>
				<a class="btn btn-primary" data-dismiss="modal">取消</a>
			</div>
		</div>
		
		<!-- 设置数字文本框的属性 -->
		<div class="modal hide fade" role="dialog" id="numberModal">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>数字文本框属性</h3>
			</div>
			<div class="modal-body">
				<div id="number-warn" class="hide alert alert-warning">
    				<strong>警告！</strong>必须填写标<span style="color:red;">*</span>的属性。
				</div>

				<form>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">标签</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="number-name"
								value="text" placeholder="请输入组件标签">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							ID<span style="color:red;float:left;">*</span>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="number-id"
								placeholder="请输入组件ID">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-xs-7">
							<div class="checkbox">
								<label> <input type="checkbox" id="number-must">必须
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							标签占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写标签占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="number-label-width"
								placeholder="请输入标签占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							组件占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写组件占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="number-width"
								placeholder="请输入组件占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">默认值</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="number-default-value"
								placeholder="请输入组件默认值">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">占位符</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="number-place"
								placeholder="请输入组件占位符">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a id="save-number-content" class="btn btn-primary">保存</a>
				<a class="btn btn-primary" data-dismiss="modal">取消</a>
			</div>
		</div>
		
		<!-- 设置日期文本框的属性 -->
		<div class="modal hide fade" role="dialog" id="dateModal">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>日期文本框属性</h3>
			</div>
			<div class="modal-body">
				<div id="date-warn" class="hide alert alert-warning">
    				<strong>警告！</strong>必须填写标<span style="color:red;">*</span>的属性。
				</div>

				<form>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">标签</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="date-name"
								value="text" placeholder="请输入组件标签">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							ID<span style="color:red;float:left;">*</span>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="date-id"
								placeholder="请输入组件ID">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-xs-7">
							<div class="checkbox">
								<label> <input type="checkbox" id="date-must">必须
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							标签占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写标签占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="date-label-width"
								placeholder="请输入标签占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							组件占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写组件占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="date-width"
								placeholder="请输入组件占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">默认值</label>
						<div class="col-xs-7 input-append date form-control">
							<input type="text" id="date-default-value"
								placeholder="请输入组件默认值" readonly>
							<span class="add-on"><i class="icon-calendar"></i></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">占位符</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="date-place"
								placeholder="请输入组件占位符">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a id="save-date-content" class="btn btn-primary">保存</a>
				<a class="btn btn-primary" data-dismiss="modal">取消</a>
			</div>
		</div>
		
		<!-- 设置多行文本框的属性 -->
		<div class="modal hide fade" role="dialog" id="textareaModal">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>多行文本框属性</h3>
			</div>
			<div class="modal-body">
				<div id="textarea-warn" class="hide alert alert-warning">
    				<strong>警告！</strong>必须填写标<span style="color:red;">*</span>的属性。
				</div>

				<form>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">标签</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="textarea-name"
								value="text" placeholder="请输入组件标签">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							ID<span style="color:red;float:left;">*</span>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="textarea-id"
								placeholder="请输入组件ID">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-xs-7">
							<div class="checkbox">
								<label> <input type="checkbox" id="textarea-must">必须
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							标签占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写标签占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="textarea-label-width"
								placeholder="请输入标签占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							组件占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写组件占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="textarea-width"
								placeholder="请输入组件占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">组件行高</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="textarea-row"
								placeholder="请输入组件行高数">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">默认值</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="textarea-default-value"
								placeholder="请输入组件默认值">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a id="save-textarea-content" class="btn btn-primary">保存</a>
				<a class="btn btn-primary" data-dismiss="modal">取消</a>
			</div>
		</div>
		<!-- 设置下拉选择框的属性 -->
		<div class="modal hide fade" role="dialog" id="selectModal">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>下拉选择框属性</h3>
			</div>
			<div class="modal-body">
				<div id="select-warn" class="hide alert alert-warning">
    				<strong>警告！</strong>必须填写标<span style="color:red;">*</span>的属性。
				</div>

				<form>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">标签</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="select-name"
								value="text" placeholder="请输入组件标签">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							ID<span style="color:red;float:left;">*</span>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="select-id"
								placeholder="请输入组件ID">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-xs-7">
							<div class="checkbox">
								<label> <input type="checkbox" id="select-must">必须
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							标签占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写标签占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="select-label-width"
								placeholder="请输入标签占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							组件占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写组件占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="select-width"
								placeholder="请输入组件占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							添加选项值
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										第一个输入框为默认值</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control option-value"
								placeholder="请输入列表选项值"/>
							<span class="glyphicon glyphicon-minus" onclick="removeOptionInput(this)" 
								style="font-size:20px;color:#888;cursor:pointer;"></span>
							<span class="glyphicon glyphicon-plus" onclick="addOptionInput(this)" 
								style="font-size:20px;color:#888;cursor:pointer;"></span>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a id="save-select-content" class="btn btn-primary">保存</a>
				<a class="btn btn-primary" data-dismiss="modal">取消</a>
			</div>
		</div>
		<!-- 设置单选框的属性 -->
		<div class="modal hide fade" role="dialog" id="radioModal">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>单选框属性</h3>
			</div>
			<div class="modal-body">
				<div id="radio-warn" class="hide alert alert-warning">
    				<strong>警告！</strong>必须填写标<span style="color:red;">*</span>的属性。
				</div>

				<form>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">标签</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="radio-name"
								value="text" placeholder="请输入组件标签">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							ID<span style="color:red;float:left;">*</span>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="radio-id"
								placeholder="请输入组件ID">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-xs-7">
							<div class="checkbox">
								<label> <input type="checkbox" id="radio-must">必须
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							标签占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写标签占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="radio-label-width"
								placeholder="请输入标签占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							组件占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写组件占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="radio-width"
								placeholder="请输入组件占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							添加选项值
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										第一个输入框为默认选中框值</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control radio-value"
								placeholder="请输入单选框选项值"/>
							<span class="glyphicon glyphicon-minus" onclick="removeRadioInput(this)" 
								style="font-size:20px;color:#888;cursor:pointer;"></span>
							<span class="glyphicon glyphicon-plus" onclick="addRadioInput(this)" 
								style="font-size:20px;color:#888;cursor:pointer;"></span>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a id="save-radio-content" class="btn btn-primary">保存</a>
				<a class="btn btn-primary" data-dismiss="modal">取消</a>
			</div>
		</div>
		<!-- 设置复选框的属性 -->
		<div class="modal hide fade" role="dialog" id="checkboxModal">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>复选框属性</h3>
			</div>
			<div class="modal-body">
				<div id="checkbox-warn" class="hide alert alert-warning">
    				<strong>警告！</strong>必须填写标<span style="color:red;">*</span>的属性。
				</div>

				<form>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">标签</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="checkbox-name"
								value="text" placeholder="请输入组件标签">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							ID<span style="color:red;float:left;">*</span>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="checkbox-id"
								placeholder="请输入组件ID">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-xs-7">
							<div class="checkbox">
								<label> <input type="checkbox" id="checkbox-must">必须
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							标签占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写标签占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="checkbox-label-width"
								placeholder="请输入标签占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							组件占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写组件占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="checkbox-width"
								placeholder="请输入组件占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							添加选项值
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										勾中输入框后面的复选框，则该复选框的值被默认勾中</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="col-xs-4 checkbox-value"
								placeholder="请输入复选框选项值"/>
							<div class="col-sm-offset-1 col-xs-1" style="margin-top:4px;">
								<input type="checkbox" title="勾选让该选项选中"/>
							</div>
							<span class="glyphicon glyphicon-minus" onclick="removeCheckboxInput(this)" 
								style="font-size:20px;color:#888;margin:4px 0 0 7px;cursor:pointer;"></span>
							<span class="glyphicon glyphicon-plus" onclick="addCheckboxInput(this)" 
								style="font-size:20px;color:#888;margin:4px 0 0 5px;cursor:pointer;"></span>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a id="save-checkbox-content" class="btn btn-primary">保存</a>
				<a class="btn btn-primary" data-dismiss="modal">取消</a>
			</div>
		</div>
		<!-- 设置文件上传按钮的属性 -->
		<div class="modal hide fade" role="dialog" id="loadFileModal">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>文件上传按钮属性</h3>
			</div>
			<div class="modal-body">
				<div id="loadFile-warn" class="hide alert alert-warning">
    				<strong>警告！</strong>必须填写标<span style="color:red;">*</span>的属性。
				</div>

				<form>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">标签</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="loadFile-name"
								value="text" placeholder="请输入组件标签">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							ID<span style="color:red;float:left;">*</span>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="loadFile-id"
								placeholder="请输入组件ID">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-xs-7">
							<div class="checkbox">
								<label> <input type="checkbox" id="loadFile-must">必须
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							标签占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写标签占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="loadFile-label-width"
								placeholder="请输入标签占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							组件占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写组件占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="loadFile-width"
								placeholder="请输入组件占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							按钮默认值
						</label>
						<div class="col-xs-7">
							<input type="text" id="loadFile-defaultVal"
								placeholder="请输入组件默认值"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							上传文件格式
						</label>
						<div class="col-xs-7">
							<label class="col-xs-3">
								<input type="checkbox" class="format-check" id="format-jpg"/>jpg
							</label>
							<label class="col-xs-3">
								<input type="checkbox" class="format-check" id="format-png"/>png
							</label>
							<label class="col-xs-3">
								<input type="checkbox" class="format-check" id="format-pdf"/>pdf
							</label>
							<label class="col-xs-3">
								<input type="checkbox" class="format-check" id="format-xls"/>xls
							</label>
							<label class="col-xs-3">
								<input type="checkbox" class="format-check" id="format-xlsx"/>xlsx
							</label>
							<label class="col-xs-3">
								<input type="checkbox" class="format-check" id="format-doc"/>doc
							</label>
							<label class="col-xs-3">
								<input type="checkbox" class="format-check" id="format-docx"/>docx
							</label>
							<label class="col-xs-3">
								<input type="checkbox" class="format-check" id="format-txt"/>txt
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							附加文件格式
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										可附加文件格式，填写格式为后缀名之间用逗号分隔，如:txt,jpg,gif,...</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" id="loadFile-format"
								placeholder="如:txt,jpg,gif,..."/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							文件最大大小
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										填0默认为无限制，单位MB</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" id="loadFile-maxSize"
								placeholder="请输入文件最大大小，单位MB"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							文件最高数量
						</label>
						<div class="col-xs-7">
							<input type="text" id="loadFile-maxCount"
								placeholder="请输入文件最高数量"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a id="save-loadFile-content" class="btn btn-primary">保存</a>
				<a class="btn btn-primary" data-dismiss="modal">取消</a>
			</div>
		</div>
		<!-- 设置富文本框的属性 -->
		<div class="modal hide fade" role="dialog" id="editorAreaModal">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>富文本框属性</h3>
			</div>
			<div class="modal-body">
				<div id="textarea-warn" class="hide alert alert-warning">
    				<strong>警告！</strong>必须填写标<span style="color:red;">*</span>的属性。
				</div>

				<form>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							ID<span style="color:red;float:left;">*</span>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control" id="editor-id"
								placeholder="请输入组件ID">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							标签占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写标签占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="editor-label-width"
								placeholder="请输入标签占列宽">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-offset-2 control-label">
							组件占列宽
							<div class="pull-right popover-info">
								<i class="icon-question-sign "></i>
								<div class="popover fade right">
									<div class="arrow"></div>
									<h3 class="popover-title">帮助</h3>
									<div class="popover-content">
										请填写组件占列宽(1~12的整数)</div>
								</div>
							</div>
						</label>
						<div class="col-xs-7">
							<input type="text" class="form-control col" id="editor-width"
								placeholder="请输入组件占列宽">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a id="save-editor-content" class="btn btn-primary">保存</a>
				<a class="btn btn-primary" data-dismiss="modal">取消</a>
			</div>
		</div>
		
		<!-- 文件上传模态框 -->
		<div class="modal fade" id="myModal" style="display:none;" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">请选择或者拖拽要上传的文件</h4>
					</div>
					<div class="modal-body">
						<input type="file" name="file" id="txt_file" multiple />
					</div>
				</div>
			</div>
		</div>

		<div class="modal hide fade" role="dialog" id="downloadModal">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>下载</h3>
			</div>
			<div class="modal-body">
				<p>
					<textarea></textarea>
				</p>
			</div>
			<div class="modal-footer">
				<input type="hidden" id="formUid" value="${formUid}"/>
				<input type="hidden" id="proUid" value="${proUid}"/>
				<input type="hidden" id="proVersion" value="${proVersion}"/>
				<input type="hidden" id="formName" value="${formName}"/>
				<input type="hidden" id="formDescription" value="${formDescription}"/>
				<a class="btn btn-primary" data-dismiss="modal" onclick="javascript:saveHtml();">保存</a>
			</div>
		</div>
	</div>
	<script>
		function resizeCanvas(size) {

			var containerID = document
					.getElementsByClassName("changeDimension");
			var containerDownload = document.getElementById("download-layout")
					.getElementsByClassName("container-fluid")[0];
			var row = document.getElementsByClassName("demo ui-sortable");
			var container1 = document.getElementsByClassName("container1");
			if (size == "md") {
				$(containerID).width('id', "MD");
				$(row).attr('id', "MD");
				$(container1).attr('id', "MD");
				$(containerDownload).attr('id', "MD");
			}
			if (size == "lg") {
				$(containerID).attr('id', "LG");
				$(row).attr('id', "LG");
				$(container1).attr('id', "LG");
				$(containerDownload).attr('id', "LG");
			}
			if (size == "sm") {
				$(containerID).attr('id', "SM");
				$(row).attr('id', "SM");
				$(container1).attr('id', "SM");
				$(containerDownload).attr('id', "SM");
			}
			if (size == "xs") {
				$(containerID).attr('id', "XS");
				$(row).attr('id', "XS");
				$(container1).attr('id', "XS");
				$(containerDownload).attr('id', "XS");
			}
		}
	</script>
</body>
</html>