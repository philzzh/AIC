<!DOCTYPE html>
<html>
<head>
	<%@ page language="Java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	
	<%
	 request.setCharacterEncoding("UTF-8");
	%>
	<title>用户管理</title>
	<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../easyui/demo.css">
	<script type="text/javascript" src="../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
</head>
<body>

	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="" style="width:600px">
		<input type="hidden" name="flag" id="flag"/>
	    <form id="ff" method="post">
	    	<table cellpadding="5">
						<tr>
							<td>所属部门：</td>
							<td>
								<input id="deptId" class="easyui-combobox" name="deptId" value="${account.deptId}"
    									data-options="url:'<%=request.getContextPath()%>/dept/getDeptJson',method: 'get',valueField:'deptId',textField:'deptName'">
							</td>
						
							<td>姓名：</td>
							<td>
								<input class="easyui-validatebox textbox" value="${account.accountName}" style="width:200px;" type="text" id="accountName" name="accountName" missingMessage="请输入姓名." prompt="姓名" required="true"></input>
							</td>
						</tr>
						<tr>
							<td>用户名：</td>
							<td>
								<input class="easyui-validatebox textbox" style="width:200px;" value="${account.accountId}" type="text"  name="accountId" id="accountId" missingMessage="请输入用户名." prompt="用户名" required="true"></input>
							</td>
							<td>密码：</td>
							<td>
								<input class="easyui-validatebox textbox" type="password" value="${account.password}" name="password" id="password" missingMessage="请输入密码." prompt="密码" required="true"></input>
							</td>
						<tr>
							<td>电话：</td>
							<td>
								<input class="easyui-textbox" value="${account.tel}" style="width:200px;" type="text"name="tel" id="tel"></input>
							</td>
							<td>是否领导：</td>
							<td>
								<input style="width:200px;" type="checkbox" id="isLeader" name="isLeader" value="1" checked="${account.isLeader}==1:true:false"></input>
							</td>
						</tr>
						</tr>
						
					</table>
	    </form>
	</div>
	<script>
	$(document).ready(function(){ 
		//alert($('#flag').val());
	});
		function submitForm(){
			var url;
			if($('#flag').val()==null||$('#flag').val()=='') {
				url= "<%=request.getContextPath()%>/account/addAccount";
			}
			else {
				url= "<%=request.getContextPath()%>/account/editAccount"
			}
			if ($('#ff').form('validate')) {
				var data = $("#ff").serializeArray();   
		        $.ajax({  
		            type:"POST",   //http请求方式  
		            url:url,//"<%=request.getContextPath()%>/account/1editAccount", //发送给服务器的url  
		            data:data, //发送给服务器的参数  
		           // dataType:"json",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)  
		            success:function(data){  
		            	if(data==-1) {
		            		$.messager.alert("提示", "用户名已存在！","error");//alert("原密码不正确！");
		            	}
		            	else {
		            		$.messager.alert("提示", "成功！","info");//alert("修改成功！");
		            	}
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