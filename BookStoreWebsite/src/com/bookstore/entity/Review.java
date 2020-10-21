package com.bookstore.entity;
// default package

// Generated Sep 2, 2020, 8:57:07 PM by Hibernate Tools 5.2.12.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.NamedQueries;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@NamedQueries({ 
	@NamedQuery(name = "Review.listAll", query = "SELECT r FROM Review r ORDER BY r.reviewTime DESC"),
	@NamedQuery(name = "Review.countAll", query = "SELECT COUNT(r) FROM Review r"), 
	@NamedQuery(name = "Review.findByCustomerAndBook", query = "SELECT r FROM Review r WHERE r.customer.customerId =: customerId"
				+ " AND r.book.bookId =: bookId"), 
	@NamedQuery(name = "Review.mostFavoreBooks", 
			query = "SELECT r.book, COUNT(r.book.bookId) AS ReviewCount, AVG(r.rating) AS AvgRating FROM Review r"
					+ " GROUP BY r.book.bookId HAVING AVG(r.rating) >= 4.0"
					+ " ORDER BY ReviewCount DESC, AvgRating DESC"),
	@NamedQuery(name = "Review.reviewCount", query = "SELECT COUNT(*) FROM Review r WHERE r.book.bookId =: bookId"),
	@NamedQuery(name = "Review.reviewCount5", query = "SELECT COUNT(*) FROM Review r WHERE r.book.bookId =: bookId AND r.rating=5"),
	@NamedQuery(name = "Review.reviewCount4", query = "SELECT COUNT(*) FROM Review r WHERE r.book.bookId =: bookId AND r.rating=4"),
	@NamedQuery(name = "Review.reviewCount3", query = "SELECT COUNT(*) FROM Review r WHERE r.book.bookId =: bookId AND r.rating=3"),
	@NamedQuery(name = "Review.reviewCount2", query = "SELECT COUNT(*) FROM Review r WHERE r.book.bookId =: bookId AND r.rating=2"),
	@NamedQuery(name = "Review.reviewCount1", query = "SELECT COUNT(*) FROM Review r WHERE r.book.bookId =: bookId AND r.rating=1"),
})
@Table(name = "review", catalog = "bookstoredb")
public class Review implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer reviewId;
	private Book book;
	private Customer customer;
	private int rating;
	private String headline;
	private String comment;
	private Date reviewTime;

	public Review() {
	}

	public Review(Book book, Customer customer, int rating, String headline, String comment, Date reviewTime) {
		this.book = book;
		this.customer = customer;
		this.rating = rating;
		this.headline = headline;
		this.comment = comment;
		this.reviewTime = reviewTime;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "review_id", unique = true, nullable = false)
	public Integer getReviewId() {
		return this.reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "book_id", nullable = false)
	public Book getBook() {
		return this.book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer_id", nullable = false)
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Column(name = "rating", nullable = false)
	public int getRating() {
		return this.rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Column(name = "headline", nullable = false, length = 128)
	public String getHeadline() {
		return this.headline;
	}

	public void setHeadline(String headline) {
		this.headline = headline;
	}

	@Column(name = "comment", nullable = false, length = 500)
	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	@Transient
	public String getStars() {
		String result = "";
		int numberOfStartOn = (int) rating;

		for (int i = 1; i <= numberOfStartOn; i++) {
			result += "on,";
		}

		for (int j = numberOfStartOn + 1; j <= 5; j++) {
			result += "off,";
		}

		return result.substring(0, result.length() - 1);
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "review_time", nullable = false, length = 19)
	public Date getReviewTime() {
		return this.reviewTime;
	}

	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}

}
