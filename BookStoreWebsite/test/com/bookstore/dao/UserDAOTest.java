package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

public class UserDAOTest {
	private static UserDAO userDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception{
		userDAO = new UserDAO();
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		userDAO.close();
	}

	@Test
	public void testCreateUsers() {
		Users u1 = new Users();
		u1.setEmail("nhung@gmail.com");
		u1.setFullName("Doan Nhung");
		u1.setPassword("12345678");

		u1 = userDAO.create(u1);

		assertTrue(u1.getUserId() > 0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldNotSet() {
		Users u1 = new Users();
		u1 = userDAO.create(u1);
	}
	
	@Test
	public void testUpdateUsers() {
		Users u1 = new Users();
		u1.setUserId(32);
		u1.setEmail("nghiauser0@gmail.com");
		u1.setFullName("Nghia Doan");
		u1.setPassword("1234nghia");

		u1 = userDAO.update(u1);
		String expected="1234nghia";
		String actual=u1.getPassword();

		assertEquals(expected, actual);
	}
	
	@Test
	public void testGetUserFound() {
		Integer userId=1;
		Users users=userDAO.get(userId);
		if (users != null) {
			System.out.println(users.getEmail());
		}
		assertNotNull(users);
	}
	
	@Test
	public void testGetUserNotFound() {
		Integer userId=100;
		Users users=userDAO.get(userId);
		assertNull(users);
	}
	
	@Test
	public void testDeleteUser() {
		Integer userId=33;
		userDAO.delete(userId);
		
		Users users=userDAO.get(userId);
		assertNull(users);
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void testDeletNonExitUser() {
		Integer userId=33;
		userDAO.delete(userId);
	}
	
	@Test
	public void testListAll() {
		List<Users> listUser = userDAO.listAll();
		
		for (Users users : listUser) {
			System.out.println(users.getEmail());
		}
		
		assertTrue(listUser.size() > 0);
	}
	
	@Test
	public void testCount() {
		long totalUser = userDAO.count();
		assertTrue(totalUser > 0);
	}
	
	@Test
	public void testFindByEmail() {
		String email="ronado@gmail.com";
		Users user=userDAO.findByEmail(email);
		assertNotNull(user);
	}
	
	@Test
	public void testcheckLoginSuccess() {
		String email="ronado@gmail.com";
		String password="12345";
		boolean loginResul= userDAO.checkLogin(email, password);
		
		assertNotNull(loginResul);
	}
	
	@Test
	public void testcheckLoginFail() {
		String email="ronado@gmail.com";
		String password="12";
		boolean loginResul= userDAO.checkLogin(email, password);
		
		assertFalse(loginResul);
	}

}
