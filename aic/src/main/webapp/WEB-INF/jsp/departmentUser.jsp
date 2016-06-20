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
	<!-- 
	<div id="mm" class="easyui-menu" style="width:120px;" data-options="onShow:menuShow">
		<div id="menu-add" onclick="menuAction(1)" data-options="iconCls:'icon-add'">增加</div>
		<div class="menu-sep"></div>
		<div id="menu-delete" onclick="menuAction(3)" data-options="iconCls:'icon-remove'">删除</div>
		<div id="menu-update" onclick="menuAction(2)" data-options="iconCls:'icon-edit'">修改</div> 
		
	</div>
	-->
	<div id="mm" class="easyui-menu" style="width:120px;" data-options="onShow:menuShow">
		<div id="menu-addAccount" onclick="menuAction(1)" data-options="iconCls:'icon-add'">增加用户</div>
		<div id="menu-deleteAccount" onclick="menuAction(3)" data-options="iconCls:'icon-remove'">删除用户</div>
		<div id="menu-updateAccount" onclick="menuAction(2)" data-options="iconCls:'icon-edit'">修改用户</div> 
		
		<div id="menu-addDept" onclick="menuAction(1)" data-options="iconCls:'icon-add'">增加部门</div>
		<div id="menu-deleteDept" onclick="menuAction(3)" data-options="iconCls:'icon-remove'">删除部门</div>
		<div id="menu-updateDept" onclick="menuAction(2)" data-options="iconCls:'icon-edit'">修改部门</div> 
		
	</div>
	<div id="dd"></div>
	<script type="text/javascript">
	function menuShow() {  
		var t = $('#tt');
		var m = $('#mm');
		var node = t.tree('getSelected');
		
		if(t.tree('isLeaf',node.target)) {
			m.menu('showItem',$('#menu-addAccount'));
			m.menu('showItem',$('#menu-deleteAccount'));
			m.menu('showItem',$('#menu-updateAccount'));
			
			m.menu('hideItem',$('#menu-addDept'));
			m.menu('hideItem',$('#menu-deleteDept'));
			m.menu('hideItem',$('#menu-updateDept'));
			if(node.id==''){
				m.menu('hideItem',$('#menu-deleteAccount'));
				m.menu('hideItem',$('#menu-updateAccount'));
				return;
			}
			m.menu('enableItem',$('#menu-addAccount'));
			m.menu('enableItem',$('#menu-deleteAccount'));
			m.menu('enableItem',$('#menu-updateAccount'));
			return;
		}
		else {
			m.menu('hideItem',$('#menu-addAccount'));
			m.menu('hideItem',$('#menu-deleteAccount'));
			m.menu('hideItem',$('#menu-updateAccount'));
			
			m.menu('showItem',$('#menu-addDept'));
			m.menu('showItem',$('#menu-deleteDept'));
			m.menu('showItem',$('#menu-updateDept'));
			if(node.id=='0') {
				m.menu('hideItem',$('#menu-deleteDept'));
				m.menu('hideItem',$('#menu-updateDept'));
				return;
			}
			m.menu('enableItem',$('#menu-addDept'));
			m.menu('enableItem',$('#menu-deleteDept'));
			m.menu('enableItem',$('#menu-updateDept'));
			return;
		}
		
		/*
		var t = $('#tt');
		var m = $('#mm');
		var node = t.tree('getSelected');
		if(node.id=='0') {
			m.menu('disableItem',$('#menu-add'));
			m.menu('disableItem',$('#menu-delete'));
			m.menu('disableItem',$('#menu-update'));
			return;
		}
		else if(node.id==''){
			m.menu('enableItem',$('#menu-add'));
			m.menu('disableItem',$('#menu-delete'));
			m.menu('disableItem',$('#menu-update'));
			return;
		}else {
			m.menu('enableItem',$('#menu-add'));
			m.menu('enableItem',$('#menu-delete'));
			m.menu('enableItem',$('#menu-update'));
			return;
		}*/
	}
	function addDept() {
		subtitle="新增部门";
		width=415;
		height=180;
		url="<%=request.getContextPath()%>/dept/toDeptPage";
		showDialog(subtitle,url,width,height,data);
	}
	function deleteDept() {
		/* if ( $('#mm').menu("getItem", $('#menu-deleteDept')).disabled){
			return;
		} */
		$.messager.confirm("操作提示", "您确定要执行操作吗？", function (data) {
            if (data) { 
				data = {deptId:node.id};
				treeAction("<%=request.getContextPath()%>/dept/deleteDept",data);
				return;
            }  
            else {  
                return;  
            }  
       });
		
	}
	function updateDept() {
		
	}
	function addAccount() {
		
	}
	function deleteAccount() {
		if ( $('#mm').menu("getItem", $('#menu-deleteAccount')).disabled){
			return;
		}
		$.messager.confirm("操作提示", "您确定要执行操作吗？", function (data) {
            if (data) { 
				data = {accountId:node.id};
				treeAction("<%=request.getContextPath()%>/account/deleteAccount");
				return;
            }  
            else {  
                return;  
            }  
       });
	}
	function updateAccount() {
		if ( $('#mm').menu("getItem", $('#menu-add')).disabled){
			return;
		}
	}
	function TmenuAction(type) {
		
		var t = $('#tt');
		var node = t.tree('getSelected');
		var subtitle;
		var url;
		var data;
		var width,height;
		if(type==3) {
			if ( $('#mm').menu("getItem", $('#menu-delete')).disabled){
				return;
			}
			$.messager.confirm("操作提示", "您确定要执行操作吗？", function (data) {
	            if (data) { 
	            	//treeAction("<%=request.getContextPath()%>/dept/deleteD");
					if(t.tree('isLeaf',node.target)){
						data = {accountId:node.id};
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
	            else {  
	                return;  
	            }  
	       });
			return;
			
		}
		if(type==1){
			if ( $('#mm').menu("getItem", $('#menu-add')).disabled){
				return;
			}
			if(t.tree('isLeaf',node.target)){
				subtitle="新增用户";
				width=615;
				height=280;
				url="<%=request.getContextPath()%>/account/toAccountPage";
			}
			else  {
				subtitle="新增部门";
				width=415;
				height=180;
				url="<%=request.getContextPath()%>/dept/toDeptPage";
			}
		}
		if(type==2){
			if ( $('#mm').menu("getItem", $('#menu-update')).disabled){
				return;
			}
			if(t.tree('isLeaf',node.target)) {
				subtitle="编辑用户";
				width=615;
				height=280;
				url="<%=request.getContextPath()%>/account/toAccountPage";
			}
			else{
				subtitle="编辑部门";
				width=415;
				height=180;
				data = {deptId:node.id,deptName:node.text};
				url="<%=request.getContextPath()%>/dept/toDeptPage";
			}
		}
		showDialog(subtitle,url,width,height,data);
	}
		/*$(function(){
			getDeptUserJson();
		})*/
	function refreshTree() {
		$('#tt').tree({  
		    url: "<%=request.getContextPath()%>/dept/getDeptUserJson",  
		    loadFilter: function(data){  
		       if (data.d){  
		           return data.d;  
		       } else {  
		           return data;  
		       }  
		    }  
		}); 
	}
		
	function treeAction(url,param) {
		
		$.ajax({  
            type:"POST",   //http请求方式  
            url:url, //发送给服务器的url  "<%=request.getContextPath()%>/dept/getDeptUserJson"
            data:param, //发送给服务器的参数  
            //dataType:"json",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)  
            success:function(data){  
            //	alert(data);
	            if(data==-1) {
	            	$.messager.alert("提示", "该部门下有用户，部门不可删除！","error");  //alert("该部门下有用户，部门不可删除！");
	            }
	            else{
	            	$.messager.alert("提示", "部门已删除！","info"); 
	            	refreshTree();
	            	//$('#tt').loadData(data);
	            } 
             },  
             error:function(e) {  
             	$.messager.alert("提示", "出错：请联系管理员！","error");  // alert("出错：请联系管理员！");  
             }  
        }); 
	}
		
		function menuAction(type) {
			
			var t = $('#tt');
			var node = t.tree('getSelected');
			var subtitle;
			var url;
			var data;
			var width,height;
			if(type==3) {
				if ( $('#mm').menu("getItem", $('#menu-delete')).disabled){
					return;
				}
				$.messager.confirm("操作提示", "您确定要执行操作吗？", function (data) {
		            if (data) { 
		            	//treeAction("<%=request.getContextPath()%>/dept/deleteD");
						if(t.tree('isLeaf',node.target)){
							data = {accountId:node.id};
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
		            else {  
		                return;  
		            }  
		       });
				return;
				
			}
			if(type==1){
				if ( $('#mm').menu("getItem", $('#menu-add')).disabled){
					return;
				}
				if(t.tree('isLeaf',node.target)){
					subtitle="新增用户";
					width=615;
					height=280;
					data = {accountId:''};
					url="<%=request.getContextPath()%>/account/toAccountPage";
				}
				else  {
					subtitle="新增部门";
					width=415;
					height=180;
					url="<%=request.getContextPath()%>/dept/toDeptPage";
				}
			}
			if(type==2){
				if ( $('#mm').menu("getItem", $('#menu-update')).disabled){
					return;
				}
				if(t.tree('isLeaf',node.target)) {
					subtitle="编辑用户";
					width=615;
					height=280;
					data = {accountId:node.id};
					url="<%=request.getContextPath()%>/account/toAccountPage?accountId="+node.id;
				}
				else{
					subtitle="编辑部门";
					width=415;
					height=180;
					data = {deptId:node.id,deptName:node.text};
					url="<%=request.getContextPath()%>/dept/toDeptPage";
				}
			}
			showDialog(subtitle,url,width,height,data);
		}
		
		function showDialog(subtitle,url,width,height,data) {
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
							modal: true,
							onLoad:function(){
								$('#deptId').val(data.deptId); //编辑时用
								$('#deptName').val(data.deptName);
								$('#flag').val(data.accountId);
							},
		                    onClose : function() {
		                    	$('#dd').dialog('close');
		                    },buttons : [ {
		                        text : '保存',
		                        iconCls : 'icon-ok',
		                        handler : function() {
		                            //提交表单
		                            submitForm();
		                            refreshTree();
		                            //$('#dd').dialog('close');
		                        }
		                    }, {
		                        text : '取消',
		                        iconCls : 'icon-cancel',
		                        handler : function() {
		                        	$('#dd').dialog('close');
		                        }
		                    } ]
			/*,
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