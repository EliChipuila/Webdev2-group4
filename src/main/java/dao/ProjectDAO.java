package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.MysqlCon;
import model.Module;
import model.Project;

public class ProjectDAO {
private MysqlCon msCon;
	
	public ProjectDAO() {
		msCon = new MysqlCon("webdevcw", "root", "");
	}
	
	public boolean registerProject(Project project) {
		try {
    		String sql = "INSERT INTO projects(name, completed, status_id, modules_id, completionDate, intendedDate, description) VALUES(?, ?, ?, ?, ?, ?, ?)";
		    PreparedStatement pstmt = msCon.getPreparedStatement(sql);
		    
            pstmt.setString(1, project.getName());
            pstmt.setInt(2, project.getCompleted());
            pstmt.setInt(3, project.getStatus_id());
            pstmt.setInt(4, project.getModules_id());
            pstmt.setString(5, project.getCompletionDate());
            pstmt.setString(6, project.getIntendedDate());
            pstmt.setString(7, project.getDescription());
            
            pstmt.executeUpdate();	    
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
//			msCon.close();
		}
		
		return true;
	}
	
	public ArrayList<Project> getProjects(int modules_id){
		ArrayList<Project> projects = new ArrayList<Project>();
		Project project = null;
		
		try {
    		String sql = "SELECT * FROM projects WHERE modules_id='"+modules_id+"'";
    		
		    Statement statement = msCon.getStatement();
		    ResultSet results = statement.executeQuery(sql);
		    
		    while (results.next()) {
		    	project = new Project();
		    	
				project.setName(results.getString("name"));
				project.setCompleted(Integer.parseInt(results.getString("completed")));
				project.setId(results.getInt("id"));
				project.setStatus_id(results.getInt("status_id"));
				project.setModules_id(results.getInt("modules_id"));
				project.setCompletionDate(results.getString("completionDate"));
				project.setIntendedDate(results.getString("intendedDate"));
				project.setDescription(results.getString("description"));
				
				projects.add(project);
		    }
		    
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return projects;
	}
	
	public ArrayList<Project> getProjectsByUserId(int user_id){
		ArrayList<Project> projects = new ArrayList<Project>();
		Project project = null;
		
		try {
    		String sql = "SELECT * FROM projects WHERE user_id='"+user_id+"'";
    		
		    Statement statement = msCon.getStatement();
		    ResultSet results = statement.executeQuery(sql);
		    
		    while (results.next()) {
		    	project = new Project();
		    	
				project.setName(results.getString("name"));
				project.setCompleted(Integer.parseInt(results.getString("completed")));
				project.setId(results.getInt("id"));
				project.setStatus_id(results.getInt("status_id"));
				project.setModules_id(results.getInt("modules_id"));
				project.setCompletionDate(results.getString("completionDate"));
				project.setIntendedDate(results.getString("intendedDate"));
				project.setIntendedDate(results.getString("description"));
				
				projects.add(project);
		    }
		    
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return projects;
	}
	
	public boolean updateProject(Project project) {
		try {
			String sql = "UPDATE projects SET name = ?, completionDate = ?, intendedDate = ?, completed = ?, modules_id = ?, description= ? WHERE id = ?";
			
			PreparedStatement pstmt = msCon.getPreparedStatement(sql);
		    
		    pstmt.setString(1, project.getName());
		    pstmt.setString(2, project.getCompletionDate());
		    pstmt.setString(3, project.getIntendedDate());
            pstmt.setInt(4, project.getCompleted());
            pstmt.setInt(5, project.getModules_id());
            pstmt.setString(5, project.getDescription());
            
            pstmt.setInt(6, project.getId());
		    
            pstmt.executeUpdate();	    
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
//			msCon.close();
		}
		
		return true;
	}
	
	public Project getProject(int id) {
		Project project;
		
		try {
    		String sql = "SELECT * FROM projects WHERE id='"+id+"'";
		    Statement statement = msCon.getStatement();
		    
		    ResultSet results = statement.executeQuery(sql);
		    project = new Project();
		    
		    while (results.next()) {
		    	project.setName(results.getString("name"));
				project.setCompleted(Integer.parseInt(results.getString("description")));
				project.setId(results.getInt("id"));
				project.setStatus_id(results.getInt("status_id"));
				project.setModules_id(results.getInt("modules_id"));
				project.setCompletionDate(results.getString("completionDate"));
				project.setIntendedDate(results.getString("intendedDate"));
				project.setDescription(results.getString("description"));
		    }
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return project;
	}					
}
