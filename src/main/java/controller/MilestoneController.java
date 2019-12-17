package controller;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import dao.MilestoneDAO;
import model.Milestone;
import model.User;
import model.Operations;

/**
 * Servlet implementation class MilestonesController
 */
@WebServlet("/milestone")
public class MilestoneController extends HttpServlet {
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
	
	private void update(HttpServletRequest request, HttpServletResponse response) {
		String completed = request.getParameter("completed");
		int milestone_id = Integer.parseInt(request.getParameter("milestone_id"));
		
		System.out.println("Milestone: " + completed);
		
		if(completed == null) {
			completed = "2";
		}
		
		System.out.println("Milestone: " + completed);
		
		Milestone milestone = new Milestone(Integer.parseInt(completed));      
        MilestoneDAO milestoneDAO = new MilestoneDAO();
        milestone.setCompleted(Integer.parseInt(completed));
        milestone.setId(milestone_id);
        
        boolean registered = milestoneDAO.updateMilestone(milestone);
        
        if(registered) {
        	try {
        		response.sendRedirect("/project");
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}else {
    		JOptionPane.showMessageDialog(null, "Error registering the user try again");
    	}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			resp.sendRedirect("/login");
		}else {	        
	        resp.sendRedirect("/project");		
		}
	}
	
	private void remove(HttpServletRequest request, HttpServletResponse response) {
		int milestone_id = Integer.parseInt(request.getParameter("milestone_id"));
		
		Milestone milestone = new Milestone();      
        MilestoneDAO milestoneDAO = new MilestoneDAO();
        milestone.setId(milestone_id);
        
        boolean removed = milestoneDAO.removeMilestone(milestone);
        
        if(removed) {
        	try {
        		response.sendRedirect("/project");
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
        int user_id = user.getId();
        int completed = 0;
        int status_id = 1;
        int project_id = Integer.parseInt(request.getParameter("project_id"));
        String completionDate = request.getParameter("completionDate");
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // your template here
        java.util.Date completionDateSQL = null;
        
		try {
			completionDateSQL = formatter.parse(completionDate);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
        Milestone milestone = new Milestone(name, status_id, 0, project_id , new java.sql.Date(completionDateSQL.getTime()));      
        MilestoneDAO milestoneDAO = new MilestoneDAO();
                
        boolean registered = milestoneDAO.registerMilestone(milestone);

        if(registered) {
        	try {
        		response.sendRedirect("/project");
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}else {
    		JOptionPane.showMessageDialog(null, "Error registering the user try again");
    	}
	}
}
