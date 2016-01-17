<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://www.atguigu.com/tags/shiro" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>处理客户服务</title>
</head>

<body class="main">

	<span class="page_title">处理客户服务</span>
	<div class="button_bar">
		<button class="common_button" onclick="javascript:history.go(-1);">
			返回
		</button>
	</div>

	<form action="${ctx }/service/feedback" method="post">
		<input type="hidden" name="id" value="${service.id }"/>
		<table class="query_form_table" border="0" cellPadding="3"
			cellSpacing="0">
			<tr>
				<th>
					编号
				</th>
				<td>${service.id}</td>
				<th>
					服务类型
				</th>
				<td>${service.serviceType}</td>
			</tr>
			<tr>
				<th>
					概要
				</th>
				<td colspan="3">${service.serviceTitle}</td>
			</tr>
			<tr>
				<th>
					客户
				</th>
				<td>${service.customer.name}</td>
				<th>
					状态
				</th>
				<td>
					已分配
				</td>
			</tr>
			<tr>
				<th>
					服务请求
				</th>
				<td colspan="3">${service.serviceRequest}</td>
			</tr>
			<tr>
				<th>
					创建人
				</th>
				<td>${service.createdby.name}</td>
				<th>
					创建时间
				</th>
				<td>
					<fmt:formatDate value="${service.createDate }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</table>
		
		<br />
		<table class="query_form_table">
			<tr>

				<th>
					分配给
				</th>
				<td>${service.allotTo.name}</td>
				<th>
					分配时间
				</th>
				<td>
					<fmt:formatDate value="${service.allotDate }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</table>
		
		<br />
		<table class="query_form_table">
			<tr>
				<th>
					服务处理
				</th>
				<td colspan="3">
					${service.serviceDeal}
					<span class="red_star">*</span>
				</td>
			</tr>
			<tr>
				<th>
					处理人
				</th>
				<td>
					<shiro:principal/>
					<span class="red_star">*</span>
				</td>
				<th>
					处理时间
				</th>
				<td>
					<input value="${service.dealDate}" readonly="readonly" id="dealDate" />
					<span class="red_star">*</span>
				</td>
			</tr>
		</table>
		<br />
		
		<table class="query_form_table">
			<tr>
				<th>处理结果</th>
				<td>${service.dealResult }<span class="red_star">*</span></td>
				<th>满意度</th>
				<td>
					${service.satisfy }
					<span class="red_star">*</span>
				</td>
			</tr>
		</table>
		
	</form>
</body>
</html>
