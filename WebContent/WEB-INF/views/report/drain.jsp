<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>客户流失分析</title>
  </head>  
  <body>
  	<div class="button_bar">
		<button class="common_button" onclick="document.forms[0].submit();">查询</button>  
	</div>
	
  	<form action="${ctx }/report/drain">
		<table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>
				<th>
					客户名称
				</th>
				<td>
					<input type="text" name="search_LIKE_customer.name" />
				</td>
				<th>
					客户经理
				</th>
				<td>
					<input type="text" name="search_LIKE_customer.manager.name" />
				</td>
			</tr>
		</table>
		<!-- 列表数据 -->
		<br />
		
		<c:if test="${page != null && page.totalElements > 0 }">	
			<table class="data_list_table" border="0" cellPadding="3" cellSpacing="0">
			<tr>			
				<th>序号</th>
				<th>确认流失时间</th>			
				<th>客户</th>
				<th>客户经理</th>
				<th>流失原因</th>
			</tr>
				<c:forEach var="drain" items="${page.content }" varStatus="status">
					<tr>
						<td class="list_data_number">${status.count}</td>				
						<td class="list_data_text"><fmt:formatDate value="${drain.drainDate }" pattern="yyyy-MM-dd"/></td>
						<td class="list_data_text">${drain.customer.name}</td>				
						<td class="list_data_text">${drain.customer.manager.name}</td>
						<td class="list_data_ltext">${drain.reason}</td>				
					</tr>			
				</c:forEach>
			</table>
			<tags:pagination page="${page}" paginationSize="5"/>
		</c:if>
		<c:if test="${page == null || page.totalElements == 0 }">
			没有任何数据
		</c:if>
	</form>	
  </body>
</html>