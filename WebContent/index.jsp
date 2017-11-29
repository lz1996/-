<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="gb2312">
<title>李铸的解忧空间</title>
<meta name="baidu-site-verification" content="gyDnG2BBCS" />
<meta name="keywords" content="李铸，个人博客" />
<meta name="description" content="记录李铸个人的学习过程，并作为web开发的练习" />
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
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
  <!-- <a href="book.html"><span>模板分享</span><span class="en">Share</span></a> -->
  <a href="knowledge"><span>学无止境</span><span class="en">Learn</span></a>
  <a href="gustbook"><span>留言版</span><span class="en">Gustbook</span></a></nav>
  </nav>
</header>
<div class="banner">
  <section class="box">
    <ul class="texts">
	  <p>我不好也不坏不特别出众，我只是敢不同</p>
      <p>我的人生就是一错再错错完了再从头</p>
      <p>也许放弃一些活得更轻松，我却不再是我</p>
	  <p>我不愿一生晒太阳吹风，咸鱼也要有梦――五月天<咸鱼></p>
    </ul>
    <div class="avatar"><a href="#"><span>李铸</span></a> </div>
  </section>
</div>
<div class="template">
  <div class="box">
   <!--  <h3>
      <p><span>后台功能</span></p>
    </h3>
    <ul>
      <li><a href="/studentMessage"  target="_blank"><img src="images/01.jpg"></a><span>学生信息管理系统</span></li>
      <li><a href="/" target="_blank"><img src="images/02.jpg"></a><span>黑色质感时间轴html5个人博客模板</span></li>
      <li><a href="/"  target="_blank"><img src="images/03.jpg"></a><span>Green绿色小清新的夏天-个人博客模板</span></li>
      <li><a href="/" target="_blank"><img src="images/04.jpg"></a><span>女生清新个人博客网站模板</span></li>
      <li><a href="/"  target="_blank"><img src="images/02.jpg"></a><span>黑色质感时间轴html5个人博客模板</span></li>
      <li><a href="/"  target="_blank"><img src="images/03.jpg"></a><span>Green绿色小清新的夏天-个人博客模板</span></li>
    </ul> -->
  </div>
</div>
<article>
  <h2 class="title_tj">
    <p>文章<span>推荐</span></p>
  </h2>
   <div class="bloglist left">
    <!-- <h3>程序员请放下你的技术情节，与你的同伴一起进步</h3>
    <figure><img src="images/001.png"></figure>
    <ul>
      <p>如果说掌握一门赖以生计的技术是技术人员要学会的第一课的话， 那么我觉得技术人员要真正学会的第二课，不是技术，而是业务、交流与协作，学会关心其他工作伙伴的工作情况和进展...</p>
      <a title="/" href="/" target="_blank" class="readmore">阅读全文>></a>
    </ul>
    <p class="dateview"><span>2013-11-04</span><span>作者：李铸</span><span>个人博客：[<a href="/news/life/">程序人生</a>]</span></p> -->
    <h3>读取文章题目</h3>
<!--     <figure><img src="images/001.png"></figure>
 -->  
   <ul>
      <p>如果说掌握一门赖以生计的技术是技术人员要学会的第一课的话， 那么我觉得技术人员要真正学会的第二课，不是技术，而是业务、交流与协作，学会关心其他工作伙伴的工作情况和进展...</p>
      <a title="" href="/hellozhu/new.html" target="_blank" class="readmore">阅读全文>></a>
    </ul>
    <p class="dateview"><span>2013-11-04</span><span>作者：<a href="/hellozhu/about.html">李铸</a></span><span>个人博客：[<a href="/news/life/">程序人生</a>]</span></p>
   
    <h3>程序员请放下你的技术情节，与你的同伴一起进步</h3>
    <figure><img src="images/001.png"></figure>
    <ul>
      <p>如果说掌握一门赖以生计的技术是技术人员要学会的第一课的话， 那么我觉得技术人员要真正学会的第二课，不是技术，而是业务、交流与协作，学会关心其他工作伙伴的工作情况和进展...</p>
      <a title="/" href="/" target="_blank" class="readmore">阅读全文>></a>
    </ul>
    <p class="dateview"><span>2013-11-04</span><span>作者：李铸</span><span>个人博客：[<a href="/news/life/">程序人生</a>]</span></p>
  </div> 
  
  <aside class="right">
    <div class="weather"><iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe></div>
    <div class="news">
    <h3>
      <p>最新<span>文章</span></p>
    </h3>
     <ul class="rank">
      <s:iterator value="newlist" var="l">
      <li><a href="/hellozhu/new.jsp?path=<s:property value="#l.path"/>&title=<s:property value="#l.title"/>" title="<s:property value="#l.title"/>" target="_blank"><s:property value="#l.title"/></a></li>
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
    <!-- Baidu Button END -->
    <a href="/" class="weixin"> </a></aside>
</article>
<s:debug></s:debug>
<footer>
  <p>Design by LiZhu <a href="http://www.miitbeian.gov.cn/" target="_blank">粤ICP备16120136号-1</a> <a href="/hellozhu/admin/checkUser">网站后台</a></p>
</footer>
<script src="js/silder.js"></script>
</body>
</html>
