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
import dao.ProjectDAO;
import dao.UserDAO;
import model.Module;
import model.User;
import model.Operations;
import model.Project;

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
			ModuleDAO moduleDAO = new ModuleDAO();
	        ArrayList<Module> modules = moduleDAO.getModules(user.id);
	        
	        session.setAttribute("modules", modules);
	        req.getRequestDispatcher("create_module.jsp").forward(req, resp);
		}
	}
	
	private void remove(HttpServletRequest request, HttpServletResponse response) {
		int module_id = Integer.parseInt(request.getParameter("module_id"));
		
		Module module = new Module();
		ModuleDAO moduleDAO = new ModuleDAO();
        
		module.setId(module_id);
        boolean removed = moduleDAO.removeModule(module);
        
        if(removed) {
        	try {
				response.sendRedirect("/module");
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}else {
    		JOptionPane.showMessageDialog(null, "Error registering the user try again");
    	}
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		
		String name = request.getParameter("name");
        String description = request.getParameter("description");
		int id = Integer.parseInt(request.getParameter("id"));
		
        Module module = new Module(id, name, description, 1, user.getId());      
        ModuleDAO moduleDAO = new ModuleDAO();
        boolean updated = moduleDAO.updateModule(module);
        
        ArrayList<Module> modules = moduleDAO.getModules(user.id);
        
        session.setAttribute("modules", modules);
        session.setAttribute("operation", Operations.VIEW);
        
        if(updated) {
        	try {
				request.getRequestDispatcher("create_module.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}else {
    		JOptionPane.showMessageDialog(null, "Error registering the user try again");
    	}
	}
	
	private void create(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		
		String name = request.getParameter("name");
        String description = request.getParameter("description");
        
        Module module = new Module(name, description, 1, user.getId());      
        ModuleDAO moduleDAO = new ModuleDAO();
        boolean registered = moduleDAO.registerModule(module);
        
        ArrayList<Module> modules = moduleDAO.getModules(user.id);
        
        session.setAttribute("modules", modules);
        session.setAttribute("operation", Operations.VIEW);
        
        if(registered) {
        	try {
				request.getRequestDispatcher("create_module.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}else {
    		JOptionPane.showMessageDialog(null, "Error registering the user try again");
    	}
        
	}
}
