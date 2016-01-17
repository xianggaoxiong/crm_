<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="menu" uri="http://struts-menu.sf.net/tag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>欢迎使用！</title>
<link rel="stylesheet" type="text/css" href="${ctx }/static/css/menu.css">
<style type="text/css">

a:link{      /*超链接正常状态下的样式*/
	color:#005799;        /*文字颜色*/
	text-decoration:none;         /*无下划线*/
}

a:hover{      /*鼠标经过超链接时的样式*/
	color:#FFFF00;        /*文字颜色*/
	text-decoration:underlin;         /*下划线*/
}

a:visited{      /*访问过超链接时的样式*/
	color:#333333;        /*文字颜色*/
	text-decoration:none;         /*无下划线*/
}

</style>
</head>
<BODY LINK="#FFFFFF" marginwidth="1" marginheight="1"
	onResize="frameResized();" topmargin="0" leftmargin="0"
	bgcolor="#C4E1FF">

<DIV ID="menuTop">&nbsp;</DIV>
<DIV ID="menuBottom">

	<menu:useMenuDisplayer name="DropDown" repository="repository2">
	    <menu:displayMenu name="TOP-MENU"/>
	</menu:useMenuDisplayer>

</DIV>
</BODY>
</html>

