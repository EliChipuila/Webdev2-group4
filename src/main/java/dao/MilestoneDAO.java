package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import db.MysqlCon;
import model.Milestone;
import model.Milestone;
import model.Module;

public class MilestoneDAO {
	private MysqlCon msCon;
	
	public MilestoneDAO() {
		msCon = new MysqlCon("webcw", "root", "");
	}
	
	public boolean registerMilestone(Milestone milestone) {
		try {
			String sql = "INSERT INTO milestones(name, completed, projects_id, completionDate, status_id) VALUES(?, ?, ?, ?, ?)";
		    PreparedStatement pstmt = msCon.getPreparedStatement(sql);
		    
	        pstmt.setString(1, milestone.getName());
	        pstmt.setInt(2, milestone.getCompleted());
	        pstmt.setInt(3, milestone.getProjects_id());
	        pstmt.setDate(4, milestone.getCompletionDate());
	        pstmt.setInt(5, milestone.getStatus_id());
	        
	        pstmt.executeUpdate();	    
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
		}
		
		return true;
	}
	
	public ArrayList<Milestone> getMilestones(int project_id){
		ArrayList<Milestone> milestones = new ArrayList<Milestone>();
		Milestone milestone;
		
		try {
			String sql = "SELECT * FROM milestones WHERE projects_id='"+project_id+"'";
			
		    Statement statement = msCon.getStatement();
		    ResultSet results = statement.executeQuery(sql);
		    milestone = new Milestone();
		    
		    while (results.next()) {
		    	milestone =  new Milestone();
		    	milestone.setId(results.getInt("id"));
		    	milestone.setName(results.getString("name"));
		    	milestone.setCompleted(results.getInt("completed"));
		    	milestone.setProjects_id(results.getInt("projects_id"));
		    	milestone.setCompletionDate(results.getDate("completionDate"));
		    	
		    	milestones.add(milestone);
		    }
		    
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return milestones;
	}
	
	public ArrayList<Milestone> getMilestones(){
		ArrayList<Milestone> milestones = new ArrayList<Milestone>();
		Milestone milestone;
		
		try {
			String sql = "SELECT * FROM milestones ORDER BY id DESC";
		    Statement statement = msCon.getStatement();
		    ResultSet results = statement.executeQuery(sql);
		    milestone = new Milestone();
		    
		    while (results.next()) {
		    	
		    	milestone =  new Milestone();
		    	
		    	milestone.setId(results.getInt("id"));
		    	milestone.setName(results.getString("name"));
		    	milestone.setCompleted(results.getInt("completed"));
		    	milestone.setProjects_id(results.getInt("projects_id"));
		    	milestone.setCompletionDate(results.getDate("completionDate"));
		    	milestone.setStatus_id(results.getInt("status_id"));
		    	
		    	milestones.add(milestone);
		    }
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return milestones;
	}

	public boolean updateMilestone(Milestone milestone) {
		String sql = "UPDATE milestones SET completed = ? WHERE id = ?";
		
		System.out.println(milestone.toString());
		
		try {
		    PreparedStatement pstmt = msCon.getPreparedStatement(sql);
		    
		    pstmt.setInt(1, milestone.getCompleted());
	        pstmt.setInt(2, milestone.getId());
	        
            pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {}
	    
		return true;
	}

	public boolean removeMilestone(Milestone milestone) {
		String sql = "DELETE FROM milestones WHERE id = ?";
		
		try {
		    PreparedStatement pstmt = msCon.getPreparedStatement(sql);
	        pstmt.setInt(1, milestone.getId());
	        
            pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {}
	    
		return true;
	}

	public int getCompleted() {
		int total = 0;
		
		try {
    		String sql = "SELECT COUNT(*) as total FROM milestones WHERE completed=1";
		    Statement statement = msCon.getStatement();
		    
		    ResultSet results = statement.executeQuery(sql);
		    
		    while (results.next()) {
			    total = results.getInt("total");
		    }
		    
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return total;
	}

	public int getIncompleted() {
		int total = 0;
		
		try {
    		String sql = "SELECT COUNT(*) as total FROM milestones WHERE completed!=1";
		    Statement statement = msCon.getStatement();
		    
		    ResultSet results = statement.executeQuery(sql);
		    
		    while (results.next()) {
			    total = results.getInt("total");
		    }
		    
		    System.out.println(total);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return total;
	}
}
