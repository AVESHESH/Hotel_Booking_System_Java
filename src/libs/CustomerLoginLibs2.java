package libs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerLoginLibs2 {
	
	final String Driver="com.mysql.cj.jdbc.Driver";		
	final String DBNAME="hotel_database";
	final String HOST="localhost";
	final int PORT =3306;
	final String URL="jdbc:mysql://"+HOST+":"+PORT+"/"+DBNAME;
	final String USER ="root";
	final String PASSWORD="";
	
	
	public Connection connect() {
		Connection conn = null;
		
		try {
			Class.forName(Driver);   //loading driver
			conn=DriverManager.getConnection(URL,USER, PASSWORD);
		
		}
		
		catch (Exception ex) {
			System.out.println("Error"+ex.getMessage());
		}
		return conn;
		
	}
	
	public CustomerLibs2 login(CustomerLibs2 user) {
		String sql="SELECT * FROM registration WHERE Username=? AND Password=?";
		try {
			Connection conn=connect();
			if(conn!=null) {
			PreparedStatement pstat=conn.prepareStatement(sql);
			pstat.setString(1,user.getUsername());
			pstat.setString(2, user.getPassword());
			ResultSet rs=pstat.executeQuery();
			
			while(rs.next()) {
				
				user.setRegistration_ID(rs.getInt("Registration_ID"));
				user.setTitle(rs.getString("Title"));
				user.setName(rs.getString("Name"));
				user.setUsername(rs.getString("Username"));
				user.setMobile(rs.getLong("Mobile"));
				user.setEmail(rs.getString("Email"));
				user.setPassword(rs.getString("Password"));
				user.setRole(rs.getString("Role"));
			}
			}
			
		}
		catch(Exception ex) {
			
			System.out.println("Error"+ex.getMessage());
		}
		return user;
	}

}
