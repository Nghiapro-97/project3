package com.bookstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewDAOTest {
	private static ReviewDAO reviewDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		reviewDao=new ReviewDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		reviewDao.close();
	}

	@Test
	public void testCreateReview() {
		Review review=new Review();
		Book book = new Book();
		book.setBookId(32);
		
		Customer customer=new Customer();
		customer.setCustomerId(16);
		
		review.setBook(book);
		review.setCustomer(customer);
		review.setHeadline("this is very good book!");
		review.setRating(3);
		review.setComment("i have just read book. very good!");
		
		Review saveReview=reviewDao.create(review);
		assertTrue(saveReview.getReviewId() > 0);
	}

	@Test
	public void testGet() {
		Integer reviewId=15;
		Review review=reviewDao.get(reviewId);
		assertNotNull(review);
	}

	@Test
	public void testUpdateReview() {
		int reviewId=15;
		Review review=reviewDao.get(reviewId);
		review.setHeadline("Excellent Book");
		
		Review updateReview=reviewDao.update(review);
		
		assertEquals(review.getHeadline(), updateReview.getHeadline());
	}
	
	@Test
	public void testDeleteReview() {
		Integer reviewId=17;
		reviewDao.delete(reviewId);
		Review review=reviewDao.get(reviewId);
		assertNull(review);
	}

	@Test
	public void testListAll() {
		List<Review> listReviews=reviewDao.listAll();
		for (Review review : listReviews) {
			System.out.println(review.getReviewId() + " - " + review.getBook().getTitle() 
								+ " - " + review.getCustomer().getFirstname()
								+ " - " + review.getHeadline() + " - " + review.getRating());
		}
		assertTrue(listReviews.size() > 0);
	}

	@Test
	public void testCount() {
		long totalReview=reviewDao.count();
		System.out.println("Total review: " + totalReview);
		assertTrue(totalReview > 0);
	}

	@Test
	public void testFindByCustomerAndBookNotFound() {
		Integer customerId=100;
		Integer bookId=99;
		
		Review result=reviewDao.findByCustomerAndBook(customerId, bookId);
		assertNull(result);
	}
	
	@Test
	public void testFindByCustomerAndBookFound() {
		Integer customerId=12;
		Integer bookId=32;
		
		Review result=reviewDao.findByCustomerAndBook(customerId, bookId);
		assertNotNull(result);
	}
	
	@Test
	public void testListMostRecentReviews() {
		List<Review> recentReviews= reviewDao.listMostRecentReviews();
		
		assertEquals(3, recentReviews.size());
	}
	
	@Test
	public void testGetPercentRating5(){
		long per=reviewDao.getPercentRating5(32);
		System.out.println("Percent review 5: " + per);
		assertTrue(per > 0);
	}
	
	@Test
	public void testGetPercentRating4(){
		long per=reviewDao.getPercentRating4(32);
		System.out.println("Percent review 4: " + per);
		assertTrue(per > 0);
	}
	
	@Test
	public void testGetPercentRating3(){
		long per=reviewDao.getPercentRating3(32);
		System.out.println("Percent review 3: " + per);
		assertTrue(per > 0);
	}
	
	@Test
	public void testGetPercentRating2(){
		long per=reviewDao.getPercentRating2(32);
		System.out.println("Percent review 2: " + per);
		assertTrue(per > 0);
	}
	
	@Test
	public void testGetPercentRating1(){
		long per=reviewDao.getPercentRating1(32);
		System.out.println("Percent review 1: " + per);
		assertTrue(per > 0);
	}
}
