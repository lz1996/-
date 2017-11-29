<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>注册/登录 界面</title>
 
  <link rel="stylesheet" href="css/style.css"> 
</head>

<body>
  <div class="form">
      
      <!-- 登录页面 -->
        <div id="login">   
          <h1>欢迎回来！</h1>
          
          <form action="checkUserAndPassword" method="post">
          
            <div class="field-wrap">
            <label>
                          邮箱地址<span class="req">*</span>
            </label>
            <input type="email" name="userid" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
                          密码<span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off"/>
          </div>
          
          
          <button class="button button-block" >登录</button>
          
          </form>
<%
   ActionContext context=ActionContext.getContext();
   Map<String,Object> s1=context.getSession();
   String error=(String)s1.get("error");
   if(error!=null){
   if(error.equals("error")){
	   session.removeAttribute("error");
%>
  <font color="#ffffff" size="50">邮箱地址或密码错误</font>
<% 
   }}
   %>
        </div>
      </div><!-- tab-content -->
      
</div> <!-- /form -->
   <script src="js/ajax.js"></script>
   <script src="js/jquerymin.js"></script>
   <script src="js/index.js" ></script>   
</body>
</html>