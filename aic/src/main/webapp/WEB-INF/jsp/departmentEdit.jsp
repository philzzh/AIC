<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>部门管理</title>
	<link rel="stylesheet" type="text/css" href="../../themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../../themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../demo.css">
	<script type="text/javascript" src="../../jquery.min.js"></script>
	<script type="text/javascript" src="../../jquery.easyui.min.js"></script>
</head>
<body>
	
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="" style="width:400px" >
		<div style="padding:10px 60px 20px 60px" align='center'>
	    <form id="ff" method="post">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>部门名称:</td>
	    			<td><input class="easyui-textbox" type="text" name="name"></input></td>
	    		</tr>
	    		<tr>
	    			<td>上级部门:</td>
	    			<td><select class="easyui-combobox"  style="width:100px"   name="language"><option value="ar">市场股</option></select></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">取消</a>
	    </div>
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