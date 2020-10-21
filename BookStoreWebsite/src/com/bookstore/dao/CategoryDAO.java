package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Category;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

	public CategoryDAO() {
	}

	@Override
	public Category create(Category category) {
		return super.create(category);
	}

	@Override
	public Category update(Category category) {
		return super.update(category);
	}

	@Override
	public Category get(Object catagoryId) {
		return super.find(Category.class, catagoryId);
	}

	@Override
	public void delete(Object catagoryId) {
		super.delete(Category.class, catagoryId);
		
	}

	@Override
	public List<Category> listAll() {
		return super.findWithNamedQuery("Category.findAll");
	}

	@Override
	public long count() {
		return super.countWithNameQuery("Category.countAll");
	}
	
	public Category findByName(String name) {
		List<Category> listCategories = super.findWithNamedQuery("Category.findByName", "name", name);
		if (listCategories != null && listCategories.size() > 0) {
			return listCategories.get(0);
		}
		return null;
	}

}
