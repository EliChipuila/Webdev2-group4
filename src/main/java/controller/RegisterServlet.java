package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import dao.UserDAO;
import model.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 2152688902826659767L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        int remember = 1;
        String username = name.split(" ")[0];
        
        User user = new User(name, username, password, email, remember);
        UserDAO userDAO = new UserDAO();
        
        boolean registered = userDAO.registerUser(user);
    	
        if(registered) {
        	request.getRequestDispatcher("login.jsp").forward(request, response);
    	}else {
    		JOptionPane.showMessageDialog(null, "Error registering the user try again");
    	}
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
