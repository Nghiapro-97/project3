package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookServices {
	private BookDAO bookDao;
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public BookServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request=request;
		this.response=response;
		bookDao=new BookDAO();
		categoryDAO=new CategoryDAO();
	}
	
	public void listBook(String message) throws ServletException, IOException {
		List<Book> listBooks = bookDao.listAll();
		request.setAttribute("listBooks", listBooks);
		
		if (message != null) {
			request.setAttribute("message", message);
		}
		
		String listPage="book_list.jsp";
		RequestDispatcher requestDispatcher=request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void listBook() throws ServletException, IOException {
		listBook(null);
	}
	
	public void showBookNewForm() throws ServletException, IOException {
		List<Category> listCategorys = categoryDAO.listAll();
		request.setAttribute("listCategorys", listCategorys);
		
		String listPage="book_form.jsp";
		RequestDispatcher requestDispatcher=request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
		
	}

	public void createBook() throws ServletException, IOException {
		String title=request.getParameter("title");
		
		Book existBook=bookDao.findByTitle(title);
		if (existBook!=null) {
			String message="Count not create new book because the title \"" + title + "\" already exists!";
			listBook(message);
			return;
		}
		
		Book newBook = new Book();
		readBookFields(newBook);
		
		Book createBook = bookDao.create(newBook);
		
		if (createBook.getBookId() > 0) {
			String message="A new book has been create successfull!";
			listBook(message);
		}
		
	}
	
	public void readBookFields(Book book) throws ServletException, IOException {
		Integer categoryId=Integer.parseInt(request.getParameter("category"));
		String title=request.getParameter("title");
		String author=request.getParameter("author");
		String description=request.getParameter("description");
		String isbn=request.getParameter("isbn");
		float price=Float.parseFloat(request.getParameter("price"));
		
		DateFormat dateFormat=new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate=null;
		try {
			publishDate=dateFormat.parse(request.getParameter("publishDate"));
			
		} catch (ParseException e) {
			e.printStackTrace();
			throw new ServletException("Error parsing publish date (format is MM/dd/yyyy)");
		}
		System.out.println("Date is:" + request.getParameter("publishDate"));
		
		book.setTitle(title);
		book.setAuthor(author);
		book.setDescription(description);
		book.setIsbn(isbn);
		book.setPublishDate(publishDate);
		
		Category category=categoryDAO.get(categoryId);
		book.setCategory(category);
		
		book.setPrice(price);
		
		Part part=request.getPart("bookImage");
		if (part != null && part.getSize() > 0) {
			long size=part.getSize();
			byte[] imageBytes = new byte[(int) size];
			
			InputStream inputStream=part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			
			book.setImage(imageBytes);
		}
	}

	public void editBook() throws ServletException, IOException {
		Integer bookId=Integer.parseInt(request.getParameter("id"));
		Book book=bookDao.get(bookId);
		request.setAttribute("book", book);
		
		List<Category> listCategorys=categoryDAO.listAll();
		request.setAttribute("listCategorys", listCategorys);
		
		String editPage="book_form.jsp";
		RequestDispatcher requestDispatcher=request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
		
	}
	
	public void updateBook() throws ServletException, IOException {
		Integer bookId=Integer.parseInt(request.getParameter("bookId"));
		String title=request.getParameter("title");
		Book existBook=bookDao.get(bookId);
		Book bookByTitle=bookDao.findByTitle(title);

		if (bookByTitle != null && !existBook.equals(bookByTitle)) {
			String message="Cound not update book because there's another book having same title!";
			listBook(message);
			return;
		}
		
		readBookFields(existBook);
		bookDao.update(existBook);
		
		String message="the book has been updated successfully!";
		listBook(message);
	}

	public void deleteBook() throws ServletException, IOException {
		Integer bookId=Integer.parseInt(request.getParameter("id"));
		bookDao.delete(bookId);
		
		String message="the book has been deleted successfully!";
		listBook(message);
	}

	public void listBooksByCategory() throws ServletException, IOException {
		int categoryId=Integer.parseInt(request.getParameter("id"));
		List<Book> listBooks = bookDao.listByCategory(categoryId);
		Category category=categoryDAO.get(categoryId);
		request.setAttribute("listBooks", listBooks);
		request.setAttribute("category", category);
		
		String listPage = "frontend/books_list_by_category.jsp";
		RequestDispatcher requestDispatcher=request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
		
	}

	public void viewBookDetail() throws ServletException, IOException {
		Integer bookId=Integer.parseInt(request.getParameter("id"));
		Book book=bookDao.get(bookId);
		request.setAttribute("book", book);
		
		BookDAO bookDAO=new BookDAO();
		List<Book> listNewBooks=bookDAO.listNewBook();
		request.setAttribute("listNewBooks", listNewBooks);
		
		ReviewDAO reviewDAO=new ReviewDAO();
		long rating5=reviewDAO.getPercentRating5(bookId);
		long rating4=reviewDAO.getPercentRating4(bookId);
		long rating3=reviewDAO.getPercentRating3(bookId);
		long rating2=reviewDAO.getPercentRating2(bookId);
		long rating1=reviewDAO.getPercentRating1(bookId);
		
		request.setAttribute("rating5", rating5);
		request.setAttribute("rating4", rating4);
		request.setAttribute("rating3", rating3);
		request.setAttribute("rating2", rating2);
		request.setAttribute("rating1", rating1);
		
		String detailPage = "frontend/book_detail.jsp";
		RequestDispatcher requestDispatcher=request.getRequestDispatcher(detailPage);
		requestDispatcher.forward(request, response);
	}

	public void search() throws ServletException, IOException {
		String keyword=request.getParameter("keyword");
		List<Category> listCategory = categoryDAO.listAll();
		List<Book> result=null;
		
		if (keyword.equals("")) {
			result=bookDao.listAll();
		} else {
			result=bookDao.search(keyword);
		}
		
		request.setAttribute("keyword",keyword);
		request.setAttribute("result",result);
		request.setAttribute("listCategory", listCategory);
		
		String resultPage = "frontend/search_result.jsp";
		RequestDispatcher requestDispatcher=request.getRequestDispatcher(resultPage);
		requestDispatcher.forward(request, response);
		
	}

}
