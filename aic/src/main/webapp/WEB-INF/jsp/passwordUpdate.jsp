<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
<link rel="stylesheet" type="text/css"
	href="../easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../easyui/demo.css">
<script type="text/javascript" src="../easyui/jquery.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
</head>
<body>


	<div class="easyui-panel" title="" style="width: 300px">
		<div style="padding: 10px 30px 20px 30px">
			<form id="ff" method="post">
				<table cellpadding="5">
					<tr>
						<td>原密码:</td>
						<td><input class="easyui-validatebox textbox" type="password"
							name="password" id="password" missingMessage="请输入密码."
							required="true"></input></td>
					</tr>
					<tr>
						<td>新密码:</td>
						<td><input class="easyui-validatebox textbox" type="password"
							name="npassword" id="npassword" missingMessage="请输入新密码."
							required="true"></input></td>
					</tr>
					<tr>
						<td>再输入新密码:</td>
						<td><input class="easyui-validatebox textbox" type="password"
							name="n2password" id="n2password" missingMessage="请再次输入新密码."
							validType="Pwd['#npassword']" required="true"></input></td>
					</tr>
				</table>
			</form>
			<div style="text-align: center; padding: 5px">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="submitForm()">保存</a> <a href="javascript:void(0)"
					class="easyui-linkbutton" onclick="clearForm()">关闭</a>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {

			$.extend($.fn.validatebox.defaults.rules, {
				Pwd : {
					validator : function(value, param) {
						return $(param[0]).val() == value;
					},
					message : '两次输入不匹配。'
				}
			});
		});

		function submitForm() {
			if ($('#ff').form('validate')) {
				var data = $("#ff").serializeArray();   
		        $.ajax({  
		            type:"POST",   //http请求方式  
		            url:"<%=request.getContextPath()%>/account/updatePwd", //发送给服务器的url  
		            data:data, //发送给服务器的参数  
		           // dataType:"json",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)  
		            success:function(data){  
		            	if(data==1) {
		            		alert("修改成功！");
		            		$('#ff').form('clear');
		            	}
		            	else if(data==-1){
		            		alert("原密码不正确！");
		            	}
		            	
		            	return false;	
	                      
	                },  
	                error:function(e) {  
	                    alert("出错：请联系管理员！");  
	                }  
		        }); 
			}
		}
		function clearForm() {
			$('#ff').form('clear');
		}
	</script>
</body>
</html>