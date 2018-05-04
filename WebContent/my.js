/*动态表单渲染js*/
$(function(){
	var tableHead = '<table class="layui-table">'
				+'<colgroup>'
				+'<col width="150">'
				+'<col width="150">'
				+'<col width="150">'
				+'<col width="150">'
				+'<col width="150">'
				+'<col width="150">'
				+'<col width="150">'
				+'<col width="150">'
				+'<col width="150">'
				+'<col width="150">'
				+'<col width="150">'
				+'<col width="150">'
				+'</colgroup>'
				+'<tbody>';
	var formHtml = tableHead;
	var view = $(".container-fluid");
	view.addClass("layui-form");
	var rowObj = view.find(".row-fluid");
	rowObj.each(function(){
		var colObj = $(this).find(".column");
		formHtml += '<tr>';
		for(var i=0;i<colObj.length;i++){
			var column = $(colObj[i]);
			if(column.find(".subDiv").length==0 && column.find(".labelDiv").length==0){
				column.find("p").addClass("title_p");
				pHtml = column.html();
				if(column.find("p").length!=0){
					formHtml = formHtml.substring(0,formHtml.length-4);
					formHtml += "</tbody></table>";
					formHtml += pHtml;
					formHtml += tableHead;
				}else{
					continue;
				}
			}else{
				var labelDivObj = column.find(".labelDiv");
				var labelDivCol = $(labelDivObj).attr("col");
				var subDivObj = column.find(".subDiv");
				var subDivCol = $(subDivObj).attr("col");
				
				labelDivObj.find("span").addClass("tip_span");
				
				var labelHtml = $(labelDivObj).html();
				var subHtml = "";
				if(subDivObj.find("label").length==0){
					if($(subDivObj).next().prop("class")=="hidden-value"){
						subHtml = $(subDivObj).html()+$(subDivObj).next().html();
					}else{
						subHtml = $(subDivObj).html();
					}
				}else if(subDivObj.find("label").length==1){
					subHtml = $(subDivObj).find("label").html();
				}else{
					subDivObj.find("label").each(function(){
						var title = $(this).text();
						$(this).find("input").prop("title",title);
						$(this).html($(this).find("input"));
						subHtml += $(this).html();
					});
				}
				
				if(!isNaN(labelDivCol)){
					formHtml += '<td class="td_title" colspan='+labelDivCol+'>'+labelHtml+'</td>';
				}
				
				if(!isNaN(subDivCol)){
					formHtml += '<td colspan='+subDivCol+'>'+subHtml+'</td>';
				}
			}
		}
		formHtml += "</tr>";
	});
	formHtml += "</tbody></table>";
	view.html(formHtml);
	view.css("display","block");
	
	view.find("input[type='tel']").desNumber();
	layui.use(['form', 'layedit', 'laydate'], function(){
		  var form = layui.form
		  ,layer = layui.layer
		  ,layedit = layui.layedit
		  ,laydate = layui.laydate;
		  
		  form.render();
		  
		  var dateInput = view.find(".date");
		  dateInput.each(function(){
			  dateInput.prop("readonly",true);
			  var dateInputId = $(this).prop("id");
			  // 日期
			  laydate.render({
			    elem: '#'+dateInputId
			  });
		  });
	});
	
	var loadBtn = view.find(".file");
	loadBtn.each(function(){
		var modelHtml = $("#file_load_hide").html();
		view.append(modelHtml);
		view.find(".model").prop("id",$(this).prop("id")+"Model").removeClass("model");
		$("#"+$(this).prop("id")+"Model").find(".layui-upload-drag").prop("id",$(this).prop("id")+"Drag");
		$("#"+$(this).prop("id")+"Model").find(".listAction").prop("id",$(this).prop("id")+"Btn");
		
		$(this).click(function(){
			$("#"+$(this).prop("id")+"Model").css("display","block");
		});
	});
	
	layui.use('upload', function(){
		  var $ = layui.jquery
		  ,upload = layui.upload;
		  
		  var fileCount = 0;
		  var fileModels = view.find(".display_container");
		  fileModels.each(function(){
			  var model = $(this);
			  var btnId = model.prop("id").replace("Model","");
			  var maxFileSize = $("#"+btnId).parent().find(".maxFileSize").val();
			  var maxFileCount = $("#"+btnId).parent().find(".maxFileCount").val();
			  var fileFormat = $("#"+btnId).parent().find(".fileFormat").val();
			  
			  re = new RegExp(",","g");
			  var formatStr = fileFormat.replace(re,"|");
			  var dragId = model.find(".layui-upload-drag").prop("id");
			  // 拖拽上传
			  var demoListView = model.find('.fileList')
			  ,uploadListIns = upload.render({
			    elem: '#'+dragId
			    ,url: 'saveFile.do'
			    ,auto: false// 不自动上传
			    ,exts: formatStr
			    ,multiple: true
			    ,bindAction: '#'+btnId+"Btn"
			    ,choose: function(obj){   
			          var files = this.files = obj.pushFile(); // 将每次选择的文件追加到文件队列
			          layer.load();
			          // 读取本地文件
			          obj.preview(function(index, file, result){
			        	fileCount++;
			        	if(fileCount>maxFileCount){
			        	  fileCount = maxFileCount;
			          	  layer.msg('文件数量不得超过'+maxFileCount+'个',{icon:2});
			          	  layer.closeAll('loading');
			          		return;
			            }
			        	var size = file.size;
			          	if(size > maxFileSize*1024*1024){
			          		layer.msg('文件大小不得超过'+maxFileSize+'M',{icon:2});
			          		layer.closeAll('loading');
			          		return;
			          	}
			          	if(size == 0){
			          		layer.msg('文件大小不能为空',{icon:2});
			          		layer.closeAll('loading');
			          		return;
			          	}
			          	
			            var tr = $(['<tr id="upload-'+ index +'">'
			              ,'<td>'+ file.name +'</td>'
			              ,'<td>'+ (file.size/1024/1024).toFixed(2) +'Mb</td>'
			              ,'<td>等待上传</td>'
			              ,'<td>'
			                ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
			                ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
			              ,'</td>'
			            ,'</tr>'].join(''));
			            
			            // 单个重传
			            tr.find('.demo-reload').on('click', function(){
			              obj.upload(index, file);
			            });
			            
			            // 删除
			            tr.find('.demo-delete').on('click', function(){
			              delete files[index]; // 删除对应的文件
			              tr.remove();
			              fileCount--;
			              uploadListIns.config.elem.next()[0].value = ''; 
			            });
			            
			            demoListView.append(tr);
			            layer.closeAll('loading');
			          });
			        }
			        ,done: function(res, index, upload){
			        	var tr = demoListView.find('tr#upload-'+ index)
			            ,tds = tr.children();
			          if(res.filename == tds.eq(0).text().trim()){ // 上传成功
			            tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
			            tds.eq(3).html(''); // 清空操作
			            return delete this.files[index]; // 删除文件队列已经上传成功的文件
			          }
			          this.error(index, upload);
			          model.css("display","none");
			        }
			        ,error: function(index, upload){
			          var tr = demoListView.find('tr#upload-'+ index)
			          ,tds = tr.children();
			          tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
			          tds.eq(3).find('.demo-reload').removeClass('layui-hide'); // 显示重传
			        }
			  });
			  
			  document.getElementById(dragId).addEventListener("dragenter", function(e){ 
				    e.stopPropagation(); 
				    e.preventDefault(); 
				}, false);  
			  document.getElementById(dragId).addEventListener("dragover", function(e){ 
				    e.stopPropagation(); 
				    e.preventDefault(); 
				}, false); 
			  document.getElementById(dragId).addEventListener("drop", function(e){ 
				    e.stopPropagation(); 
				    e.preventDefault(); 
				}, false);
		  });
	});
});

