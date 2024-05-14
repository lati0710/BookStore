<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${categories}" var="c">
	<a class="dropdown-item"
		href="${pageContext.servletContext.contextPath}/danh-muc-sach/${c.categoryId}">${c.categoryName}</a>
</c:forEach>
