package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.MysqlCon;
import model.Milestones;
import model.Module;

public class MilestoneDAO {
	private MysqlCon msCon;
	
	public MilestoneDAO() {
		msCon = new MysqlCon("webdevcw", "root", "");
	}
	
//	public boolean registerMilestone(Milestones milestones) {
//	try {
//		String sql = "INSERT INTO modules(name, description, status_id, user_id) VALUES(?, ?, ?, ?)";
//	    PreparedStatement pstmt = msCon.getPreparedStatement(sql);
//	    
//        pstmt.setString(1, module.getName());
//        pstmt.setString(2, module.getDescription());
//        pstmt.setInt(3, module.getStatus_id());
//        pstmt.setInt(4, module.getUser_id());
//        
//        pstmt.executeUpdate();	    
//	} catch (Exception e) {
//		e.printStackTrace();
//		return false;
//	}finally {
////		msCon.close();
//	}
//	
//	return true;
//}

	public ArrayList<Milestones> getModules(){
		ArrayList<Milestones> milestones = new ArrayList<Milestones>();
		Milestones milestone;
		
		try {
			String sql = "SELECT * FROM modules";
			
		    Statement statement = msCon.getStatement();
		    ResultSet results = statement.executeQuery(sql);
		    milestone = new Milestones();
		    
		    results.first();
		    
		    while (results.next()) {
		    	milestone.setName(results.getString("name"));
		    	milestone.setId(results.getInt("id"));
		    	milestone.setCompleted(results.getInt("completed"));
		    	milestone.setProjects_id(results.getInt("projects_id"));
		    }
		    
		    milestones.add(milestone);
		    
		    for(Milestones mod : milestones)
			    System.out.println(mod.toString());
		    
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return milestones;
	}
	
	public Milestones getModule(int id) {
		Milestones milestones;
		
		try {
			String sql = "SELECT * FROM users WHERE id='"+id+"'";
		    Statement statement = msCon.getStatement();
		    
		    ResultSet results = statement.executeQuery(sql);
		    milestones = new Milestones();
		    
		    while (results.next()) {
		    	milestones.setName(results.getString("name"));
		    	milestones.setId(results.getInt("id"));
		    	milestones.setCompleted(results.getInt("completed"));
		    	milestones.setProjects_id(results.getInt("projects_id"));
		    }
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return milestones;
	}
}