//隐藏上传文件的模态框
function cancelClick(obj){
	$(obj).parent().parent().parent().css("display","none");
}

// 只能输入数字
jQuery.fn.desNumber = function() {
	this.bind("keypress", function(e) {
		var code = (e.keyCode ? e.keyCode : e.which); // 兼容火狐 IE
		// 火狐下不能使用退格键
		if (e.keyCode == 0x8) {
			return;
		}
		if (this.value.indexOf(".") == -1) {
			return (code >= 48 && code <= 57) || (code == 46);
		} else {
			return code >= 48 && code <= 57
		}
	});
	this.bind("paste", function() {
		return false;
	});
	this.bind("keyup", function() {
		if (this.value.slice(0, 1) == ".") {
			this.value = "";
		}
	});
	this.bind("blur", function() {
		if (this.value.slice(-1) == ".") {
			this.value = this.value.slice(0, this.value.length - 1);
		}
	});
}; 

jQuery.fn.number = function() {
	this.bind("keypress", function(e) {
		var code = (e.keyCode ? e.keyCode : e.which); // 兼容火狐 IE
		// 火狐下不能使用退格键
		if (e.keyCode == 0x8) {
			return;
		}
		return code >= 48 && code <= 57
	});
	this.bind("paste", function() {
		return false;
	});
}; 