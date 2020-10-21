package com.bookstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookstore.entity.Review;

public class ReviewDAO extends JpaDAO<Review> implements GenericDAO<Review> {

	@Override
	public Review create(Review review) {
		review.setReviewTime(new Date());
		return super.create(review);
	}
	
	@Override
	public Review get(Object reviewId) {
		return super.find(Review.class, reviewId);
	}

	@Override
	public void delete(Object reviewId) {
		super.delete(Review.class, reviewId);
	}

	@Override
	public List<Review> listAll() {
		return super.findWithNamedQuery("Review.listAll");
	}

	public Review findByCustomerAndBook(int customerId, int bookId) {
		Map<String, Object> parameters=new HashMap<String, Object>();
		parameters.put("customerId", customerId);
		parameters.put("bookId", bookId);
		
		List<Review> result=super.findWithNamedQuery("Review.findByCustomerAndBook", parameters);
		if (!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}

	public List<Review> listMostRecentReviews() {
		return super.findWithNamedQuery("Review.listAll", 0, 3);
	}
	
	@Override
	public long count() {
		return super.countWithNameQuery("Review.countAll");
	}
	
	public long percent(int bookId, long x) {
		long y=super.countWithNameQuery("Review.reviewCount", "bookId", bookId);
		long per=(long)((x*100.00f)/y);
		return per;
	}
	
	public long getPercentRating5(int bookId) {
		long x=super.countWithNameQuery("Review.reviewCount5", "bookId", bookId);
		return percent(bookId, x);
	}
	
	public long getPercentRating4(int bookId) {
		long x=super.countWithNameQuery("Review.reviewCount4", "bookId", bookId);
		return percent(bookId, x);
	}
	
	public long getPercentRating3(int bookId) {
		long x=super.countWithNameQuery("Review.reviewCount3", "bookId", bookId);
		return percent(bookId, x);
	}
	
	public long getPercentRating2(int bookId) {
		long x=super.countWithNameQuery("Review.reviewCount2", "bookId", bookId);
		return percent(bookId, x);
	}
	
	public long getPercentRating1(int bookId) {
		long x=super.countWithNameQuery("Review.reviewCount1", "bookId", bookId);
		return percent(bookId, x);
	}
}
