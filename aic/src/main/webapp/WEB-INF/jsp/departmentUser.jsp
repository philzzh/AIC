<!DOCTYPE html>
<html>
	<head>
		<%@ page language="Java" contentType="text/html; charset=UTF-8"
		    pageEncoding="UTF-8"%>
		<%
		 request.setCharacterEncoding("UTF-8");
		%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<title>部门/用户管理</title>
		<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="../easyui/demo.css">
		<script type="text/javascript" src="../easyui/jquery.min.js"></script>
		<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
	</head>
	<body oncontextmenu="return false">
	<h2>部门/用户管理</h2>
	<div class="easyui-panel" style="padding:5px">
		<ul id="tt" class="easyui-tree" data-options="
				url:'<%=request.getContextPath()%>/dept/getDeptUserJson',
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
		<div onclick="menuAction(1,415,230)" data-options="iconCls:'icon-add'">增加</div>
		<div class="menu-sep"></div>
		<div onclick="menuAction(3,0,0)" data-options="iconCls:'icon-remove'">删除</div>
		<div onclick="menuAction(2,615,230)" data-options="iconCls:'icon-edit'">修改</div>
		<!--<div onclick="collapse()">Collapse</div>-->
	</div>
	<div id="dd"></div>
	<script type="text/javascript">

		/*$(function(){
			getDeptUserJson();
		})*/
		function treeAction(url,param) {
			
			$.ajax({  
	            type:"POST",   //http请求方式  
	            url:url, //发送给服务器的url  "<%=request.getContextPath()%>/dept/getDeptUserJson"
	            data:param, //发送给服务器的参数  
	            //dataType:"json",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)  
	            success:function(data){  
	            //	alert(data);
		            if(data==-1) {
		            	alert("该部门下有用户，部门不可删除！");
		            }
		            else{
		            	$('#tt').loadData(data);
		            } 
                },  
                error:function(e) {  
                    alert("出错：请联系管理员！");  
                }  
	        }); 
		}
		
		function menuAction(type,width,height) {
			var t = $('#tt');
			var node = t.tree('getSelected');
			var subtitle;
			var url;
			var data;
			if(type==3) {
				//treeAction("<%=request.getContextPath()%>/dept/deleteD");
				if(t.tree('isLeaf',node.target)){
					data = {accountId:node.target.id};
					//treeAction("<%=request.getContextPath()%>/account/deleteAccount");
					return;
				}
				else  {
					/* var obj = {};  
				    obj.name="Pandy";  
				    obj.email="test@163.com";  
				    var param = JSON.stringify(obj); */  
					data = {deptId:node.id};
					treeAction("<%=request.getContextPath()%>/dept/deleteDept",data);
					return;
				}
			}
			if(type==1){
				if(t.tree('isLeaf',node.target)){
					subtitle="新增用户";
					url="<%=request.getContextPath()%>/account/addAccount";
				}
				else  {
					subtitle="新增部门";
					url="<%=request.getContextPath()%>/dept/addDept";
				}
			}
			if(type==2){
				if(!t.tree('isLeaf',node.target)) {
					subtitle="编辑用户";
					url="<%=request.getContextPath()%>/account/updateAccount";
				}
				else{
					subtitle="编辑部门";
					url="<%=request.getContextPath()%>/dept/updateDept";
				}
			}
			showDialog(subtitle,url,width,height);
		}
		
		function showDialog(subtitle,url,width,height) {
			/* var t = $('#tt');
			var node = t.tree('getSelected');
			
			if(t.tree('isLeaf',node.target)){
				url="";
			} */
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