<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
  <head>
    <title>确认流失</title>
  </head>
  <body class="main">

  <span class="page_title">确认流失</span>
  <div class="button_bar">
		<button class="common_button" onclick="javascript:history.go(-1);">返回</button>
		<button class="common_button" onclick="document.forms[0].submit();">保存</button>
  </div>
  
  <form action="${ctx }/drain/confirm" method="post">
  	<input type="hidden" name="id" value="${drain.id}"/>
	<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
		<tr>
			<th>编号</th>
			<td>${drain.id}</td>
			<th>客户</th>
			<td>${drain.customer.name}</td>
		</tr>
		<tr>
			<th>客户经理</th>
			<td>${drain.customer.manager.name}</td>
			<th>最后一次下单时间</th>
			<td><fmt:formatDate value="${drain.lastOrderDate }" pattern="yyyy-MM-dd"/></td>
		</tr>
		<c:forTokens items="${drain.delay}" delims="`" var="delay" varStatus="status">
			<c:if test="${delay != '' }">
				<tr>
					<th>暂缓措施-${status.count }</th>
					<td colspan="3">${delay}</td>
				</tr>
			</c:if>
		</c:forTokens>
		<tr>
			<th>流失原因</th>
			<td colspan="3"><textarea name="reason" cols="50" rows="6"></textarea>&nbsp;</td>
		</tr>
	</table>
	</form>	
  </body>
</html>
