<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@ taglib prefix="shiro" uri="http://www.atguigu.com/tags/shiro" %>
<%@ include file="/commons/common.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>新建客户服务</title>
	<script type="text/javascript">
		$(function(){
			$("#createDate").val(new Date().format("yyyy-MM-dd"));
		})
	</script>
</head>

<body class="main">

	<span class="page_title">新建客户服务</span>
	
	<div class="button_bar">
		<button class="common_button" onclick="javascript:history.go(-1);">
			返回
		</button>
		<button class="common_button" onclick="document.forms[0].submit();">
			保存
		</button>
	</div>
	
	<form action="${ctx }/service/create" method="post">
		<table class="query_form_table" border="0" cellPadding="3"
			cellSpacing="0">
			<tr>
				<th>
					服务类型
				</th>
				<td>
					<select name="serviceType">
						<option value="">
							未指定
						</option>
						<c:forEach items="${serviceTypes }" var="type">
							<option value="${type }">${type }</option>
						</c:forEach>
					</select>
					<span class="red_star">*</span>
				</td>
				<th>&nbsp;</th>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<th>
					概要
				</th>
				<td colspan="3">
					<input type="text" name="serviceTitle" size="50" />
					<span class="red_star">*</span>
				</td>
			</tr>
			<tr>
				<th>
					客户
				</th>
				<td>
					<select name="customer.id">
						<option value="">
							未指定
						</option>
						<c:forEach items="${customers }" var="customer">
							<option value="${customer.id }">${customer.name }</option>
						</c:forEach>
					</select>
					<span class="red_star">*</span>
				</td>
				<th>
					状态
				</th>
				<td>
					新创建 <input type="hidden" name="serviceState" value="新创建"/>
				</td>
			</tr>
			<tr>
				<th>
					服务请求
				</th>
				<td colspan="3">
					<textarea name="serviceRequest" rows="6" cols="50"></textarea>
					<span class="red_star">*</span>
				</td>
			</tr>
			<tr>
				<th>
					创建人
				</th>
				<td>
					<shiro:principal/>
					<span class="red_star">*</span>
				</td>
				<th>
					创建时间
				</th>
				<td>
					<input name="createDate" id="createDate" readonly="readonly" />
					<span class="red_star">*</span>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
