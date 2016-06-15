<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>部门管理</title>
	<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../easyui/demo.css">
	<script type="text/javascript" src="../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="" style="width:400px" >
		<div style="padding:10px 60px 20px 60px" align='center'>
	    <form id="ff" method="post">
	    	<input type="hidden" name="deptId" id="deptId"></input>
	    	<table cellpadding="5">
	    		<tr>
	    			<td>部门名称:</td>
	    			<td><input class="easyui-validatebox textbox" type="text" name="deptName" id="deptName" missingMessage="请输入部门名称."
							required="true"></input></td>
	    		</tr>
	    		<!-- <tr>
	    			<td>上级部门:</td>
	    			<td><select class="easyui-combobox"  style="width:100px"   name="language"><option value="ar">市场股</option></select></td>
	    		</tr> -->
	    	</table>
	    </form>
	    <!-- <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">取消</a>
	    </div> -->
	    </div>
	</div>
	<script>
	function submitForm() {
		if ($('#ff').form('validate')) {
			var data = $("#ff").serializeArray();   
	        $.ajax({  
	            type:"POST",   //http请求方式  
	            url:"<%=request.getContextPath()%>/dept/editDept", //发送给服务器的url  
	            data:data, //发送给服务器的参数  
	           // dataType:"json",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)  
	            success:function(data){  
	            	//if(data==1) {
	            		$.messager.alert("提示", "成功！","info");//alert("修改成功！");
	            	/*}
	            	else if(data==-1){
	            		$.messager.alert("提示", "原密码不正确！","error");//alert("原密码不正确！");
	            	}*/
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