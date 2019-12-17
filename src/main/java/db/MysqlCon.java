package db;

import java.sql.*;

public class MysqlCon{
    private Connection connection;
    private Statement statement;

    public MysqlCon(String databaseName, String user, String password) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+databaseName, user, password);
            statement=connection.createStatement();
            
            System.out.println("\nConnection: "+connection.toString());
        }catch(Exception e){
            System.out.println(e);
        }
    }

    public Connection getConnection() {
        return connection;
    }
    
    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public Statement getStatement() {
        return statement;
    }
    
    public PreparedStatement getPreparedStatement(String sql) throws SQLException {
    	return connection.prepareStatement(sql);
    }

    public void setStatement(Statement statement) {
        this.statement = statement;
    }

	public void close() {
		try {
			if(connection != null) {
				connection.close();
			}
			if(statement != null) {
				statement.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}