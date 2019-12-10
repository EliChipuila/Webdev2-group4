package controller;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.catalina.connector.Response;

import dao.ModuleDAO;
import dao.UserDAO;
import model.Module;
import model.User;
import model.Operations;

/**
 * Servlet implementation class ModuleController
 */
@WebServlet("/module")
public class ModuleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			response.sendRedirect("/login");
		}else {
			int operation = Integer.parseInt(request.getParameter("operation"));
//	        int id = Integer.parseInt(request.getParameter("id"));
	        
	        System.out.println(request.getParameter("id"));
	        
	        if(operation == Operations.CREATE.ordinal()) {
	        	create(request, response);
	        }else if(operation == Operations.REMOVE.ordinal()) {
	        	remove(request, response);
	        }else if(operation == Operations.UPDATE.ordinal()) {
	        	update(request, response);
	        }
        }
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			resp.sendRedirect("/login");
		}else {
			Operations enOp = (Operations) session.getAttribute("operation");
			int operation = 0;
			
			if(enOp == null) {
				operation = Integer.parseInt(req.getParameter("operation"));
			}else {
				operation = enOp.ordinal();
			}
			
			if(operation == Operations.CREATE.ordinal()) {
				ModuleDAO moduleDAO = new ModuleDAO();
		        ArrayList<Module> modules = moduleDAO.getModules();
		        
		        session.setAttribute("modules", modules);
//		        session.setAttribute("operation", Operations.VIEW);
		        
		        req.getRequestDispatcher("create_module.jsp").forward(req, resp);
	        }else {
	        	String str[] = req.getHeader("referer").split("/");
	        	resp.sendRedirect(""+str[str.length-1].toString());
	        }
		}
	}
	
	private void remove(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	private void create(HttpServletRequest request, HttpServletResponse response) {
		
		String name = request.getParameter("name");
        String description = request.getParameter("description");
        int id = Integer.parseInt(request.getParameter("id"));
        
        Module module = new Module(name, description, 1, id);      
        ModuleDAO moduleDAO = new ModuleDAO();
        boolean registered = moduleDAO.registerModule(module);
        
        HttpSession session=request.getSession();
        
        ArrayList<Module> modules = moduleDAO.getModules();
        
        session.setAttribute("modules", modules);
        session.setAttribute("operation", Operations.VIEW);
        
        if(registered) {
        	try {
				request.getRequestDispatcher("create_module.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}else {
    		JOptionPane.showMessageDialog(null, "Error registering the user try again");
    	}
        
	}
}
