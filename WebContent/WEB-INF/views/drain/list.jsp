<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>客户流失管理</title>
</head>
<body>

	<div class="page_title">
		客户流失管理
	</div>
	<div class="button_bar">
		<button class="common_button" onclick="document.forms[0].submit();">
			查询
		</button>
	</div>
	
	<form action="${ctx }/drain/list" method="post"> 
		<table class="query_form_table" border="0" cellPadding="3"
			cellSpacing="0">
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
				<th>
					&nbsp;
				</th>
				<td>
					&nbsp;
				</td>
			</tr>
		</table>
		<!-- 列表数据 -->
		<br />
		
		<c:if test="${page != null && page.totalElements > 0 }">
			<table class="data_list_table" border="0" cellPadding="3"
				cellSpacing="0">
				<tr>
					<th>
						编号
					</th>
					<th>
						客户名称
					</th>
					<th>
						客户经理
					</th>
					<th>
						上次下单时间
					</th>
					<th>
						确认流失时间
					</th>
					<th>
						流失原因
					</th>
					<th>
						状态
					</th>
					<th>
						操作
					</th>
				</tr>
				<c:forEach var="drain" items="${page.content }">
					<tr>
						<td class="list_data_number">
							${drain.id}
						</td>
						<td class="list_data_ltext">
							${drain.customer.name}
						</td>
						<td class="list_data_text">
							${drain.customer.manager.name}
						</td>
						<td class="list_data_text">
							<fmt:formatDate value="${drain.lastOrderDate }" pattern="yyyy-MM-dd"/>
						</td>
						<td class="list_data_text">
							<fmt:formatDate value="${drain.drainDate }" pattern="yyyy-MM-dd"/>
						</td>
						<td class="list_data_ltext">
							${drain.reason}
						</td>
						<td class="list_data_text">
							${drain.status}
						</td>
						<td class="list_data_op">
							<c:if test="${drain.status == '流失预警'}">
								<img onclick="window.location.href=''" 
									title="确认流失" src="${ctx }/static/images/bt_confirm.gif" class="op_button" />
								<img onclick="window.location.href='${ctx}/drain/delay?id=${drain.id }'" 
									title="暂缓流失" src="${ctx }/static/images/bt_relay.gif" class="op_button" />
							</c:if>
						</td>
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
