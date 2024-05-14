package com.controllers;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dao.AccountDao;
import com.dao.BookDao;
import com.dao.CategoryDao;
import com.dao.OrderDao;
import com.entities.Account;
import com.entities.Basket;
import com.entities.Book;
import com.entities.OrderBook;
import com.entities.OrderDetail;
import com.util.Cipher;

@Controller
public class HomeController {
	
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	BookDao bookDao;
	@Autowired
	AccountDao accountDao;
	@Autowired
	OrderDao orderDao;
	
	@RequestMapping(value = { "", "trang-chu" })
	public String index(Model model) {
		model.addAttribute("title", "DANH MỤC SÁCH");
		model.addAttribute("books", bookDao.getAll());
		model.addAttribute("page", "books");
		return "home";
	}
	
	@RequestMapping(value = "categories")
	public String getCategories(Model model) {
		model.addAttribute("categories", categoryDao.getAll());
		return "home/categories";
	}
	
	@RequestMapping(value = "danh-muc-sach/{id}")
	public String getBooks(@PathVariable("id") Integer cateId, Model model) {
		model.addAttribute("title", "DANH MỤC SÁCH: " +categoryDao.get(cateId).getCategoryName());
		model.addAttribute("books", bookDao.getByCategory(cateId));
		model.addAttribute("page", "books");
		return "home";
	}
	
	@RequestMapping(value = "chi-tiet/{id}")
	public String detail(@PathVariable("id") String bookId, Model model) {
		model.addAttribute("book", bookDao.get(bookId));
		model.addAttribute("page", "bookdetail");
		return "home";
	}
	
	@RequestMapping(value = "countItems")
	public @ResponseBody String getItems(Model model, HttpServletRequest req) {
		List<Basket> baskets = new ArrayList<>();
		HttpSession session = req.getSession();
		if (session.getAttribute("basket") != null) {
			baskets = (List<Basket>) session.getAttribute("basket");
		}
		System.out.println(baskets.size());
		return String.valueOf(baskets.size());
	}
	
	@RequestMapping(value = "addItem/{id}")
	public @ResponseBody String addItem(@PathVariable("id") String bookId, HttpServletRequest req) {
		List<Basket> baskets = new ArrayList<>();
		HttpSession session = req.getSession();
		Book b = bookDao.get(bookId);
		if (session.getAttribute("basket") == null) {
			Basket basket = new Basket(b.getBookId(), b.getTitle(), b.getPrice(), 1);
			baskets.add(basket);
			session.setAttribute("basket", baskets);
		} else {
			baskets = (List<Basket>) session.getAttribute("basket");
			boolean duplicate = false;
			for (int i = 0; i < baskets.size(); i++) {
				Basket bs = baskets.get(i);
				if (bs.getBookId().equals(bookId)) {
					bs.setQuantity(bs.getQuantity() + 1);
					duplicate = true;
					break;
				}
			}
			if (duplicate)
				session.setAttribute("basket", baskets);
			else {
				Basket basket = new Basket(b.getBookId(), b.getTitle(), b.getPrice(), 1);
				baskets.add(basket);
			}
		}
		session.setAttribute("basket", baskets);
		return String.valueOf(baskets.size());
	}
	
	@RequestMapping(value = "gio-hang")
	public String showBasket(Model model, HttpServletRequest req) {
		model.addAttribute("page", "basket");
		List<Basket> baskets = new ArrayList<>();
		HttpSession session = req.getSession();
		if (session.getAttribute("basket") != null) {
			baskets = (List<Basket>) session.getAttribute("basket");
		}
		model.addAttribute("baskets", baskets);
		return "home";
	}
	
	@RequestMapping(value = "updateBasket/{id}/{value}")
	public @ResponseBody String updateBasket(@PathVariable("id") String bookId, @PathVariable("value") Integer quantity,
			Model model, HttpServletRequest req) {
		List<Basket> baskets = new ArrayList<>();
		HttpSession session = req.getSession();
		if (session.getAttribute("basket") != null) {
			baskets = (List<Basket>) session.getAttribute("basket");
			for (int i = 0; i < baskets.size(); i++) {
				Basket bs = baskets.get(i);
				if (bs.getBookId().equals(bookId)) {
					bs.setQuantity(quantity);
					break;
				}
			}
		}
		return "";
	}
	
	@RequestMapping(value = "removeItem/{id}")
	public @ResponseBody String removeItem(@PathVariable("id") String bookId, HttpServletRequest req) {
		List<Basket> baskets = new ArrayList<>();
		HttpSession session = req.getSession();
		boolean find = false;
		if (session.getAttribute("basket") != null) {
			int i;
			baskets = (List<Basket>) session.getAttribute("basket");
			for (i = 0; i < baskets.size(); i++) {
				Basket bs = baskets.get(i);
				if (bs.getBookId().equals(bookId)) {
					find = true;
					break;
				}
			}
			if (find) {
				baskets.remove(i);
			}
			session.setAttribute("basket", baskets);
		}

		return "";
	}
	
	@RequestMapping(value = "dang-nhap", method = RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("page", "login");
		return "home";
	}
	
	@RequestMapping(value = "dang-nhap", method = RequestMethod.POST)
	public String login(String username, String password, Model model, HttpServletRequest req) {
		Account acc = accountDao.getAccount(username);
		String passMd5 = Cipher.GenerateMD5(username + password);
		if (acc == null || !acc.getPassword().equals(passMd5)) {
			model.addAttribute("msg", "Thông tin đăng nhập sai");
			model.addAttribute("page", "login");
			return "home";
		}
		HttpSession session = req.getSession();
		session.setMaxInactiveInterval(3600);
		session.setAttribute("accountid", acc.getAccountId());
		session.setAttribute("picture", acc.getPicture());
		session.setAttribute("address", acc.getAddress());
		session.setAttribute("phone", acc.getPhone());
		session.setAttribute("fullname", acc.getFullName());
		return "redirect:/";
	}
	
	@RequestMapping(value = "thoat")
	public String logout(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/dang-nhap";
	}
	
	@RequestMapping(value = "dat-hang")
	public String addOrder(String address, String phone, String note, Model model, HttpServletRequest req) {
		
		List<Basket> baskets=null;
		HttpSession session = req.getSession();
		if (session.getAttribute("accountid") == null) {
			return "redirect:/dang-nhap";
		}
		if (session.getAttribute("basket") != null) {
			baskets = (List<Basket>) session.getAttribute("basket");
			String timeStamp = new SimpleDateFormat("yyMMdd-HHmmss").format(Calendar.getInstance().getTime());
			OrderBook order=new OrderBook();
			order.setOrderId("HD"+timeStamp);
			order.setAccountId(session.getAttribute("accountid").toString());
			order.setOrderDate(Date.valueOf(LocalDate.now()));
			order.setReceiveAddress(address);
			order.setReceiveDate(null);
			order.setReceivePhone(phone);
			order.setNote(note);
			List<OrderDetail> orderdetails=new ArrayList<OrderDetail>();
			for (Basket basket : baskets) {
				orderdetails.add(new OrderDetail("HD"+timeStamp, basket.getBookId(), basket.getQuantity(), basket.getPrice()));
			}
			orderDao.insertOrderDetail(order, orderdetails);
			model.addAttribute("msg","Đặt hàng thành công");
		} else {
			model.addAttribute("msg","Giỏ hàng trống");
		}
		model.addAttribute("page","basket");
		baskets=new ArrayList<Basket>();
		session.setAttribute("basket", null);
		model.addAttribute("baskets", baskets);
		return "home";
	}

}
