<%@tag pageEncoding="UTF-8"%>

<%@ attribute name="page" type="org.springframework.data.domain.Page" required="true"%>
<%@ attribute name="paginationSize" type="java.lang.Integer" required="true"%>
<%@ attribute name="condition" type="java.lang.String" required="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
<div style="text-align:right; padding:6px 6px 0 0;">

	<% 
		if(condition == null){
			condition = "1=1";
		}
	%>

	共 ${page.totalElements} 条记录 
	&nbsp;&nbsp;
	
	当前第 ${page.number + 1} 页/共 ${page.totalPages} 页
	&nbsp;&nbsp;
	
	<% if (page.hasPreviousPage()){%>
		<a href='?page=1&sortType=${sortType}&${searchParams}&${condition}'>首页</a>
		&nbsp;&nbsp;
		<a href='?page=${page.number + 1-1}&sortType=${sortType}&${searchParams}&${condition}'>上一页</a>
		&nbsp;&nbsp;
	<%}%>
	 
	<% if (page.hasNextPage()){%>
		<a href='?page=${page.number + 1+1}&sortType=${sortType}&${searchParams}&${condition}'>下一页</a>
		&nbsp;&nbsp;
		<a href='?page=${page.totalPages}&sortType=${sortType}&${searchParams}&${condition}'>末页</a>
		&nbsp;&nbsp;
	<%}%>
	
	转到 <input id="pageNo" size='1'/> 页
	&nbsp;&nbsp;

</div>

<script type="text/javascript" src="${ctx }/static/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$("#pageNo").change(function(){
			
			var pageNo = $(this).val();
			var reg = /^\d+$/;
			if(!reg.test(pageNo)){
				$(this).val("");
				alert("输入的页码不合法");
				return;
			}
			
			var pageNo2 = parseInt(pageNo);
			if(pageNo2 < 1 || pageNo2 > parseInt("${page.totalPages}")){
				$(this).val("");
				alert("输入的页码不合法");
				return;
			}
			
			//查询条件需要放入到 class='condition' 的隐藏域中. 
			window.location.href = window.location.pathname
				+ "?page=" + pageNo2 + "&sortType=${sortType}&${searchParams}&${condition}";
			
		});
	})
</script>