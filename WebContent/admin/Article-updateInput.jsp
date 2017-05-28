<%@page import="java.net.URLDecoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>文章修改页面</title>
 <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>
<body>
<%-- <%
String title=request.getParameter("title");
title=URLDecoder.decode(title, "UTF-8");
 %> --%>
<form action="Article-update" method="post">
<div>
    <h1>开始修改文章了</h1>
         文章题目：<input name="article.title" type="text" value="<s:property value="#parameters.title"/>"><br>
         类别 :<select id="slt" name="article.type" class="select" >
    	 <option value="技术问题" >技术问题</option>
   		 <option value="其他问题" >其他问题</option>
    </select>
<script>
   document.getElementById("slt").value = "<s:property value="#parameters.type"/>";//此时会选中第2个
</script>
    <textarea id="editor" name="content"  style="width:1024px;height:500px;">
    <s:property value="#session.content"/>
    </textarea>
</div>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    UE.delEditor('editor');
    var ue = UE.getEditor('editor');
 
</script>
<input type="hidden" name="article.id" value="<s:property value="#parameters.id"/>">
<input type="hidden" name="article.path" value="<s:property value="#parameters.path"/>">
<input type="submit" value="提交">
</form>
<s:debug></s:debug>
</body>
</html>