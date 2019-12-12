package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import db.MysqlCon;
import model.Module;

public class ModuleDAO {
	private MysqlCon msCon;
	
	public ModuleDAO() {
		msCon = new MysqlCon("webdevcw", "root", "");
	}
	
	public boolean registerModule(Module module) {
		try {
    		String sql = "INSERT INTO modules(name, description, status_id, user_id) VALUES(?, ?, ?, ?)";
		    PreparedStatement pstmt = msCon.getPreparedStatement(sql);
		    
            pstmt.setString(1, module.getName());
            pstmt.setString(2, module.getDescription());
            pstmt.setInt(3, module.getStatus_id());
            pstmt.setInt(4, module.getUser_id());
            
            pstmt.executeUpdate();	    
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
//			msCon.close();
		}
		
		return true;
	}
	
	public boolean updateModule(Module module) {
		try {
			
			String sql = "UPDATE modules SET name='"+module.getName()+"', description='"+module.getDescription()+"' WHERE id='"+module.getId()+"'";
		    PreparedStatement pstmt = msCon.getPreparedStatement(sql);
		    
            pstmt.executeUpdate();	    
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
//			msCon.close();
		}
		
		return true;
	}
	
	public ArrayList<Module> getModules(int user_id){
		ArrayList<Module> modules = new ArrayList<Module>();
		Module module = null;
		
		
		try {
    		String sql = "SELECT * FROM modules WHERE user_id='"+user_id+"' ORDER BY id DESC";
		    Statement statement = msCon.getStatement();
		    ResultSet results = statement.executeQuery(sql);
		    
		    while (results.next()) {
				module = new Module();
				
				module.setName(results.getString("name"));
				module.setDescription(results.getString("description"));
				module.setId(results.getInt("id"));
				module.setStatus_id(results.getInt("status_id"));
				
				modules.add(module);
		    }		    
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return modules;
	}
	
	public Module getModule(int id) {
		Module module;
		
		try {
    		String sql = "SELECT * FROM users WHERE id='"+id+"'";
		    Statement statement = msCon.getStatement();
		    
		    ResultSet results = statement.executeQuery(sql);
		    module = new Module();
		    
		    while (results.next()) {
		      module.setName(results.getString("name"));
		      module.setDescription(results.getString("description"));
		      module.setId(results.getInt("id"));
		      module.setStatus_id(results.getInt("status_id"));
		    }
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return module;
	}					
}
