<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>联系人管理</title>
</head>

<body>

	<div class="page_title">
		联系人管理
	</div>
	<div class="button_bar">

		<button class="common_button" onclick="window.location.href='${ctx}/contact/create?customerid=${customer.id }'">
			新建
		</button>
		<button class="common_button" onclick="javascript:history.go(-1);">
			返回
		</button>
	</div>
	
	<form action="${ctx}/contact/list" method="post">
		<table class="query_form_table" border="0" cellPadding="3"
			cellSpacing="0">
			<tr>
				<th>
					客户编号
				</th>
				<td>${customer.no}</td>
				<th>
					客户名称
				</th>
				<td>${customer.name}</td>
			</tr>
		</table>
		<!-- 列表数据 -->
		<br />
		
		<c:if test="${page != null && page.totalElements > 0 }">
			<table class="data_list_table" border="0" cellPadding="3"
				cellSpacing="0">
				<tr>
					<th>
						姓名
					</th>
					<th>
						性别
					</th>
					<th>
						职位
					</th>
					<th>
						办公电话
					</th>
					<th>
						手机
					</th>
					<th>
						备注
					</th>
					<th>
						操作
					</th>
				</tr>
	
				<c:forEach var="contact" items="${page.content }">
					<tr>
						<td class="list_data_text">
							${contact.name}
						</td>
						<td class="list_data_text">
							${contact.sex}
						</td>
						<td class="list_data_text">
							${contact.position}
						</td>
						<td class="list_data_text">
							${contact.tel}
						</td>
						<td class="list_data_text">
							${contact.mobile}
						</td>

						<td class="list_data_ltext">
							${contact.memo}
						</td>
						<td class="list_data_op">
							<img onclick="window.location.href='${ctx}/contact/create?id=${contact.id }'" 
								title="编辑" src="${ctx }/static/images/bt_edit.gif" class="op_button" />
							<img onclick="window.location.href='${ctx}/contact/delete?id=${contact.id }&customerid=${customer.id }'" 
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
	</form>
</body>
</html>