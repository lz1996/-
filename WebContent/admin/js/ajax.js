var xmlHttp;//Ajax核心对象名称
var flag;//定义标志位

function createXMLHttp(){//创建XMLHttpRequest核心对象
	if(window.XMLHttpRequest){//判断当前使用的浏览器类型
		xmlHttp=new XMLHttpRequest();//表示使用的是FireFox内核的浏览器		
	}else{//表示使用的是IE内核的浏览器		
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
}

function checkUserid(userid){
	createXMLHttp();//创建xmlHttp核心对象
	//设置一个请求，通过地址重写的方式将userid传递到JSP中
	xmlHttp.open("get","Check?userid="+userid);
	//设置请求完成之后处理的回调函数
	xmlHttp.onreadystatechange=checkUseridCallback;
	//发送请求，不传递任何参数
	xmlHttp.send(null);
	//document.getElementById("msg").innerHTML="正在验证...";
}

function checkUseridCallback(){//定义回调函数
	if(xmlHttp.readyState==4){//数据返回完毕
		if(xmlHttp.status==200){//HTTP操作正常
			var text=xmlHttp.responseText;//接收返回的内容
			if(text=="true"){
				flag=false;//无法提交表单
				document.getElementById("msg").innerHTML="此邮箱已被注册，无法使用！";
			}else{
				flag=true;//可以提交表单
				document.getElementById("msg").innerHTML="此邮箱可以注册！";
			}
		}
	}
}

function checkForm() {
	return flag;
}

