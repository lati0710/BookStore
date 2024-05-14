//Document ready thì show loại sách và số lượng trong giỏ hàng (jquery ajax)
$(function(){
	$.get(path + "/categories", function(data) {
		$('.dropdown-menu').html(data);
	});
	$.get(path + "/countItems", function(data) {
		$('#basket_total').html(data);
	});
});
//hàm xử lý add 1 sách vào giỏ hàng (jquery ajax)
function addBasket(bookId) {
	$.get(path + "/addItem/" + bookId, function(data) {
		$('#basket_total').html(data);
		window.scrollTo({ top: 0, behavior: 'smooth' });
	});
}
//hàm xử lý cập nhật lại số lượng trong giỏ hàng (jquery ajax)
function updateBasket(bookId, value) {
	$.get(path + "/updateBasket/" + bookId + "/" + value, function() {
		window.location.reload();
	});
}
//hàm xử lý xóa 1 sách trong giỏ hàng (jquery ajax)
function removeItem(bookId) {
	if (confirm('Bạn có muốn xóa không?')) {
		$.get(path + "/removeItem/" + bookId, function() {
			window.location.reload();
		});
	}
}