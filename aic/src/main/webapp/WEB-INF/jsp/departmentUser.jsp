<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>部门/用户管理</title>
	<link rel="stylesheet" type="text/css" href="../../themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../../themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../demo.css">
	<script type="text/javascript" src="../../jquery.min.js"></script>
	<script type="text/javascript" src="../../jquery.easyui.min.js"></script>
</head>
<body oncontextmenu="return false">
	<h2>部门/用户管理</h2>
	
	
	<div class="easyui-panel" style="padding:5px">
		<ul id="tt" class="easyui-tree" data-options="
				url: 'tree_data1.json',
				method: 'get',
				animate: true,
				onContextMenu: function(e,node){
					e.preventDefault();
					$(this).tree('select',node.target);
					$('#mm').menu('show',{
						left: e.pageX,
						top: e.pageY
					});
				}
			"></ul>
	</div>
	<div id="mm" class="easyui-menu" style="width:120px;">
		<div onclick="showDialog('部门编辑','department_edit.html',415,230)" data-options="iconCls:'icon-add'">增加</div>
		<div class="menu-sep"></div>
		<div onclick="removeit()" data-options="iconCls:'icon-remove'">删除</div>
		<div onclick="showDialog('用户编辑','user_edit.html',615,230)" data-options="iconCls:'icon-edit'">修改</div>
		<!--<div onclick="collapse()">Collapse</div>-->
	</div>
	<div id="dd"></div>
	<script type="text/javascript">
		
		function showDialog(subtitle,url,width,height) {
		$('#dd').dialog({
						title: subtitle,
						width: width,
						height: height,
						closed: false,
						cache: false,
						href: url,
						modal: true/*,
						toolbar:[{
							text:'save',
							iconCls:'icon-edit',
							handler:function(){alert('edit')}
						}]*/
					});
	}
		
		function append(){
			var t = $('#tt');
			var node = t.tree('getSelected');
			t.tree('append', {
				parent: (node?node.target:null),
				data: [{
					text: 'new item1'
				},{
					text: 'new item2'
				}]
			});
		}
		function removeit(){
			var node = $('#tt').tree('getSelected');
			$('#tt').tree('remove', node.target);
		}
		function collapse(){
			var node = $('#tt').tree('getSelected');
			$('#tt').tree('collapse',node.target);
		}
		function expand(){
			var node = $('#tt').tree('getSelected');
			$('#tt').tree('expand',node.target);
		}
	</script>
</body>
</html>