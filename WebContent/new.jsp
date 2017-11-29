<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>李铸的解忧空间</title>
<meta name="keywords" content="个个人博客,李铸个人博客,李铸" />
<meta name="description" content="李铸个人博客，是一个走在后端之路的男技术员个人博客网站，分享记录个人学习记录的个人原创网站。" />
<link href="css/base.css" rel="stylesheet">
<link href="css/new.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="\images\icon.ico" media="screen" />

<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<header>
  <div id="logo"><a href="/"></a></div>
  <nav class="topnav" id="topnav">
  <a href="index.jsp"><span>首页</span><span class="en">Protal</span></a>
  <a href="about.html"><span>关于我</span><span class="en">About</span></a>
  <a href="moodlist"><span>碎言碎语</span><span class="en">Doing</span></a>
  <%-- <a href="share.html"><span>模板分享</span><span class="en">Share</span></a> --%>
  <a href="knowledge"><span>学无止境</span><span class="en">Learn</span></a>
  <a href="gustbook"><span>留言版</span><span class="en">Gustbook</span></a></nav>
</header>
<article class="blogs">
  <h1 class="t_nav"><span>您当前的位置：<a href="/hellozhu/index.jsp">首页</a>&nbsp;&gt;&nbsp;<a href="/hellozhu/knowledge/">学无止境</a>&nbsp;&gt;&nbsp;<a href="">具体文章</a></span><a href="/" class="n1">网站首页</a><a href="/" class="n2">具体文章</a></h1>
  <div class="index_about">
    <h2 class="c_titile"><%=request.getParameter("title") %></h2>
    <p class="box_c"><span class="d_time">发布时间：<%=request.getParameter("newDate")%></span><span>编辑：李铸</span><span>QQ交流：<a href="http://wpa.qq.com/msgrd?v=3&uin=1129226860&site=qq&menu=yes" title="点击这里与我交流">1129226860</a></span></p>
   <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
   <script>
   function getQueryString(name) { 
	   var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	   var r = window.location.search.substr(1).match(reg); 
	   if (r != null) return unescape(r[2]); return null; 
	   } 
   var id=getQueryString("id");
   $(function() {
	   $.ajax({
		 url : '/hellozhu/admin/Article-updateCount.action' ,
		 type : 'post' ,
		 dataType : 'json' ,
		 data : {
			id : id,
		 },
		 success:function(data){
		 	console.log("成功更新");
		 }
	 });
   });
   </script>
 
    <ul class="infos">
    <iframe src="new<%=request.getParameter("path") %>" frameBorder="0" width="1024px" scrolling="auto" height="700" ></iframe>
 
    </ul>
    <div class="keybq">
    <p><span>关键字词</span>：<%=request.getParameter("keyword") %></p>
    </div>
    <div class="ad"> </div>
    
    <div class="nextinfo">
      <p>上一篇：<a href="new/2017-05-24/201705241105121.html">程序员应该如何高效的工作学习</a></p>
      <p>下一篇：<a href="new/2017-05-24/201705241105121.html">柴米油盐的生活才是真实</a></p>
    </div>
    <!-- <div class="otherlink">
      <h2>相关文章</h2>
      <ul>
        <li><a href="/news/s/2013-07-25/524.html" title="现在，我相信爱情！">现在，我相信爱情！</a></li>
        <li><a href="/newstalk/mood/2013-07-24/518.html" title="我希望我的爱情是这样的">我希望我的爱情是这样的</a></li>
        <li><a href="/newstalk/mood/2013-07-02/335.html" title="有种情谊，不是爱情，也算不得友情">有种情谊，不是爱情，也算不得友情</a></li>
        <li><a href="/newstalk/mood/2013-07-01/329.html" title="世上最美好的爱情">世上最美好的爱情</a></li>
        <li><a href="/news/read/2013-06-11/213.html" title="爱情没有永远，地老天荒也走不完">爱情没有永远，地老天荒也走不完</a></li>
        <li><a href="/news/s/2013-06-06/24.html" title="爱情的背叛者">爱情的背叛者</a></li>
      </ul>
    </div> -->
  </div>
  <aside class="right">
    
    <div class="blank"></div>
    <div class="news">
     <h3>
      <p>最新<span>文章</span></p>
    </h3>
    <ul class="rank">
      <s:iterator value="#session.newlist" var="l">
      <li><a href="/hellozhu/new.jsp?id=<s:property value="#l.id"/>&path=<s:property value="#l.path"/>&title=<s:property value="#l.title"/>&newDate=<s:date name="newDate" format="yyyy-MM-dd" />" title="<s:property value="#l.title"/>" target="_blank"><s:property value="#l.title"/></a></li>
     </s:iterator>
    </ul>
      <h3 class="ph">
        <p>点击<span>排行</span></p>
      </h3>
      <ul class="paih">
         <s:iterator value="#session.countlist" var="cl">
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
    <!-- Baidu Button END -->
        <a href="/" class="weixin"> </a></aside>
  </aside>
</article>
<footer>
  <p>Design by LiZhu <a href="http://www.miitbeian.gov.cn/" target="_blank">粤ICP备16120136号-1</a> <a href="/hellozhu/admin/checkUser">网站后台</a></p>
</footer>
<script src="js/silder.js"></script>
</body>
</html>