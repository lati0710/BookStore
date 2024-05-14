<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h4 class="title-group">CHI TIẾT SẢN PHẨM</h4>
<div class="row" style="padding: 10px; box-sizing: border-box;">
	<div class="col-3">
		<img src="${contextPath}/images/${book.picture}" width="95%" />
	</div>
	<div class="col-9">
		<p>${book.title}</p>
		<p>
			Giá :
			<fmt:formatNumber value="${book.price}" type="currency" />
		</p>
	</div>
	<div class="col-12">
		<h4>Mô tả</h4>
		<p>${book.description}</p>
	</div>
	<button onclick="addBasket('${book.bookId}')" class="btn btn-primary">Mua</button>
	&nbsp; <a class="btn btn-success" href="javascript:history.back();">Quay
		lại</a>
</div>