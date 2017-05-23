<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心情列表</title>
<link rel="stylesheet" type="text/css"
			href="ext/resources/css/ext-all.css" />
		<!-- GC -->
		<!-- LIBS -->
		<script type="text/javascript" src="ext/adapter/ext/ext-base.js">
</script>
		<!-- ENDLIBS -->
		<script type="text/javascript" src="ext/ext-all.js">
</script>
		<script type="text/javascript" src="ext/ext-lang-zh_CN.js">
</script>
</head>
<body>
<!--  <div id="grid-example"></div> -->
 <%

ValueStack vs = (ValueStack)request.getAttribute("struts.valueStack");   
int curPage= (Integer)vs.findValue("curPage");
Long pagelong=(Long)vs.findValue("pageCount");
int pageCount=pagelong.intValue();

if(curPage>=pageCount) curPage = pageCount;
if(curPage<=0) curPage=1;


%>
 <center>
 <table border="1" width="100%">
 <tr>
  <td colspan="9" bgcolor="#B2DFEE" align="center">心情列表</td><!-- 跨8列 -->
 </tr>
 <tr bgcolor="#BBFFFF">
  <td colspan="5">内容</td><!-- 跨5列 -->
  <td colspan="1">发表时间</td>
  <td colspan="1">最近更新</td>
  <td colspan="1">更新</td>
  <td colspan="1">删除</td>
 </tr>
 <s:iterator value="list" var="c">
 <tr>
  <td colspan="5"><s:property value="#c.content"/></td><!-- 跨5列 -->
  <td colspan="1"><s:property value="#c.posttime"/></td>
  <td colspan="1"><s:property value="#c.updatetime"/></td>
  <td colspan="1"><a href="admin/Mood-updateInput?moodId=<s:property value="#c.moodId"/>">更新</a></td>
  <td colspan="1"><a href="admin/Mood-delete?moodId=<s:property value="#c.moodId"/>">删除</a></td>
 </tr>
 </s:iterator>
 </table>
 <div class="page"><a title="Total record">
  <b><%=pageCount%></b></a> 
 <a href="Mood-list?curPage=<%=curPage-1%>">&lt;</a>
  <b><%=curPage%></b>
  <a href="Mood-list?curPage=<%=curPage+1%>">&gt;</a>
</div>
 </center>
</body>
</html>