package controller;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.catalina.connector.Response;

import dao.MilestoneDAO;
import dao.ModuleDAO;
import dao.ProjectDAO;
import model.Project;
import model.User;
import model.Milestone;
import model.Module;
import model.Operations;

/**
 * Servlet implementation class ProjectController
 */
@WebServlet("/project")
public class ProjectController extends HttpServlet {
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

			int operation = -1;
			
			if(req.getParameter("operation") != null)
				operation = Integer.parseInt(req.getParameter("operation"));
			
			ModuleDAO moduleDAO = new ModuleDAO();
	        ArrayList<Module> modules = moduleDAO.getModules(user.id);
	        
	        MilestoneDAO milestoneDAO = new MilestoneDAO();
	        ArrayList<Milestone> milestones = milestoneDAO.getMilestones();
	        
			if(operation == Operations.PROJECTS_BY_MODULE.ordinal()) {
				int modules_id = Integer.parseInt(req.getParameter("modules_id"));
				
				ProjectDAO projectDAO = new ProjectDAO();
		        ArrayList<Project> projects = projectDAO.getProjectsByModuleId(modules_id);
				
		        session.setAttribute("milestones", milestones);
		        session.setAttribute("modules", modules);
		        session.setAttribute("projects", projects);
		        
		        req.getRequestDispatcher("project.jsp").forward(req, resp);
	        }else { 
	        	ProjectDAO projectDAO = new ProjectDAO();
		        ArrayList<Project> projects = projectDAO.getProjectsByUserId(user.id);
		        
		        session.setAttribute("milestones", milestones);

			Operations enOp = (Operations) session.getAttribute("operation");
			int operation = 0;
			
			if(enOp == null) {
				operation = Integer.parseInt(req.getParameter("operation"));
			}else {
				operation = enOp.ordinal();
			}
			
			if(operation == Operations.CREATE.ordinal()) {
		        ModuleDAO moduleDAO = new ModuleDAO();
		        ArrayList<Module> modules = moduleDAO.getModules(user.id);
		        
		        ProjectDAO projectDAO = new ProjectDAO();
		        ArrayList<Project> projects = projectDAO.getProjectsByUserId(user.id);
		        

		        session.setAttribute("modules", modules);
		        session.setAttribute("projects", projects);
		        
		        req.getRequestDispatcher("project.jsp").forward(req, resp);

	        }		

	        }else {
	        	String str[] = req.getHeader("referer").split("/");
	        	resp.sendRedirect(""+str[str.length-1].toString());
	        }

		}
	}
	
	private void remove(HttpServletRequest request, HttpServletResponse response) {

		int project_id = Integer.parseInt(request.getParameter("project_id"));
		
		Project project = new Project();
        ProjectDAO projectDAO = new ProjectDAO();
        
        project.setId(project_id);
        boolean updated = projectDAO.removeProject(project);
        
        if(updated) {
        	try {
				response.sendRedirect("/project");
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}else {
    		JOptionPane.showMessageDialog(null, "Error registering the user try again");
    	}
	}
	
	private void getProjectByModule(HttpServletRequest request, HttpServletResponse response) {
		int modules_id = Integer.parseInt(request.getParameter("modules_id"));
		
		ProjectDAO projectDAO = new ProjectDAO();
		ArrayList<Project> projects = projectDAO.getProjectsByModuleId(modules_id);
        
        

	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		

		int project_id = Integer.parseInt(request.getParameter("project_id"));

		String name = request.getParameter("name");
        String completionDate = request.getParameter("completionDate");
        String intendedDate = request.getParameter("intendedDate");
        String description = request.getParameter("description");
        int user_id = user.id;

        int status_id = 1;
        int module_id = Integer.parseInt(request.getParameter("modules_id"));
        String completed = request.getParameter("completed");
		
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // your template here
        java.util.Date completionDateSQL = null;
        java.util.Date intendedDateSQL = null;
        
		try {
			completionDateSQL = formatter.parse(completionDate);
			intendedDateSQL   = formatter.parse(intendedDate);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		if(completed == null) {
			completed = "0";
		}
        
		Project project = new Project(project_id, description, name, new java.sql.Date(completionDateSQL.getTime()), new java.sql.Date(intendedDateSQL.getTime()), user_id, Integer.parseInt(completed), status_id, module_id);
        ProjectDAO projectDAO = new ProjectDAO();
        boolean updated = projectDAO.updateProject(project);
        
        if(updated) {
        	try {
				response.sendRedirect("/project");

        int completed = 0;
        int status_id = 1;
        int module_id = Integer.parseInt(request.getParameter("module_id"));
		
		Project project = new Project(name, description, completionDate, intendedDate, user_id, completed, status_id, module_id);
		
        ProjectDAO projectDAO = new ProjectDAO();
        boolean updated = projectDAO.updateProject(project);
        
        ArrayList<Project> projects = projectDAO.getProjects(user.id);
        
        session.setAttribute("projects", projects);
        session.setAttribute("operation", Operations.VIEW);
        
        if(updated) {
        	try {
				request.getRequestDispatcher("project.jsp").forward(request, response);
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

        int user_id = user.getId();
        int completed = 0;
        int status_id = 1;
        int module_id = Integer.parseInt(request.getParameter("modules_id"));

        String completionDate = request.getParameter("completionDate");
        String intendedDate = request.getParameter("intendedDate");
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // your template here
        java.util.Date completionDateSQL = null;
        java.util.Date intendedDateSQL = null;;
        
		try {
			completionDateSQL = formatter.parse(completionDate);
			intendedDateSQL = formatter.parse(intendedDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
        Project project = new Project(name, description, new java.sql.Date(completionDateSQL.getTime()), new java.sql.Date(intendedDateSQL.getTime()), user_id, completed, status_id, module_id);      
        ProjectDAO projectDAO = new ProjectDAO();
                
        boolean registered = projectDAO.registerProject(project);
        
        if(registered) {
        	try {
				response.sendRedirect("/project");
			} catch (IOException e) {

        String completionDate = request.getParameter("completionDate");
        String intendedDate = request.getParameter("intendedDate");
        int user_id = user.id;
        int completed = 0;
        int status_id = 1;
        int module_id = Integer.parseInt(request.getParameter("modules_id"));
        
//      this.id = id;
//		this.name = name;
//		this.completionDate = completionDate;
//		this.intendedDate = intendedDate;
//		this.user_id = user_id;
//		this.completed = completed;
//		this.status_id = status_id;
//		this.modules_id = modules_id;
        
        Project project = new Project(name, description, completionDate, intendedDate, user_id, completed, status_id, module_id);      
        ProjectDAO projectDAO = new ProjectDAO();
        boolean registered = projectDAO.registerProject(project);
        
        ArrayList<Project> projects = projectDAO.getProjects(module_id);
        
        session.setAttribute("projects", projects);
        session.setAttribute("operation", Operations.VIEW);
        
        if(registered) {
        	try {
				request.getRequestDispatcher("project.jsp").forward(request, response);
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
