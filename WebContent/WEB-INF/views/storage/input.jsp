<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>编辑库存</title>
</head>

<body class="main">

	<span class="page_title">编辑库存</span>
	<div class="button_bar">
		<button class="common_button" onclick="javascript:history.go(-1);">
			返回
		</button>
		<button class="common_button" onclick="document.forms[0].submit();">
			保存
		</button>
	</div>
	
	<form:form action="${ctx }/storage/create" method="POST" modelAttribute="storage">
		<form:hidden path="id"/>
		<table class="query_form_table" border="0" cellPadding="3"
			cellSpacing="0">
			<tr>
				<th>
					产品 -${storage.id != null }-
				</th>
				<td>
					<c:if test="${storage.id == null }">
						<form:select path="product.id" items="${products }"
							itemLabel="name" itemValue="id"></form:select>
					</c:if>
					<c:if test="${storage.id != null }">
						<form:input path="product.name" readonly="true"/>
						<form:hidden path="product.id" readonly="true"/>
					</c:if>
				</td>
				<th>
					仓库
				</th>
				<td>
					<c:if test="${storage.id == null }">
						<form:input path="wareHouse"/>
					</c:if>
					<c:if test="${storage.id != null }">
						<form:input path="wareHouse" readonly="true"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>
					货位
				</th>
				<td>
					<c:if test="${storage.id == null }">
						<form:input path="stockWare"/>
					</c:if>
					<c:if test="${storage.id != null }">
						<form:input path="stockWare" readonly="true"/>
					</c:if>
				</td>
				<th>
					<c:if test="${storage.id == null }">数量</c:if>
					<c:if test="${storage.id != null }">新增数量</c:if>
				</th>
				<td>
					<c:if test="${storage.id == null }">
						<form:input path="stockCount"/>
					</c:if>
					<c:if test="${storage.id != null }">
						<form:hidden path="stockCount"/>
						<input name="incrementCount"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>
					备注
				</th>
				<td>
					<c:if test="${storage.id == null }">
						<form:input path="memo"/>
					</c:if>
					<c:if test="${storage.id != null }">
						<form:input path="memo" readonly="true"/>
					</c:if>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>
