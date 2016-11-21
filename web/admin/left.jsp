<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>欢迎光临网上商城</title>
<link rel=stylesheet type=text/css href="../lib/ware.css">
<style type="text/css">
@import url(images/left.css);
</style>
<script type=text/javascript><!--
var LastLeftID = "";
function menuFix() {
 var obj = document.getElementById("nav").getElementsByTagName("li");
 
 for (var i=0; i<obj.length; i++) {
  obj[i].onmouseover=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseDown=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseUp=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onmouseout=function() {
   this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
  }
 }
}
function DoMenu(emid)
{
 var obj = document.getElementById(emid); 
 obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
 if((LastLeftID!="")&&(emid!=LastLeftID)) //关闭上一个Menu
 {
  document.getElementById(LastLeftID).className = "collapsed";
 }
 LastLeftID = emid;
}
function GetMenuID()
{
 var MenuID="";
 var _paramStr = new String(window.location.href);
 var _sharpPos = _paramStr.indexOf("#");
 
 if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
 {
  _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
 }
 else
 {
  _paramStr = "";
 }
 
 if (_paramStr.length > 0)
 {
  var _paramArr = _paramStr.split("&");
  if (_paramArr.length>0)
  {
   var _paramKeyVal = _paramArr[0].split("=");
   if (_paramKeyVal.length>0)
   {
    MenuID = _paramKeyVal[1];
   }
  }

 }
 
 if(MenuID!="")
 {
  DoMenu(MenuID)
 }
}
GetMenuID();
menuFix();
--></script>
</head>
<body>
<div id="PARENT">
<ul id="nav">
<li><a href="main.jsp" target="mainFrame">系统首页</a></li>
<li><a href="../index.jsp" target="_blank">网站首页</a></li>
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">文章管理</a>
 <ul id="ChildMenu1" class="collapsed">
 <li><a href="type_list.jsp" target="mainFrame">文章管理</a></li>
 

 </ul>
</li>
<li><a href="#Menu=ChildMenu2" onClick="DoMenu('ChildMenu2')">员工管理</a>
 <ul id="ChildMenu2" class="collapsed">
 <li><a href="show_our_users.jsp" target="mainFrame">员工管理</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu3" onClick="DoMenu('ChildMenu3')">会员管理</a>
 <ul id="ChildMenu3" class="collapsed">
 <li><a href="show_member_users.jsp" target="mainFrame">会员管理</a></li>
 <li><a href="talk_list.jsp" target="mainFrame">留言管理</a></li>
 <li><a href="music.jsp" target="mainFrame">音乐管理</a></li>
</ul>
</li>

<li><a href="#Menu=ChildMenu4" onClick="DoMenu('ChildMenu4')">库存管理</a>
 <ul id="ChildMenu4" class="collapsed">
 <li><a href="ku_list.jsp" target="mainFrame">库存啤酒</a></li>
 <li><a href="myusers_list.jsp" target="mainFrame">供应商管理</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu5" onClick="DoMenu('ChildMenu5')">订单管理</a>
 <ul id="ChildMenu5" class="collapsed">
 <li><a href="goods_list.jsp" target="mainFrame">套餐管理</a></li>
 <li><a href="goods.jsp" target="mainFrame">订单管理</a></li>
 </ul>
</li>

<li><a href="#Menu=ChildMenu6" onClick="DoMenu('ChildMenu6')">网站管理</a>
 <ul id="ChildMenu6" class="collapsed">
 <li><a href="systems.jsp?sid=1" target="mainFrame">网站设置</a></li>
 <li><a href="admin_info.jsp" target="mainFrame">管理员信息</a></li>
 <li><a href="database.jsp" target="mainFrame">数据库备份/还原</a></li>

 </ul>
</li>
</ul>
</div>
</body>
</html>