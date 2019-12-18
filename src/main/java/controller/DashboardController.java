package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MilestoneDAO;
import dao.ModuleDAO;
import dao.ProjectDAO;
import model.Milestone;
import model.Module;
import model.Project;
import model.User;

/**
 * Servlet implementation class DashboardController
 */
@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("user");
		
		ModuleDAO moduleDAO = new ModuleDAO();
		int module_total = moduleDAO.getTotal();
        
        MilestoneDAO milestoneDAO = new MilestoneDAO();
        int milestones_complete = milestoneDAO.getCompleted();
        int milestones_incomplete= milestoneDAO.getIncompleted();
        
        ProjectDAO projectDAO = new ProjectDAO();
        int project_complete = projectDAO.getCompleted();
        int project_incomplete= projectDAO.getIncompleted();
        
        request.setAttribute("total_modules", module_total);
        request.setAttribute("milestones_complete", milestones_complete);
        request.setAttribute("milestones_incomplete", milestones_incomplete);
        request.setAttribute("project_complete", project_complete);
        request.setAttribute("project_incomplete", project_incomplete);
		
		if(user == null) {
			response.sendRedirect("/login");
		}else {
			response.sendRedirect("/index.jsp");
    	}
	}

}
