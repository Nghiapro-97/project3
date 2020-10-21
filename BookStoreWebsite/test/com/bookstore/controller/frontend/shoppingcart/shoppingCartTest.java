package com.bookstore.controller.frontend.shoppingcart;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;

public class shoppingCartTest {
	private static ShoppingCart cart;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		cart=new ShoppingCart();
		Book book = new Book(32);
		book.setPrice(10);
		
		cart.addItem(book);
		cart.addItem(book);
	}


	@Test
	public void testAddItem() {
		Map<Book, Integer> items=cart.getItems();
		int quatity=items.get(new Book(32));
		
		assertEquals(2, quatity);
	}
	
	@Test
	public void testRemoveItems() {
		cart.removeItems(new Book(32));
		
		assertTrue(cart.getItems().isEmpty());
	}
	
	@Test
	public void testRemoveItems2() {
		Book book2=new Book(33);
		cart.addItem(book2);
		cart.removeItems(new Book(33));
		
		assertNull(cart.getItems().get(book2));
	}

	@Test
	public void testGetTotalQuantity() {
		Book book3=new Book(34);
		cart.addItem(book3);
		cart.addItem(book3);
		cart.addItem(book3);
		
		assertEquals(5, cart.getTotalQuantity());
	}
	
	@Test
	public void testGetTotalAmount1() {
		ShoppingCart cart = new ShoppingCart();
		assertEquals(0.0f, cart.getTotalAmount(), 0.0f);
	}
	
	@Test
	public void testGetTotalAmount2() {
		assertEquals(20.0f, cart.getTotalAmount(), 0.0f);
	}
	
	@Test
	public void testClear() {
		cart.clear();
		
		assertEquals(0, cart.getTotalQuantity());
	}
	
	@Test
	public void testUpdateCart() {
		ShoppingCart cart = new ShoppingCart();
		Book book1 = new Book(32);
		Book book2 = new Book(33);
		
		cart.addItem(book1);
		cart.addItem(book2);
		
		int[] bookIds = {32,33};
		int[] quantitys = {3,4};
		
		cart.updateCart(bookIds, quantitys);

		assertEquals(7, cart.getTotalQuantity());
	}
	
}
