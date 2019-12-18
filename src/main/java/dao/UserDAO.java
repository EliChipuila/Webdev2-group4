package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.MysqlCon;
import model.User;
import java.sql.Statement;

public class UserDAO {
	private MysqlCon msCon;
	
	public UserDAO() {
		msCon = new MysqlCon("webcw", "root", "");
	}
	
	public boolean registerUser(User user) {
		try {
    		String sql = "INSERT INTO users(name, username, password, email, remember, id) VALUES(?, ?, ?, ?, ?, ?)";
		    PreparedStatement pstmt = msCon.getPreparedStatement(sql);
		    
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getUsername());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getEmail());
            pstmt.setInt(5, user.getRemember());
            pstmt.setInt(6, user.getId());
            
            pstmt.executeUpdate();	    
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public User getUser(String email, String password) {
		User user = null;
		try {
    		String sql = "SELECT * FROM users WHERE email LIKE '%"+email+"%' AND password LIKE '%"+password+"%'";
		    Statement statement = msCon.getStatement();
		    
		    System.out.println("SQL Statement: "+sql);
		    
		    ResultSet results = statement.executeQuery(sql);
		 
		    if(results.first()) {
		    	user = new User();
		    	user.setName(results.getString("name"));
			      user.setUsername(results.getString("username"));
			      user.setEmail(results.getString("email"));
			      user.setPasswordEncryption(results.getString("password"));
			      user.setRemember(results.getInt("remember"));
			      user.setId(results.getInt("id"));
		    }
			
		    results.close();
		    
		    if(user != null) {
		    	if(user.getEmail().equalsIgnoreCase(email))
		    		return user;
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
