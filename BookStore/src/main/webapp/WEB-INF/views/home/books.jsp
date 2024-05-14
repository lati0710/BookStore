<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h4 class="title-group">${title}</h4>
<div class="row">
	<c:forEach items="${books}" var="b">
		<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
			<div class="card" style="width: 100%">
				<img class="card-img-top" src="${contextPath}/images/${b.picture}" />
				<div class="card-body">
					<h6 class="card-title">${b.title}</h6>
					<p class="card-text">
						Giá:
						<fmt:formatNumber value="${b.price}" type="currency" />
					</p>
					<button onclick="addBasket('${b.bookId}')" class="btn btn-primary">Mua</button>
					<a href="${contextPath}/chi-tiet/${b.bookId}"
						class="btn btn-success">Chi tiết</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>