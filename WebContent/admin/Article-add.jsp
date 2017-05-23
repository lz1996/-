<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加成功页面</title>
</head>
<body>
文章增加成功！三秒后跳转到文章撰写页面，没有跳转，请点击<a href="Article-write">这里</a>
<%response.setHeader("refresh", "3;URL=Article-write"); %>
<s:debug></s:debug>
</body>
</html>