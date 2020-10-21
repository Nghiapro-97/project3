package com.bookstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customer;

public class CustomerDAOTest {
	private static CustomerDAO customerDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDao=new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDao.close();
	}

	@Test
	public void testCreateCustomer() {
		Customer customer=new Customer();
		customer.setEmail("minhhai@gmail.com");
		customer.setFirstname("Minh");
		customer.setLastname("Hai");
		customer.setCity("Nam Dinh");
		customer.setState("New Yort");
		customer.setCountry("Viet Nam");
		customer.setAddressLine1("Nghia Hung, Nam Dinh");
		customer.setAddressLine2("so 2, quan thu duc, tp.hcm");
		customer.setPassword("123");
		customer.setPhone("1234567898");
		customer.setZipcode("1000000");
		
		Customer saveCustomer=customerDao.create(customer);
		assertTrue(saveCustomer.getCustomerId() > 0);
	}
	
	@Test
	public void testCreateCustomer2() {
		Customer customer=new Customer();
		customer.setEmail("test@gmail.com");
		customer.setFirstname("customer test");
		customer.setCity("Nam Dinh");
		customer.setCountry("Viet Nam");
		customer.setAddressLine1("Nghia Hung, Nam Dinh");
		customer.setPassword("12345");
		customer.setPhone("1234567898");
		customer.setZipcode("1000000");
		
		Customer saveCustomer=customerDao.create(customer);
		assertTrue(saveCustomer.getCustomerId() > 0);
	}

	@Test
	public void testGet() {
		Integer customerId=21;
		Customer customer=customerDao.get(customerId);
		
		assertNotNull(customer);
	}

	@Test
	public void testUpdateCustomer() {
		Customer customer=customerDao.get(21);
		String firstname="Minh";
		customer.setFirstname(firstname);
		Customer updateCustomer=customerDao.update(customer);
		
		assertTrue(updateCustomer.getFirstname().equals(firstname));
	}
	
	@Test
	public void testDeleteCustomer() {
		Integer customerId=21;
		customerDao.delete(customerId);
		Customer customer=customerDao.get(21);
		
		assertNull(customer);
	}
	
	@Test
	public void testListAll() {
		List<Customer> listCustomer= customerDao.listAll();
		
		for (Customer customer : listCustomer) {
			System.out.println(customer.getFirstname());
		}
		
		assertFalse(listCustomer.isEmpty());
	}
	
	@Test
	public void countAll() {
		long totalCustomer = customerDao.count();
		
		assertEquals(5, totalCustomer);
	}
	
	@Test
	public void testFindByEmail() {
		String email= "nhung123@gmail.com";
		Customer customer=customerDao.findByEmail(email);
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckLoginSuccess() {
		String email="minhhai@gmail.com";
		String password="123";
		Customer customer=customerDao.checkLogin(email, password);
		assertNotNull(customer);
	}
	
}
