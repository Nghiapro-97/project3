package com.bookstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

public class OrderDAOTest {
	private static OrderDAO orderDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDao = new OrderDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDao.close();
	}

	@Test
	public void testCreateBookOrder1() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(18);
		
		order.setCustomer(customer);
		order.setFirstname("minh");
		order.setLastname("hai");
		order.setPhone("1234567891");
		order.setCity("TP.HCM");
		order.setState("Tan Binh");
		order.setZipcode("1000007");
		order.setCountry("US");
		order.setPaymentMethod("Cash on delivery");
		order.setAddressLine1("Thu Duc, TP.HCM");
		order.setAddressLine2("Binh Duong, TP.Thu Dau Mot");
		
		Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();
		OrderDetail orderDetail = new OrderDetail();
		
		Book book = new Book(34);
		orderDetail.setBook(book);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(77.74f);
		orderDetail.setBookOrder(order);
		
		orderDetails.add(orderDetail);
		
		order.setOrderDetails(orderDetails);
		order.setTax(6.8f);
		order.setShippingFee(2.0f);
		order.setSubtotal(68.5f);
		order.setTotal(78.9f);
		
		BookOrder saveOrder = orderDao.create(order);
		
		assertTrue(saveOrder != null && saveOrder.getOrderDetails().size() > 0);
	}
	
	@Test
	public void testCreateBookOrder2() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(12);
		
		order.setCustomer(customer);
		order.setFirstname("Hong Nhung");
		order.setPhone("01672074734");
		order.setPaymentMethod("cash");
		order.setAddressLine1("Thu Duc, TP.HCM");
		
		Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();
		OrderDetail orderDetail1 = new OrderDetail();
		Book book1 = new Book(33);
		orderDetail1.setBook(book1);
		orderDetail1.setQuantity(2);
		orderDetail1.setSubtotal(73.44f);
		orderDetail1.setBookOrder(order);
		orderDetails.add(orderDetail1);
		
		OrderDetail orderDetail2 = new OrderDetail();
		Book book2 = new Book(34);
		orderDetail2.setBook(book2);
		orderDetail2.setQuantity(1);
		orderDetail2.setSubtotal(33.99f);
		orderDetail2.setBookOrder(order);
		orderDetails.add(orderDetail2);
		
		order.setOrderDetails(orderDetails);
		
		BookOrder saveOrder = orderDao.create(order);
		
		assertTrue(saveOrder != null && saveOrder.getOrderDetails().size() > 0);
	}

	@Test
	public void testUpdateBookOrderShippingAddress() {
		Integer orderId=36;
		BookOrder order=orderDao.get(orderId);
		order.setPaymentMethod("paypal");;
		
		orderDao.update(order);
		
		BookOrder updateOrder=orderDao.get(orderId);
		
		assertEquals(order.getAddressLine1(), updateOrder.getAddressLine1());
	}
	
	@Test
	public void testUpdateBookOrderDetail() {
		Integer orderId=23;
		BookOrder order=orderDao.get(orderId);
	
		Iterator<OrderDetail> iterator=order.getOrderDetails().iterator();
		while (iterator.hasNext()) {
			OrderDetail orderDetail=iterator.next();
			if (orderDetail.getBook().getBookId() == 32) {
				orderDetail.setQuantity(3);
				orderDetail.setSubtotal(116.61f);
			}
		}
		
		orderDao.update(order);
		
		iterator=order.getOrderDetails().iterator();
		int expectedQuantity=3;
		float expectedSubtotal=(float) 116.61;
		int actualQuantity=0;
		float actualSubtotal=0;
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail=iterator.next();
			if (orderDetail.getBook().getBookId() == 32) {
				actualQuantity=orderDetail.getQuantity();
				actualSubtotal=orderDetail.getSubtotal();
			}
		}
		
		assertEquals(expectedQuantity, actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal, 0.0f);
	}

	@Test
	public void testGet() {
		Integer orderId=36;
		BookOrder order=orderDao.get(orderId);
		
		assertEquals(1, order.getOrderDetails().size());
	}
	
	@Test
	public void testGetByIdAndCustomerNull() {
		Integer orderId=24;
		Integer customerId=99;
		BookOrder order=orderDao.get(orderId,customerId);
		
		assertNull(order);
	}
	
	@Test
	public void testGetByIdAndCustomerNotNull() {
		Integer orderId=24;
		Integer customerId=12;
		BookOrder order=orderDao.get(orderId,customerId);
		
		assertNotNull(order);
	}

	@Test
	public void testDeleteOrder() {
		Integer orderId=35;
		orderDao.delete(orderId);
		
		BookOrder order=orderDao.get(orderId);
		assertNull(order);
	}

	@Test
	public void testListAll() {
		List<BookOrder> listOrders=orderDao.listAll();
		for (BookOrder order : listOrders) {
			System.out.println(order.getOrderId() + " - " + order.getCustomer().getFirstname() + " - " 
								+ order.getTotal() + " - " + order.getStatus());
			for (OrderDetail detail : order.getOrderDetails()) {
				Book book=detail.getBook();
				int quantity=detail.getQuantity();
				float subtotal=detail.getSubtotal();
				System.out.println("\t" + book.getTitle() + " - " + quantity + " - " + subtotal);
			}
		}
		
		assertTrue(listOrders.size() > 0);
	}

	@Test
	public void testCount() {
		long total=orderDao.count();
		assertEquals(2, total);
	}

	@Test
	public void testListByCustomerNoOrder() {
		Integer customerId = 100;
		List<BookOrder> listOrders= orderDao.listByCustomers(customerId);
		
		assertTrue(listOrders.isEmpty());
	}
	
	@Test
	public void testListByCustomerHaveOrder() {
		Integer customerId = 12;
		List<BookOrder> listOrders= orderDao.listByCustomers(customerId);
		
		assertTrue(listOrders.size() > 0);
	}
	
	@Test
	public void testListMostRecentSales() {
		List<BookOrder> recentOrders= orderDao.listMostRecentSales();
		
		assertEquals(3, recentOrders.size());
	}
}
