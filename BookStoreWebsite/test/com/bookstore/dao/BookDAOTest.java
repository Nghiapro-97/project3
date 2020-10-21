package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookDAOTest {
	private static BookDAO bookDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		bookDao=new BookDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		bookDao.close();
	}

	@Test
	public void testCreateBook() throws ParseException, IOException {
		Book newBook = new Book();
		Category category = new Category("Java Core");
		category.setCategoryId(12);
		newBook.setCategory(category);
		
		newBook.setTitle("Effective");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums");
		newBook.setIsbn("0321356683");
		
		String imagePath="D:\\My project\\WEB BookStore\\books\\EffectiveJava.JPG";
		byte[] image=Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(image);
		
		newBook.setPrice(38.87f);
		
		DateFormat dateFormat=new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate=dateFormat.parse("05/28/2008");
		newBook.setPublishDate(publishDate);
		
		Book creBook=bookDao.create(newBook);
		
		assertTrue(creBook.getBookId() > 0);
	}
	
	@Test
	public void testCreate2ndBook() throws ParseException, IOException {
		Book newBook = new Book();
		Category category = new Category("Advance Java");
		category.setCategoryId(13);
		newBook.setCategory(category);
		
		newBook.setTitle("Spring in Action: Covers Spring 4  ");
		newBook.setAuthor("Craig Walls ");
		newBook.setDescription("Spring in Action, Fourth Edition is a hands-on guide to the Spring Framework, updated for version 4");
		newBook.setIsbn("161729120X");
		
		String imagePath="D:\\My project\\WEB BookStore\\books\\SpringinAction.JPG";
		byte[] image=Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(image);
		
		newBook.setPrice(33.99f);
		
		DateFormat dateFormat=new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate=dateFormat.parse("05/28/2014");
		newBook.setPublishDate(publishDate);
		
		Book creBook=bookDao.create(newBook);
		
		assertTrue(creBook.getBookId() > 0);
	}
	
	@Test
	public void testUpdateBook() throws ParseException, IOException {
		Book existBook = new Book();
		existBook.setBookId(1);
		
		Category category = new Category("Java core");
		category.setCategoryId(1);
		existBook.setCategory(category);
		
		existBook.setTitle("Effective Java (3nd Edition)");
		existBook.setAuthor("Joshua Bloch");
		existBook.setDescription("New coverage of generics, enums");
		existBook.setIsbn("0321356683");
		
		String imagePath="D:\\My project\\WEB BookStore\\books\\EffectiveJava.JPG";
		byte[] image=Files.readAllBytes(Paths.get(imagePath));
		existBook.setImage(image);
		
		existBook.setPrice(48f);
		
		DateFormat dateFormat=new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate=dateFormat.parse("05/28/2008");
		existBook.setPublishDate(publishDate);
		
		Book updateBook=bookDao.update(existBook);
		
		assertEquals(updateBook.getTitle() , "Effective Java (3nd Edition)");
	}

	@Test(expected = EntityNotFoundException.class)
	public void testDeleteBookFail() {
		Integer bookId=100;
		bookDao.delete(bookId);
		
		assertTrue(true);
	}
	
	@Test
	public void testDeleteBookSuccess() {
		Integer bookId=1;
		bookDao.delete(bookId);
		
		assertTrue(true);
	}
	
	@Test
	public void testGetBookFail() {
		Integer bookId=102;
		Book book=bookDao.get(bookId);
		
		assertNull(book);
	}
	
	@Test
	public void testGetBookSuccess() {
		Integer bookId=11;
		Book book=bookDao.get(bookId);
		
		assertNotNull(book);
	}
	
	@Test
	public void testListAll() {
		List<Book> listBook = bookDao.listAll();
		
		for (Book book : listBook) {
			System.out.println(book.getTitle()  + "-" + book.getAuthor());
		}
		
		assertFalse(listBook.isEmpty());
	}
	
	@Test
	public void findByTitleExit() {
		String title="Effective Java (2nd Edition)";
		Book book = bookDao.findByTitle(title);
		
		System.out.println(book.getAuthor());
		System.out.println(book.getPrice());
		
		assertNotNull(book);
	}
	
	@Test
	public void findByTitleNotExit() {
		String title="Effective";
		Book book = bookDao.findByTitle(title);
		
		assertNull(book);
	}
	
	@Test
	public void countAll() {
		long totalBook = bookDao.count();
		
		assertEquals(33, totalBook);
	}
	
	@Test
	public void testListByCategory() {
		int categoryId=2;
		List<Book> listBooks=bookDao.listByCategory(categoryId);
		
		assertTrue(listBooks.size() > 0);
	}
	
	@Test
	public void testListByNumber() {
		int start = 0, max=3;
		List<Book> listBook = bookDao.listByNumber(start,max);
		
		for (Book abook : listBook) {
			System.out.println(abook.getBookId() + " - " + abook.getTitle());
		}
		
		assertTrue(listBook.size() > 0);
	}
	
	@Test
	public void testListNewBook() {
		List<Book> listNewBook = bookDao.listNewBook();
		
		for (Book abook : listNewBook) {
			System.out.println(abook.getTitle() + " - " + abook.getPublishDate());
		}
		
		assertEquals(7, listNewBook.size());
	}
	
	@Test
	public void testSearchBookByTitle() {
		String keyword="Java";
		List<Book> resuList = bookDao.search(keyword);
		
		for (Book abook : resuList) {
			System.out.println(abook.getTitle());
		}
		
		assertEquals(5, resuList.size());
	}
	
	@Test
	public void testSearchBookByAuthor() {
		String keyword="Kathy";
		List<Book> resuList = bookDao.search(keyword);
		
		for (Book abook : resuList) {
			System.out.println(abook.getTitle());
		}
		
		assertEquals(2, resuList.size());
	}
	
	@Test
	public void testSearchBookByDescrip() {
		String keyword="J2EE 1.5";
		List<Book> resuList = bookDao.search(keyword);
		
		for (Book abook : resuList) {
			System.out.println(abook.getTitle());
		}
		
		assertEquals(1, resuList.size());
	}
	
	@Test
	public void testCountByCategory() {
		int categoryId=11;
		long numOfBook=bookDao.countByCategory(categoryId);
		
		assertTrue(numOfBook == 5);
	}
	
	@Test
	public void testListBestSellingBooks() {
		List<Book> topBestSellingBooks = bookDao.listBestSellingBooks();
		
		for (Book book : topBestSellingBooks) {
			System.out.println(book.getTitle());
		}
		
		assertEquals(6, topBestSellingBooks.size());
	}
	
	@Test
	public void testListMostFavoreBooks() {
		List<Book> topMostFavoreBooks = bookDao.listMostFavoreBooks();
		
		for (Book book : topMostFavoreBooks) {
			System.out.println(book.getTitle());
		}
		
		assertEquals(6, topMostFavoreBooks.size());
	}
}
