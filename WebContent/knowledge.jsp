<%@page import="com.opensymphony.xwork2.util.ValueStack"%>
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
<link href="css/learn.css" rel="stylesheet">
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
 <%--  <a href="share.html"><span>模板分享</span><span class="en">Share</span></a> --%>
  <a href="knowledge"><span>学无止境</span><span class="en">Learn</span></a>
  <a href="gustbook"><span>留言版</span><span class="en">Gustbook</span></a></nav>
  </nav>
</header>
<article class="blogs">
<h1 class="t_nav"><span>我们长路漫漫，只因学无止境。 </span><a href="/" class="n1">网站首页</a><a href="/" class="n2">学无止境</a></h1>
<div class="newblog left">
   <s:iterator value="list" var="c">
    <h2><s:property value="#c.title"/></h2>
   <p class="dateview"><span>发布时间：<s:date name="newDate" format="yyyy-MM-dd" /> </span><span>作者：<a href="/hellozhu/about.html">李铸</a></span><span>分类：[<s:property value="#c.type"/>]</span></p>
    <figure><img src="/hellozhu/<s:property value="#c.path.substring(1, 11)"/>/*"></figure>
    <ul class="nlist">
      <p><s:property value="#c.summary"/>...</p>
      <a  href="/hellozhu/new.jsp?id=<s:property value="#c.id"/>&path=<s:property value="#c.path"/>&title=<s:property value="#c.title"/>&keyword=<s:property value="#c.keyword"/>&newDate=<s:date name="newDate" format="yyyy-MM-dd" />" target="_blank" class="readmore">详细信息>></a>
    </ul>
    <div class="line"></div>
    </s:iterator>
    <div class="blank"></div>
  <!--   <div class="ad">  
    <img src="images/ad.png">
    </div> -->
   
<div class="page"><a title="Total record">
  <b><%=pageCount%></b></a> 
  <a href="knowledge?curPage=1">&lt;&lt;</a><a href="knowledge?curPage=<%=curPage-1%>">&lt;</a>
  <b><%=curPage%></b><a href="knowledge?curPage=<%=curPage+1%>">&gt;</a><a href="knowledge?curPage=<%=pageCount%>">&gt;&gt;</a></div>
</div>
<aside class="right">
   <div class="rnav">
      <h2>站外强力推荐</h2>
      <ul>
       <li><a href="http://cn.linux.vbird.org/" target="_blank">鸟哥的Linux私房菜</a></li>
       <li><a href="http://www.liaoxuefeng.com/" target="_blank">廖雪峰的官方网站</a></li>
       <li><a href="https://www.nowcoder.com/" target="_blank">牛客网</a></li>
       <li><a href="http://tool.oschina.net/" target="_blank">在线工具</a></li>
     </ul>      
    </div>
<div class="news">

    <h3>
      <p>最新<span>文章</span></p>
    </h3>
    <ul class="rank">
      <s:iterator value="newlist" var="l">
      <li><a href="/hellozhu/new.jsp?id=<s:property value="#l.id"/>&path=<s:property value="#l.path"/>&title=<s:property value="#l.title"/>" title="<s:property value="#l.title"/>" target="_blank"><s:property value="#l.title"/></a></li>
     </s:iterator>
    </ul>
    <h3 class="ph">
      <p>点击<span>排行</span></p>
    </h3>
    <ul class="paih">
      <s:iterator value="countlist" var="cl">
      <li><a href="/hellozhu/new.jsp?id=<s:property value="#cl.id"/>&path=<s:property value="#cl.path"/>&title=<s:property value="#cl.title"/>" title="<s:property value="#cl.title"/>" target="_blank"><s:property value="#cl.title"/></a></li>
     </s:iterator>
    </ul>
      <h3 class="links">
      <p>友情<span>链接</span></p>
    </h3>
    <ul class="website">
      期待交换链接的你与我联系
      <li><a href="https://github.com/lz1996">李铸的github</a></li>
      <li><a href="http://weibo.com/2677068081/profile?topnav=1&wvr=6&is_all=1">李铸的新浪微博</a></li>
    </ul> 
    </div>
        <!-- Baidu Button begin -->
     <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
<script>
window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"32"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script> 
        <!-- Baidu Button end -->
        <a href="/" class="weixin"> </a>
</aside>
</article>
<s:debug></s:debug>
<footer>
  <p>Design by LiZhu <a href="http://www.miitbeian.gov.cn/" target="_blank">粤ICP备16120136号-1</a> <a href="/hellozhu/admin/checkUser">网站后台</a></p>
</footer>
<script src="js/silder.js"></script>
</body>
</html>