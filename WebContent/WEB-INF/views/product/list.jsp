<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>产品查询</title>
</head>
<body>
	
	<div class="page_title">
		产品管理
	</div>
	<div class="button_bar">
		<button class="common_button" onclick="window.location.href='${ctx }/product/create'">
			产品添加
		</button>
		<button class="common_button" onclick="document.forms[0].submit();">
			查询
		</button>
	</div>
	
	<form action="${ctx }/product/list">
		<table class="query_form_table" border="0" cellPadding="3"
			cellSpacing="0">
			<tr>
				<th>
					名称
				</th>
				<td>
					<input type="text" name="search_LIKE_name" />
				</td>
				<th>
					型号
				</th>
				<td>
					<input type="text" name="search_LIKE_type" />
				</td>
				<th>
					批次
				</th>
				<td>
					<input type="text" name="search_LIKE_batch" />
				</td>
			</tr>
		</table>
		<!-- 列表数据 -->
		<br />
	</form>	
		
	<c:if test="${page != null && page.totalElements > 0 }">	
	<table class="data_list_table" border="0" cellPadding="3"
		cellSpacing="0">
		<tr>
			<th>
				编号
			</th>
			<th>
				名称
			</th>
			<th>
				型号
			</th>
			<th>
				等级/批次
			</th>
			<th>
				单位
			</th>
			<th>
				单价（元）
			</th>
			<th>
				备注
			</th>
			<th>
				操作
			</th>
		</tr>
		<c:forEach var="product" items="${page.content }">
			<tr>
				<td class="list_data_number">
					${product.id}
				</td>
				<td class="list_data_ltext">
					${product.name}
				</td>
				<td class="list_data_text">
					${product.type}
				</td>
				<td class="list_data_text">
					${product.batch}
				</td>
	
				<td class="list_data_text">
					${product.unit}
				</td>
				<td class="list_data_number">
					${product.price}
				</td>
				<td class="list_data_ltext">
					${product.memo}
				</td>
				<td class="list_data_op">
					<img onclick="window.location.href='${ctx}/product/create?id=${product.id }'" 
						title="编辑" src="${ctx }/static/images/bt_edit.gif" class="op_button" />
					<img onclick="window.location.href='${ctx}/product/delete?id=${product.id }'" 
						title="删除" src="${ctx }/static/images/bt_del.gif" class="op_button" />
				</td>
			</tr>
		</c:forEach>
	</table>
		<tags:pagination page="${page}" paginationSize="5"/>
	</c:if>
	<c:if test="${page == null || page.totalElements == 0 }">
		没有任何数据
	</c:if>
		
</body>
</html>