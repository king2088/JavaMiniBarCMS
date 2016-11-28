<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css">
		body{margin:0 auto; font-family:Georgia, "Times New Roman", Times, serif; font-size:12px;}
		.input1{width:200px; height:20px;}
		.input2{ width:80px; height:20px; color:#FFF; background-color:#333; border:1px #CCC dashed;}
		</style>
        <jsp:useBean scope="page" id="Goodinfo" class="com.bar.db.Goodinfo" />
        <script type="text/javascript" charset="gbk" src="../ueditor/ueditor.config.js"></script>
        <script type="text/javascript" charset="gbk" src="../ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
        <script type="text/javascript" charset="gbk" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
	</head>

<%
	//获取商品的索引号
	String sGoodinfoid = request.getParameter("Goodinfoid");
	long lGoodinfoid = Long.parseLong(sGoodinfoid);
	
	
	
	//获取商品信息
	Goodinfo.setGoodinfoid(lGoodinfoid);
	Goodinfo.init();
	ResultSet rs = Goodinfo.show_goodinfo();
%>
	<body bgcolor="#F4FFFE">
	<div align="center">
	  <form name="form1" method="post" action="./goodinfo_updata_save.jsp?Goodinfoid=<%=lGoodinfoid%>" target="_self" enctype="multipart/form-data">
        <input type="hidden" name="Goodinfoid" value="<%=lGoodinfoid%>">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
			<td height="33" colspan="3" align="center"><h1 style="color: #66F; font-size:12px">添加新的酒水套餐<br>请准确填写一下信息，在确认无误后点击提交按钮进行保存</h1></td>
		  </tr>
			<tr>
			<td width="25%" height="33" align="right">套餐名称：</td>
			<td width="41%" height="33" align="left">&nbsp;<input name="Goodinfoname" type="text" class="input1" size="30" value="<%=Goodinfo.getGoodinfoname()%>"></td>
			<td width="34%" rowspan="6" align="left"><img src="../pic/<%=Goodinfo.getPicurl()%>" border="0" width="300px" height="200px"></td>
			</tr>
			<tr>
			<td width="25%" height="32" align="right">啤酒厂家：</td>
			<td width="41%" height="32" align="left">&nbsp;<input name="Company" type="text" class="input1" size="30" value="<%=Goodinfo.getCompany()%>"></td>
			</tr>
			<tr>
			<td width="25%" height="38" align="right">啤酒产地：</td>
			<td width="41%" height="38" align="left">&nbsp;<input name="Addr" type="text" class="input1" size="30" value="<%=Goodinfo.getAddr()%>"></td>
			</tr>
			<tr>
			  <td height="36" align="right">啤酒数量：</td>
			  <td width="41%" height="36" align="left">&nbsp;<input name="Num" type="text" class="input1" size="30" value="<%=Integer.toString(Goodinfo.getNum())%>">
			    /打</td>
		  </tr>
			<tr>
			<td width="25%" height="38" align="right">啤酒价格：</td>
			<td width="41%" height="38" align="left">&nbsp;<input name="Price" type="text" class="input1" size="10" value="<%=String.valueOf(Goodinfo.getPrice())%>">（RMB）</td>
			</tr>
			<tr>
			  <td height="37" align="right">上传图片：</td>
			  <td width="41%" height="37" align="left">&nbsp;<input name="Picurl" type="file" size="50" value=""><input name="Picurl1" type="hidden" size="50" value="<%=Goodinfo.getPicurl()%>"></td>
		  </tr>
			<tr>
			<td width="25%" height="127" align="right">商品简介：</td>
			<td height="127" colspan="2" align="left">&nbsp;
                            <textarea name="Intro" id="editor" style="height:300px;width:800px; float: left;">
                                <%=Goodinfo.getIntro()%>
                            </textarea></td>
			</tr>
		</table>
		<p>
		<input name="sub" type="submit" class="input2" value="提交">&nbsp;&nbsp;
		<input name="res" type="reset" class="input2" value="重填">&nbsp;&nbsp;
		<input type="button" name="btn" value="返回" onClick="javascript:window.history.go(-1)" class="input2"></p>
	  </form>
	</div>
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
	</body>
</html>
