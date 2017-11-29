<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>文章编辑页面</title>
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
<form action="Article-add" method="post" enctype="multipart/form-data" onsubmit="return getPlainTxt()">
<div>
    <h1>开始写文章了</h1>
         文章题目：<input name="article.title" type="text">
         类别 :<select name="article.type" class="select">
    <option value="技术问题" >技术问题</option>
    <option value="其他问题" >其他问题</option></select><br>
        关键词：<input name="article.keyword" type="text" placeholder="多个关键词用逗号隔开">
        封面：<input type="file" onchange="previewFile()" name="cover"><br>
    <img src="" height="100px" width="170px" alt="封面预览..."/>    
    <textarea id="editor" name="content" style="width:1024px;height:500px;"></textarea>
</div>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
    function getPlainTxt() {
        var arr = [];
        arr.push(UE.getEditor('editor').getPlainTxt());
        document.getElementById("summary").value=arr;
    }
    function previewFile() {
    	 var preview = document.querySelector('img');
    	 var file  = document.querySelector('input[type=file]').files[0];
    	 var reader = new FileReader();
    	 reader.onloadend = function () {
    	  preview.src = reader.result;
    	 }
    	 if (file) {
    	  reader.readAsDataURL(file);
    	 } else {
    	  preview.src = "";
    	 }
    	}
</script>
<input type="hidden" id="summary" name="article.summary"><br>
<input type="submit" value="提交" >
</form>
</body>
</html>