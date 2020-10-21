package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Category;

public class CategoryDAOTest {
	
	private static CategoryDAO categoryDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		categoryDao = new CategoryDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		categoryDao.close();
	}

	@Test
	public void testCreateCategory() {
		Category newCate = new Category("health");
		Category category=categoryDao.create(newCate);
		
		assertTrue(category != null && category.getCategoryId() > 0);
	}

	@Test
	public void testUpdateCategory() {
		Category cat = new Category("core java");
		cat.setCategoryId(35);
		
		Category category=categoryDao.update(cat);
		
		assertEquals(cat.getName(), category.getName());
	}

	@Test
	public void testGet() {
		Integer catagoryId=35;
		Category category=categoryDao.get(catagoryId);
		assertNotNull(category);
	}

	@Test
	public void testDeleteCatagory() {
		Integer catagoryId=35;
		categoryDao.delete(catagoryId);
		Category category=categoryDao.get(catagoryId);
		assertNull(category);
	}

	@Test
	public void testListAll() {
		List<Category> listCata = categoryDao.listAll();
		listCata.forEach(c -> System.out.println(c.getName() + ", "));
		assertTrue(listCata.size() > 0);
	}

	@Test
	public void testCount() {
		long totalCatagory=categoryDao.count();
		assertTrue(totalCatagory > 0);
	}
	
	@Test
	public void testFindByName() {
		String name="java core";
		Category category=categoryDao.findByName(name);
		assertNotNull(category);
	}

}
