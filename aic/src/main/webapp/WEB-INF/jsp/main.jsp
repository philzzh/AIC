<!DOCTYPE html>
<html>
<head>
	<%@ page language="Java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	
	<%
	 request.setCharacterEncoding("UTF-8");
	%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<title>工商执法系统</title>
	<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../easyui/demo.css">
	<script type="text/javascript" src="../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
	<!--<style type="text/css">
        .easyui-accordion ul
        {
            list-style-type: none;
            margin: 0px;
            padding: 10px;
        }
        .easyui-accordion ul li
        {
            padding: 0px;
        }
        .easyui-accordion ul li a
        {
            line-height: 24px;
        }
        .easyui-accordion ul li div
        {
            margin: 2px 0px;
            padding-left: 10px;
            padding-top: 2px;
        }
        .easyui-accordion ul li div.hover
        {
            border: 1px dashed #99BBE8;
            background: #E0ECFF;
            cursor: pointer;
        }
        .easyui-accordion ul li div.hover a
        {
            color: #416AA3;
        }
        .easyui-accordion ul li div.selected
        {
            border: 1px solid #99BBE8;
            background: #E0ECFF;
            cursor: default;
        }
        .easyui-accordion ul li div.selected a
        {
            color: #416AA3;
            font-weight: bold;
        }
    </style>-->
</head>
<body class="easyui-layout">
	
		<div id="north" data-options="region:'north'" style="height:65px;background-color:#3399ff;">
			<img src="../images/title.png" />
			<div style="position:absolute;width:200px;height:55px;right:6px;top:45px;">您好，${account.accountName}&nbsp;&nbsp;<a href="">退出</a>&nbsp;&nbsp;<a href="#" onclick="showDialog('修改密码','password_update.html',314,208);">修改密码</a></div>
		</div>
		<div data-options="region:'south',split:true" style="height:50px;background-color:#3399ff;">版权所有PhilZhang</div>
		<!--<div data-options="region:'east',split:true,collapsed:true" title="East" style="width:180px;">
			<ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,dnd:true"></ul>
		</div>-->
		
		<div data-options="region:'west',split:true" title="菜单" style="width:220px;">
			<div class="easyui-accordion" data-options="fit:false,border:false,height:'content'">
				<div title="案件管理" style="padding:10px;" data-options="iconCls:'icon-tip'">
					<ul class="easyui-tree">
							<li data-options="iconCls:'icon-ok'"><div><span href="#" onclick="addTab1('立案处理','case_init.html');">立案处理</span><div></li>
							<li data-options="iconCls:'icon-search'"><div><span href="#" onclick="addTab1('案件信息查询','case_search.html');">案件信息查询</span><div></li>
					</ul>
					
				</div>
				<div title="综合查询" style="padding:10px;" data-options="iconCls:'icon-search'"> <!--data-options="selected:true"-->
					<ul class="easyui-tree">
							<li data-options="iconCls:'icon-search'"><div><span href="#" onclick="addTab1('自然人信息查询','person_search.html');">自然人信息查询</span><div></li>
							<li data-options="iconCls:'icon-search'"><div><span href="#" onclick="addTab1('市场主体信息查询','business_search.html');">市场主体信息查询</span><div></li>
					</ul>
				</div>
				<div title="系统管理" style="padding:10px" data-options="iconCls:'icon-lock'">
					<ul class="easyui-tree">
							<li data-options="iconCls:'icon-man'"><div><span href="#" onclick="addTab2('部门/用户管理');">部门/用户管理</span><div></li>
							<li data-options="iconCls:'icon-large-smartart'"><div><span href="#" onclick="addTab1('法律法规库管理','law_management.html');">法律法规库管理</span><div></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="mainPanel" data-options="region:'center',title:'',iconCls:'icon-ok'" style="overflow:no;">
			<div id="tabs" class="easyui-tabs" data-options="fit:true,border:false,plain:true" style="overflow:no;">
				<!--<div title="On Working" data-options="href:'_content.html'" style="padding:10px;">
				
				</div>-->
				<div title="待办事宜" style="padding:5px">
					<table id="onworking" class="easyui-datagrid"
							data-options="url:'onworking.json',method:'get',pagination:true,singleSelect:true,fit:true,fitColumns:false">
						<thead>
							<tr>
								<th data-options="field:'caseid',align:'center'" width="130">案件受理号</th>
								<th data-options="field:'casename',align:'center'" width="238">案件名称</th>
								<th data-options="field:'casestatus',align:'center'" width="160">案件状态</th>
								<th data-options="field:'startdate',align:'center'" width="180">受理时间</th>
								<th data-options="field:'senduser',align:'center'" width="120">发送人</th>
								<th data-options="field:'remarks',align:'center'" width="220">备注</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		<div id="dd"></div>
	
	<!--<input type="button" id="one" value="Alert"/>-->
	<script type="text/javascript">
	$(function () {
		InitLeftMenu();
		$('body').layout();
		$('.easyui-tree').tree({
			onClick: function(node){
			alert(node.text);  // alert node text property when clicked
		}
		});
		
		$('#onworking').datagrid({
			toolbar: [{
				text: '处理',
				iconCls: 'icon-edit',
				handler: function(){
					var row = $('#onworking').datagrid("getSelected");
					alert(row.caseid);
					/*$('#dd').dialog({
						title: 'My Dialog',
						width: 900,
						height: 600,
						closed: false,
						cache: false,
						href: 'case_process.html',
						modal: true,
						toolbar:[{
							text:'save',
							iconCls:'icon-edit',
							handler:function(){alert('edit')}
						}]
					});*/
//					showDialog('案件处理','case_process.html',914,576);
//					showDialog('案件处理','case_process2.html',914,576);
//					showDialog('案件处理','case_examine.html',914,598);
					showDialog('案件处理','case_done.html',914,574);
				}
			}]
		});

		var p = $('#onworking').datagrid('getPager');
		(p).pagination({
			pageSize:10,//每页显示的记录条数，默认为10
			pageList:[5,10,15],//设置每页记录条数的列表
			beforePageText:'第',//页数文本框前显示的汉字
			afterPageText:'页    共 {pages} 页',
			showRefresh:false,
			displayMsg:'',
		});

		$('#north').panel({
			tools:[{
			iconCls:'icon-add',
			handler:function(){alert('new')}
			},{
			iconCls:'icon-save',
			handler:function(){alert('save')}
			}]
		}); 
	})
	
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

	//MenuTree initial: <a> onclick event process
	function InitLeftMenu() {
    $('.easyui-accordion li a').click(function () {
        var tabTitle = $(this).text();
        var url = $(this).attr("href");
        addTab1(tabTitle, url);
        $('.easyui-accordion li div').removeClass("selected");
        $(this).parent().addClass("selected");
    }).hover(function () {
        $(this).parent().addClass("hover");
    }, function () {
        $(this).parent().removeClass("hover");
    });
}

