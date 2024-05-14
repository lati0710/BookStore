<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div style="width: 400px; margin: auto; padding: 20px;">
	<h4 class="title-group">Đăng nhập</h4>
	<p style="color: red;">${msg}</p>
	<form action="${contextPath}/dang-nhap" method="post">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="Tên đăng nhập"
				name="username">
		</div>
		<div class="form-group">
			<input type="password" class="form-control" placeholder="Mật khẩu"
				name="password">
		</div>
		<button type="submit" class="btn btn-primary">Đăng nhập</button>
	</form>
</div>