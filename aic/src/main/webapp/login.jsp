<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>工商执法系统</title>
	<link rel="stylesheet" type="text/css" href="./easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="./easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="./easyui/demo.css">
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui/jquery.easyui.min.js"></script>
	<style type="text/css">
	html {
		background-image:url(./images/main.png);
		background-position:center;
		background-repeat:repeat-y;
		min-height: 890px;
		}
	</style>
</head>
<body style="margin:300px 0px 0px 780px;"><!--background-image: url(./images/aic.png);-->
	<!--<div><img src="./images/title.png" /></div>-->
	<div style="margin:20px 0"></div>
	<div class="easyui-panel" title="登录" style="width:400px;" ><div style="margin:10px 0px 0px 40px;"><img src="./images/title.png" /></div>
		<div style="padding:10px 60px 20px 60px">
	    <form id="accountForm" method="post" action="login">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>&nbsp;&nbsp;</td>
	    			<td>&nbsp;&nbsp;&nbsp;<input class="easyui-textbox" type="text" name="account" id="account" prompt="用户名" data-options="required:true,iconCls:'icon-man',iconAlign:'right'" style="width:200px;height:40px"></input></td>
	    		</tr>
	    		<tr>
	    			<td>&nbsp;&nbsp;</td>
	    			<td>&nbsp;&nbsp;&nbsp;<input class="easyui-textbox" type="password" name="password" id="password" prompt="密码"  data-options="required:true,iconCls:'icon-lock',iconAlign:'right'" style="width:200px;height:40px"></input></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:20px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick='checkIsRight()' style="width:80px;height:40px">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px;height:40px">重置</a>
	    </div>
	    </div>
	    
	</div>
	<script>
		$(document).ready(function(){  
	        $("#button_submit").click(function(){  
	              
	            //序列化表单元素，返回json数据  
	            var params = $("#userForm").serializeArray();  
	              
	            //也可以把表单之外的元素按照name value的格式存进来  
	            //params.push({name:"hello",value:"man"});  
	              
	            $.ajax({  
	                type:"POST",  
	                url:"${pageContext.request.contextPath}/user/addUser5",  
	                data:params,  
	                success:function(data){  
	                    alert("成功");  
	                },  
	                error:function(e) {  
	                    alert("出错："+e);  
	                }  
	            });  
	        });  
	    });  
	
		function checkIsRight() {  
			var data = $("#accountForm").serializeArray();   
	        $.ajax({  
	            type:"POST",   //http请求方式  
	            url:"account/check", //发送给服务器的url  
	            data:data, //发送给服务器的参数  
	           // dataType:"json",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)  
	            success:function(data){  
	            	alert(data);
	            	if(data=="0") {
	            		alert("用户不存在！");
	            		return false;	
	            	}
	            	if(data=="1"){
	            		alert("密码错误！");
	            		return false;
	            	}
	            	if(data=="2"){
	            	   //var m = ${account.accountName};
	            	   alert($account.accountName);	
	            	}
                      
                },  
                error:function(e) {  
                    alert("出错：请联系管理员！");  
                }  
	        });  
	    }  
		function submitForm(){
			var name = $("#account").val();  
            var pass = $("#password").val();  
              
            var data = $("#accountForm").serializeArray(); 
            var account = {account:name,password:pass};
           
				$('#accountForm').form('submit',{  
					type:"POST",   //http请求方式  
				    url:"account/check",  
				 	data:data, //发送给服务器的参数
				 	//contentType:'application/json; charset=UTF-8',
		           // dataType:"json",  //告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的controller返回的数据格式一致,不然不会调用回调函数complete)  
				    onSubmit: function(){  
				        //进行表单验证  
				        //如果返回false阻止提交  
				        if(($("#account").val()=='')||($("#password").val()=='')) {
							alert("用户名和密码不能为空！");
							return false;
						}
				        return true;
				    },  
				    success:function(data){  
				    	//var obj = jQuery.parseJSON(data);  
				        alert(data)  
				    }  
				});  
			//alert($("#name").val());*/
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>
</body>
</html>