function addTab(subtitle, url) {
    if (!$('#tabs').tabs('exists', subtitle)) {
		$('#tabs').tabs('add', {
            title: subtitle,
            content: s,
            closable: true,
            width: $('#mainPanel').width() - 10,
            height: $('#mainPanel').height() - 26
        });
    } else {
        $('#tabs').tabs('select', subtitle);
    }
}

function addTab1(subtitle, url) {
    if (!$('#tabs').tabs('exists', subtitle)) {
		var content = '<iframe scrolling="yes" frameborder="0"  src="' + url + '" style="width:99%;height:99%;"></iframe>';
		$('#tabs').tabs('add', {
            title: subtitle,
            content: content,
            closable: true,
            width: $('#mainPanel').width() - 20,
            height: $('#mainPanel').height() - 40
        });
    } else {
        $('#tabs').tabs('select', subtitle);
    }
}
function addTab2(subtitle) {
    if (!$('#tabs').tabs('exists', subtitle)) {
		var content = '<iframe scrolling="yes" frameborder="0"  src="<%=request.getContextPath()%>/dept/getDeptUser" style="width:99%;height:99%;"></iframe>';
		alert(content);
		$('#tabs').tabs('add', {
            title: subtitle,
            content: content,
            closable: true,
            width: $('#mainPanel').width() - 20,
            height: $('#mainPanel').height() - 40
        });
    } else {
        $('#tabs').tabs('select', subtitle);
    }
}

function addTabAction(subtitle) {
	$.ajax({  
        type:"POST",   //http请求方式  
        url:"<%=request.getContextPath()%>/dept/getDeptUser", //发送给服务器的url  
        //data:data, //发送给服务器的参数  
       // dataType:"json",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)  
        success:function(data){  
        //	alert(data);
        	addTabContent(subtitle,data);
        },  
        error:function(e) {  
            alert("出错：请联系管理员！");  
        }  
    });  
}

function addTabContent(subtitle, data) {
    if (!$('#tabs').tabs('exists', subtitle)) {
		var content = '<iframe scrolling="yes" frameborder="0"  src=style="width:99%;height:99%;">'+ data +  '</iframe>';
		alert(content);
		$('#tabs').tabs('add', {
            title: subtitle,
            content: content,
            closable: true,
            width: $('#mainPanel').width() - 20,
            height: $('#mainPanel').height() - 40
        });
    } else {
        $('#tabs').tabs('select', subtitle);
    }
}

function createFrame(url) {
    var s = '<iframe name="mainFrame" scrolling="no" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
    return s;
}
	</script>
</body>
</html>