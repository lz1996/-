<%@page import="java.util.Iterator"%>
<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="com.hellozhu.model.Gust"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>李铸的解忧空间</title>
<meta name="keywords" content="李铸，个人博客" />
<meta name="description" content="记录李铸个人的学习过程，并作为web开发的练习" />
<script type="text/javascript">
function validata(f) {
	var value=f.name.value;
	if(value==""){
		alert("姓名不能为空！");
		f.name.focus();
		f.name.select();
		return false;
	}
	 value=f.message.value;
	if(value==""){
		alert("内容不能为空！");
		f.message.focus();
		f.message.select();
		return false;
	}
	 value=f.message.value;
		if(value.length>200){
			alert("超过最大限制字数！");
			f.message.focus();
			f.message.select();
			return false;
		}
	alert("提交成功！请等待审核！");
return true;
}
</script>

<meta name="keywords" content="个人博客,李铸个人博客,李铸" />
<meta name="description" content="李铸个人博客，是一个走在后端之路的男技术员个人博客网站，分享记录个人学习记录的个人原创网站。" />
<link href="css/base.css" rel="stylesheet">
<link href="css/mood.css" rel="stylesheet">
<link href="css/book.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="\images\icon.ico" media="screen" />
</head>
<body>
<%
ValueStack vs = (ValueStack)request.getAttribute("struts.valueStack");   
int curPage= (Integer)vs.findValue("curPage");
Long pagelong=(Long)vs.findValue("pageCount");
int pageCount=pagelong.intValue();

if(curPage>=pageCount) curPage = pageCount;
if(curPage<=0) curPage=1;
%>
<header>
  <div id="logo"><a href="/"></a></div>
  <nav class="topnav" id="topnav">
  <a href="index.jsp"><span>首页</span><span class="en">Protal</span></a>
  <a href="about.html"><span>关于我</span><span class="en">About</span></a>
  <a href="moodlist"><span>碎言碎语</span><span class="en">Doing</span></a>
  <%-- <a href="share.html"><span>模板分享</span><span class="en">Share</span></a> --%>
  <a href="knowledge"><span>学无止境</span><span class="en">Learn</span></a>
  <a href="gustbook"><span>留言版</span><span class="en">Gustbook</span></a></nav>
  </nav>
</header>
<div class="moodlist">
  <h1 class="t_nav"><span>燕飞留痕，请留下您来过的痕迹</span><a href="/" class="n1">网站首页</a><a href="/" class="n2">留言板</a></h1>
  <div class="bloglist">
 <s:iterator value="list" var="c">
	  <ul class="arrow_box">
      <div class="sy">
   <p><s:property value="#c.message"/></p>
     </div>
   <span class="dateview"><s:property value="#c.name"/><br><s:property value="#c.email"/></span>  
 </ul>  
 </s:iterator>  
  </div>
  <div class="page"><a title="Total record">
  <b><%=pageCount%></b></a> 
  <a href="gustbook?curPage=1">&lt;&lt;</a><a href="gustbook?curPage=<%=curPage-1%>">&lt;</a>
  <b><%=curPage%></b><a href="gustbook?curPage=<%=curPage+1%>">&gt;</a><a href="gustbook?curPage=<%=pageCount%>">&gt;&gt;</a></div>
</div>
<div class="book">
<form action="gustsubmit" method="post" class="body" onsubmit="return validata(this)">
<h1 class="h1">留言板
<span class="span">请把你要说的话留在这里，经审阅后就能在留言板上看见它了！</span>
</h1>
<label class="label">
<span class="span">您的 姓名 :</span>
<input id="name" type="text" name="gust.name" placeholder="请留下您的大名" class="input"/>
</label>
<label class="label">
<span class="span">您的 邮箱 :</span>
<input id="email" type="email" name="gust.email" placeholder="方便其他人跟你的联系" class="input" />
</label>
<label class="label">
<span class="span">内容 :</span>
<textarea id="message" name="gust.message" placeholder="说出您想说的话（注意字数限制200，可分多条留）" class="textarea"></textarea>
</label>
<label class="label">
<span class="book">类别 :</span><select name="gust.selection" class="select">
<option value="0" >技术问题</option>
<option value="1" >其他问题</option>
</select>
</label>
<label class="label">
<span class="span">&nbsp;</span>
<input type="hidden" name="gust.ischeck" value="false">
<input type="submit" class="button" value="发送" />
</label>
</form>
</div>
<footer>
<s:debug></s:debug>
  <p>Design by LiZhu <a href="http://www.miitbeian.gov.cn/" target="_blank">粤ICP备16120136号-1</a> <a href="/hellozhu/admin/checkUser">网站后台</a></p>
</footer>
<script src="js/silder.js"></script>
</body>
</html>
