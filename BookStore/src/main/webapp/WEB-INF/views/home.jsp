<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" scope="request" />
<fmt:setLocale value="vi_VN" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hà Nam 88 - Kho sách hay</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${contextPath}/css/style.css" />
</head>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="${contextPath}/">SACHHAY88</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${contextPath}/trang-chu">Trang chủ <span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Thể loại </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">Giới
							thiệu</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${!empty sessionScope.accountid}">
							<li class="nav-item mr-2"><span class="nav-link">Xin
									chào: ${sessionScope.fullname}</span></li>
							<li class="nav-item mr-2"><img class="my-picture"
								src="${contextPath}/images/${sessionScope.picture}" /></li>
							<li class="nav-item mr-2"><a
								class="nav-link btn btn-primary" href="${contextPath}/thoat">
									Thoát</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item mr-2"><a
								class="nav-link btn btn-success" href="${contextPath}/dang-nhap">
									Đăng nhập</a></li>
						</c:otherwise>
					</c:choose>

					<li class="nav-item"><a class="nav-link btn btn-danger"
						href="${contextPath}/gio-hang"> Giỏ hàng(<span
							id="basket_total"><jsp:include
									page="${contextPath}/countItems"></jsp:include></span>)
					</a></li>
				</ul>
			</div>
		</nav>

		<div id="banner-slide"></div>
		<div id="content">
			<c:if test="${!empty page}">
				<jsp:include page="home/${page}.jsp" />
			</c:if>
		</div>
	</div>
	<div id="footer" class="container-fluid">
		<p style="text-align: center; font-size: 20px;">Copyright 2024 by
			sachhay88.com</p>
	</div>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
	<script>
		var path = '${pageContext.servletContext.contextPath}';
	</script>
	<script type="text/javascript" src="${contextPath}/js/home.js"></script>
</body>
</html>