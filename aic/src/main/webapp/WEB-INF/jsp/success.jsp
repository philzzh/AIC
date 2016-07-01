<!DOCTYPE html>
<html>
<head>
	<%@ page language="Java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%
	 request.setCharacterEncoding("UTF-8");
	%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>成功</title>
	<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../easyui/demo.css">
	<script type="text/javascript" src="../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<div class="easyui-panel" title="案件初始化" style="width:1000px">
		<div style="padding:10px 20px 20px 20px">
	    <form id="ff" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>案件名称:</td>
	    			<td><input class="easyui-textbox" style="width:200px" type="text" name="caseName" id="caseName" data-options="required:true"></input></td>
					<td>案件类型:</td>
	    			<td>
	    				<select class="easyui-combobox" style="width:200px"  name="caseType" id="caseType"><option value="1">简易案件</option><option value="2">一般案件</option>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>小组成员：
					</td>
	    			<td colspan="3">
					<div class="easyui-panel" style="padding:5px">
						<ul id="tt" class="easyui-tree" 
							data-options="url:'<%=request.getContextPath()%>/dept/getDeptUserJson',
							method:'get',
							animate:true,
							checkbox:true,
							        onCheck: function(node){
							        	$('#reciver').combobox('clear');
							       		 setComboVaules();
							        	//$.parseJSON($('#tt').tree('getChecked'))
							        	//alert(getChecked());
							        	//var isLeaf = $('#tt').tree('isLeaf', node.target);
							        	//alert(isLeaf);  
							        	//var nodes = $('#tt').tree('getChecked', ['checked','indeterminate']);
							            //$('#reciver').combobox('loadData',nodes);
        }"></ul>
					</div>
					</td>
	    		</tr>
				<tr>
	    			<td>备注:</td>
	    			<td colspan="3"><input class="easyui-textbox" style="width:800px;height:120px;" id="remark" name="remark" data-options="multiline:true"></input></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	选择处理人：<select id="reciver" class="easyui-combobox" 
	    	data-options="valueField:'id',textField:'text'" style="width:80px"  name="language"><option value="0"></option><option value="ar">Admin</option><option value="bg">小李</option><option value="bg">小王</option></select>
	    	&nbsp;&nbsp;
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">发送</a>
	    </div>
	    </div>
	</div>
	<script>

		function getChecked(){
			var nodes = $('#tt').tree('getChecked');
			var s_ = JSON.stringify(nodes);
			
			var s = '';
			for(var i=0; i<nodes.length; i++){
				if (s != '') s += ',';
				
				s += '{accountId:'+nodes[i].id+',accountName:'+nodes[i].text;+'}';
			}
			alert('['+s+']');
		}
		
		function setComboVaules() {
			var nodes = $('#tt').tree('getChecked');
        	for(var i=0; i<nodes.length; i++){
        		var isLeaf = $("#tt").tree('isLeaf', nodes[i].target);
        		alert(nodes[i].id);
	        		if(!isLeaf||nodes[i].id=='') {
	        			nodes.splice(i,1);
	        			i--;
	        		}
        	}
        	//var nodes = $('#tt').tree('getChecked', ['checked','indeterminate']);
            $('#reciver').combobox('loadData',nodes);
		}
		
		function getReciver(){
			var nodes = $('#tt').tree('getChecked');
			var s = '';
			for(var i=0; i<nodes.length; i++){
				if (s != '') s += ',';
				s += nodes[i].id;
			}
			alert(s);
		}

		function submitForm(){
			if ($('#ff').form('validate')) {
				var data = $("#ff").serialize();   
		        $.ajax({  
		            type:"POST",   //http请求方式  
		            url:"<%=request.getContextPath()%>/case/sendCase", //发送给服务器的url  
		            data:data, //发送给服务器的参数  
		           // dataType:"json",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)  
		            success:function(data){  
		            	$.messager.alert("提示", "成功！","info");//alert("修改成功！");
	                },  
	                error:function(e) {  
	                	$.messager.alert("提示", "出错：请联系管理员！","error");  //alert("出错：请联系管理员！");  
	                }  
		        }); 
			}
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>
</body>
</html>