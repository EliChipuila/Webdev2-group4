package controller;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 5876378905741836199L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String email = request.getParameter("email");
    	String password = request.getParameter("password");
    	
    	UserDAO userDAO = new UserDAO();
    	User user = new User();
    	user.setPasswordEncryption(password);
    	user.setEmail(email);
    	
    	user = userDAO.getUser(user.getEmail(), user.getPassword());
    	
    	if(user != null) {
	    	HttpSession session=request.getSession();
	        session.setAttribute("user", user);
	    	response.sendRedirect("/dashboard");
    	}else {
    		response.sendRedirect("/login");
    	}
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
