package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Users;

public class UserServices {
	private UserDAO userDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public UserServices(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
		userDAO=new UserDAO();
	}
	
	public void listUser() throws ServletException, IOException {
		listUser(null);
	}
	
	public void listUser(String message) throws ServletException, IOException {
		List<Users> listUsers=userDAO.listAll();
		
		request.setAttribute("listUsers", listUsers);
		
		if (message != null) {
			request.setAttribute("message", message);
		}
		
		String listPage="user_list.jsp";
		RequestDispatcher requestDispatcher=request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}
	
	public void CreateUser() throws ServletException, IOException {
		String email=request.getParameter("email");
		String fullName=request.getParameter("fullName");
		String password=request.getParameter("password");
		
		Users existUser=userDAO.findByEmail(email);
		if (existUser != null) {
			String message="Could not create user. A user with email " + email + " already exist!";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		} else {
			Users newUser = new Users(email,fullName,password);
			userDAO.create(newUser);
			listUser("Create new user successfully!!!");
		}
		
	}

	public void editUser() throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("id"));
		Users user=userDAO.get(userId);
		
		String editPage="user_form.jsp";
		request.setAttribute("user", user);
		
		RequestDispatcher requestDispatcher=request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateUser() throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("userId"));
		String email=request.getParameter("email");
		String fullName=request.getParameter("fullName");
		String password=request.getParameter("password");
		
		Users userById=userDAO.get(userId);
		Users userByEmail=userDAO.findByEmail(email);
		if (userByEmail != null && userByEmail.getUserId() != userById.getUserId()) {
			String message="Count not update user. A user with email " + email + " already exist!";
			request.setAttribute("message", message);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		} else {
			Users user=new Users(userId,email,fullName,password);
			userDAO.update(user);
			
			String message="Update user successfully!!!";
			listUser(message);
		}
		
	}

	public void deleteUser() throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("id"));
		userDAO.delete(userId);
		
		String message="User has been deleted successfully!!!";
		listUser(message);
	}

	public void login() throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		boolean loginResult=userDAO.checkLogin(email, password);
		if (loginResult) {
			String[] parts = email.split("@");
			request.getSession().setAttribute("useremail", parts[0]);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/admin/");
			requestDispatcher.forward(request, response);
			
		} else {
			String message="Login Fail! please check your email or password.";
			request.setAttribute("message", message);
			
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
