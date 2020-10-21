package com.bookstore.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bookstore.entity.Book;

public class BookDAO extends JpaDAO<Book> implements GenericDAO<Book> {

	public BookDAO() {
	}
	
	@Override
	public Book create(Book book) {
		book.setLastUpdateTime(new Date());
		return super.create(book);
	}
	
	@Override
	public Book update(Book book) {
		book.setLastUpdateTime(new Date());
		return super.update(book);
	}

	@Override
	public Book get(Object bookId) {
		return super.find(Book.class, bookId);
	}

	@Override
	public void delete(Object bookId) {
		super.delete(Book.class, bookId);
	}

	@Override
	public List<Book> listAll() {
		return super.findWithNamedQuery("Book.findAll");
	}
	
	public Book findByTitle(String title) {
		List<Book> result = super.findWithNamedQuery("Book.findByTitle", "title", title);
		if (!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	public List<Book> listByCategory(int categoryId){
		return super.findWithNamedQuery("Book.findByCategory", "categoryId", categoryId);
	}
	
	public List<Book> search(String keyword){
		return super.findWithNamedQuery("Book.search", "keyword", keyword);
	}
	
	public List<Book> listByNumber(int start, int max) {
		return super.findWithNamedQuery("Book.findAll", start, max);
	}

	public List<Book> listNewBook() {
		return super.findWithNamedQuery("Book.listNew", 0, 15);
	}

	@Override
	public long count() {
		return super.countWithNameQuery("Book.countAll");
	}
	
	public long countByCategory(int categoryId) {
		return super.countWithNameQuery("Book.countByCategory", "catId", categoryId);
	}
	
	public List<Book> listBestSellingBooks() {
		return super.findWithNamedQuery("OrderDetail.bestSelling", 0, 8);
	}

	public List<Book> listMostFavoreBooks() {
		List<Book> mostFavoreBooks=new ArrayList<Book>();
		List<Object[]> result=super.findWithNamedQueryObjects("Review.mostFavoreBooks", 0, 6);
		if (!result.isEmpty()) {
			for (Object[] elements : result) {
				Book book=(Book) elements[0];
				mostFavoreBooks.add(book);
			}
		}
		
		return mostFavoreBooks;
	}
}
