<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
		
	    <form id="ff" method="post">
	    	<table cellpadding="5">
						<tr>
							<td>所属部门：</td>
							<td>
								<select class="easyui-combobox" style="width:200px"  name="language">
									<option value="ar">公消股</option>
									<option value="bg">市场股</option>
								</select>
							</td>
						
							<td>用户名：</td>
							<td>
								<input class="easyui-textbox" style="width:200px;" type="text" name="name" data-options="" value=""></input>
							</td>
						</tr>
						<tr>
							<td>密码：</td>
							<td>
								<input class="easyui-textbox" style="width:200px;" type="text" name="name" data-options="" value=""></input>
							</td>
						
							<td>是否领导：</td>
							<td>
								<input class="easyui-checkbox" style="width:200px;" type="text"name="name" data-options="" value=""></input>
							</td>
						</tr>
						<tr>
							<td>姓名：</td>
							<td>
								<input class="easyui-textbox" style="width:200px;" type="text" name="name" data-options="" value=""></input>
							</td>
						
							<td>电话：</td>
							<td>
								<input class="easyui-textbox" style="width:200px;" type="text"name="name" data-options="" value=""></input>
							</td>
						</tr>
						
					</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">关闭</a>
	    </div>

	</div>
	<script>
		function submitForm(){
			$('#ff').form('submit');
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>
</body>
</html>