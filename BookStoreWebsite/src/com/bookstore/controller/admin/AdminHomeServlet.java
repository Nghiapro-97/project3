package com.bookstore.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CustomerDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.dao.UserDAO;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Review;

@WebServlet("/admin/")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AdminHomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doGet(req, resp);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO userDAO=new UserDAO();
		BookDAO bookDAO = new BookDAO();
		CustomerDAO customerDAO= new CustomerDAO();
		ReviewDAO reviewDAO = new ReviewDAO();
		OrderDAO orderDAO= new OrderDAO();
		
		List<BookOrder> listMostRecentSales = orderDAO.listMostRecentSales();
		List<Review> listMostRecentReviews = reviewDAO.listMostRecentReviews();
		
		long totalUser=userDAO.count();
		long totalBook=bookDAO.count();
		long totalCustomer=customerDAO.count();
		long totalReview=reviewDAO.count();
		long totalOrder=orderDAO.count();
		
		request.setAttribute("listMostRecentSales", listMostRecentSales);
		request.setAttribute("listMostRecentReviews", listMostRecentReviews);
		request.setAttribute("totalUser", totalUser);
		request.setAttribute("totalBook", totalBook);
		request.setAttribute("totalCustomer", totalCustomer);
		request.setAttribute("totalReview", totalReview);
		request.setAttribute("totalOrder", totalOrder);
		
		String page="index.jsp";
		RequestDispatcher dispatcher=request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}

}
