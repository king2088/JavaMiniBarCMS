<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<style type="text/css">
		.font{font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		.input1{ width:80px; height:20px; border: 1px #999 dashed; background-color:#666; color:#FFF}
		.input2{width:300px; height:20px; border: 1px  #F60 dashed}
		</style>
        <script type="text/javascript" charset="gbk" src="../ueditor/ueditor.config.js"></script>
        <script type="text/javascript" charset="gbk" src="../ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
        <script type="text/javascript" charset="gbk" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
	<jsp:useBean scope="page" id="Type" class="com.bar.db.Type" />
	<jsp:useBean scope="page" id="Article" class="com.bar.db.Article" />
	<jsp:useBean scope="page" id="User" class="com.bar.db.User" />
	<%
		//获取当前访问用户信息，并判断他是否是登录用户
		String sUname = (String)session.getAttribute("uname");
		//获取当前登录用户的索引号
		long lUserid = (Long)session.getAttribute("userid");
		//获取当前讨论区的索引号，并转为长整型
		String sTypeid = request.getParameter("typeid");
		long lTypeid = Long.parseLong(sTypeid);
		Type.setTypeid(lTypeid);
		Type.init();
		//判断是否是回复文章，如果是回复文章，则获取所要回复文章的标题和部分内容 
		String sArticleID = request.getParameter("ArticleID");	
		long lArticleID = Long.parseLong(sArticleID);
		
		String sTitle = "";
		String sContent = "";
		if(lArticleID != 0)
		{		
			Article.setArticleid(lArticleID);
			Article.init();
			sTitle="回复："+Article.getTitle();	
			
			User.setUserid(Article.getUserid());
			User.init();				
			sContent=Article.getContent();
			if(sContent.length()>100)
			{
				sContent = sContent.substring(1,100);
				sContent = sContent + "………………";
			}
			sContent = "【 在 "+User.getUname()+" 的文章中提到: 】\r\n" + sContent;
			sContent = "\r\n\r\n\r\n\r\n----------------------------------------------------------\r\n" + sContent;
	
			
		}	
	%>

	</head>
	<body>
	<div align="center">
	<br>
	<form name="form1" method="post" action="add_article_save.jsp" target="_self" >
	<input type="hidden" name="Typeid" value="<%=lTypeid%>">
	<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#E1E1E1">
	<tr>
		<td width="30%"height="25" align="left"><span class="font">&nbsp;文章标题：<input name="Title" type="text" class="input2" value="<%=sTitle%>" size="40">
		</span></td>
		<td width="20%" align="left"><span class="font">文章作者：<font color="#0000FF"><%=sUname%></font></span></td>
		<td width="20%" align="left"><span class="font">文章类型：<font color="#0000FF"><%=Type.getTypename()%></font></span></td>
	</tr>
	<tr>
		<td width="100%" colspan="3" align="center" valign="top">
		
                <span class="font">
                    <textarea name="content" id="editor" style="height:300px;width:800px; float: left;"></textarea>
        </span></td>
	</tr>
	</table>
	<p>
	<input type="submit" value="发表" name="sub" class="input1">&nbsp;&nbsp;
	<input type="reset" value="清除" name="res" class="input1">
	</p>
	</form>
	</div>
	</body>
    <script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>

</html>
