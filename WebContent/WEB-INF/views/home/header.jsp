<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="shiro" uri="http://www.atguigu.com/tags/shiro" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<link rel="stylesheet" type="text/css" href="styles.css" >
	<script type="text/javascript">
		$(function(){
			$("#logout").click(function(){
				window.parent.parent.location.href = this.href;
			});
		})
	</script>
  </head>
  <body style="border-bottom:solid 1px #666;">
	<TABLE style="width:100%;">
	<TR >
		<td ><img src="${ctx }/static/images/logo.jpg"></td>
		<td style="font-family:����;font-size:33px;font-weight:bold;"> �ͻ���ϵ����ϵͳ</td>	
		<td width="25%" align="right" style="font-size:12px;" valign="bottom">
			<b>��ǰ��¼�û�:</b> <shiro:principal/> [<a href="${ctx }/logout" id="logout">ע��</a>]&nbsp;&nbsp;<br />
		 </td>
	</tr>
	</table>
  </body>
</html>
