<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="total" value="0" />
<div class="row">
	<div class="col-md-8">
		<h4 class="title-group">GIỎ HÀNG</h4>
		<div style="width: 100%; margin: auto; padding: 20px;">
			<p style="color: red">${msg}</p>
			<table class="table table-bordered">
				<tr>
					<th>Mã sách</th>
					<th>Tên sách</th>
					<th>Giá</th>
					<th>Số lượng</th>
					<th>Thành tiền</th>
					<th></th>
				</tr>

				<c:forEach items="${baskets}" var="b">
					<tr>
						<td>${b.bookId}</td>
						<td><a href="${contextPath}/chi-tiet/${b.bookId}">${b.title}</a></td>
						<td><fmt:formatNumber value="${b.price}" type="currency" /></td>
						<td><input type="number" style="width: 60px"
							onchange="updateBasket('${b.bookId}',this.value)"
							value="${b.quantity}" min="1" max="100" /></td>
						<td><fmt:formatNumber value="${b.price*b.quantity}"
								type="currency" /></td>
						<c:set var="total" value="${total+b.price*b.quantity}" />
						<td><a href="#" class="btn btn-danger"
							onclick="removeItem('${b.bookId}')">Xóa</a></td>
					</tr>
				</c:forEach>
			</table>
			<h5>
				Tổng tiền:
				<fmt:formatNumber value="${total}" type="currency" />
			</h5>
		</div>
	</div>
	<div class="col-md-4">
		<h4 class="title-group">Thông tin đặt hàng</h4>
		<form action="dat-hang" method="post">
			<table>
				<tr>
					<td>Họ và tên:</td>
					<td>${sessionScope.fullname}</td>
				</tr>
				<tr>
					<td>Địa chỉ</td>
					<td><input type="text" name="address"
						value="${sessionScope.address}" /></td>
				</tr>
				<tr>
					<td>Điện thoại</td>
					<td><input type="text" name="phone"
						value="${sessionScope.phone}" /></td>
				</tr>
				<tr>
					<td>Ghi chú</td>
					<td><textarea name="note"></textarea></td>
				<tr>
					<td>
						<button class="btn btn-primary">Đặt hàng</button>
					</td>
				</tr>
			</table>

		</form>
	</div>
</div>
