<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.hellozhu.model.Mood"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>李铸的解忧空间</title>
<meta name="keywords" content="个人博客,李铸个人博客,李铸" />
<meta name="description" content="李铸个人博客，是一个走在后端之路的男技术员个人博客网站，分享记录个人学习记录的个人原创网站。" />
<link href="css/base.css" rel="stylesheet">
<link href="css/mood.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="\images\icon.ico" media="screen" />

</head>
<body>

<%
 List<Mood> all =(List<Mood>)request.getAttribute("list");
%> 
<%

ValueStack vs = (ValueStack)request.getAttribute("struts.valueStack");   
int curPage= (Integer)vs.findValue("curPage");
Long pagelong=(Long)vs.findValue("pageCount");
int pageCount=pagelong.intValue();

if(curPage>=pageCount) curPage = pageCount;
if(curPage<=0) curPage=1;


Iterator<Mood> iter=all.iterator();
%>
<header>
  <div id="logo"><a href="/"></a></div>
  <nav class="topnav" id="topnav">
  <a href="index.jsp"><span>首页</span><span class="en">Protal</span></a>
  <a href="about.html"><span>关于我</span><span class="en">About</span></a>
  <a href="moodlist"><span>碎言碎语</span><span class="en">Doing</span></a>
 <%--  <a href="share.html"><span>模板分享</span><span class="en">Share</span></a> --%>
  <a href="knowledge"><span>学无止境</span><span class="en">Learn</span></a>
  <a href="gustbook"><span>留言版</span><span class="en">Gustbook</span></a></nav>
  </nav>
</header>
<div class="moodlist">
  <h1 class="t_nav"><span>删删写写，回回忆忆，虽无法行云流水，却也可碎言碎语。</span><a href="/" class="n1">网站首页</a><a href="/" class="n2">碎言碎语</a></h1>
  <div class="bloglist">
  <%while(iter.hasNext()){
	    Mood mood=iter.next();
	    String content=mood.getContent();
		String posttime=mood.getPosttime();
  %>
	  <ul class="arrow_box">
      <div class="sy">
   <p> <%=content %></p>
     </div>
   <span class="dateview"> <%=posttime %></span>  
 </ul>  
 <%}%>  
  
  </div>
  <div class="page"><a title="Total record">
  <b><%=pageCount%></b></a> 
  <a href="moodlist?curPage=1">&lt;&lt;</a><a href="moodlist?curPage=<%=curPage-1%>">&lt;</a>
  <b><%=curPage%></b><a href="moodlist?curPage=<%=curPage+1%>">&gt;</a><a href="moodlist?curPage=<%=pageCount%>">&gt;&gt;</a></div>
</div>
<footer>

<s:debug></s:debug>
  <p>Design by LiZhu <a href="http://www.miitbeian.gov.cn/" target="_blank">粤ICP备16120136号-1</a> <a href="/hellozhu/admin/checkUser">网站后台</a></p>
</footer>
<script src="js/silder.js"></script>
</body>
</html>