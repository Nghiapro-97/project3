package com.bookstore.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;

@WebServlet("")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public HomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDAO bookDAO=new BookDAO();
		
		List<Book> listNewBooks=bookDAO.listNewBook();
		List<Book> listBestSellingBooks=bookDAO.listBestSellingBooks();
		List<Book> listMostFavoreBooks=bookDAO.listMostFavoreBooks();
		
		
		request.setAttribute("listNewBooks", listNewBooks);
		request.setAttribute("listBestSellingBooks", listBestSellingBooks);
		request.setAttribute("listMostFavoreBooks", listMostFavoreBooks);
		
		//pagination page
		int page=1;
		int recordsPerPage=16;
		if (request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		List<Book> listBook=bookDAO.listByNumber((page-1)*recordsPerPage, recordsPerPage);
		
		long noOfRecords=(long) bookDAO.count();
		long noOfPages=(long) Math.ceil(noOfRecords*1.0 / recordsPerPage);
		
		request.setAttribute("listBook", listBook);
		request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        //end pagination
		
		String homePage="frontend/index.jsp";
		RequestDispatcher dispatcher=request.getRequestDispatcher(homePage);
		dispatcher.forward(request, response);
	}

}
