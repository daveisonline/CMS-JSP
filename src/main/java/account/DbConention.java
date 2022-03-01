package account;

import java.sql.*; 


public class DbConention {
	private Connection con;
	private Statement stmt;
	private String username;
	private String password;
	
	public void conect() throws ClassNotFoundException, SQLException {
			  
			
			//here sonoo is database name, root is username and password  
				stmt=con.createStatement();
			String sql="select password from ANMELDE where username ='"+this.username+"'";
			ResultSet rs;
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
				this.password = rs.getString(1);
				}
	}
	public void changePass() {
		
	}
	
	public DbConention() throws ClassNotFoundException {
		super();
		Class.forName("com.mysql.jdbc.Driver");
		try {
			
			this.con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/webdata","webuser","123");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public String getUsername() {
		return username;
	}
	public void setPassword(String oldPass, String newPass, String conNewPass) throws SQLException {
		if(oldPass.equals(this.password)){
			if (newPass.equals(conNewPass)) {
				stmt=con.createStatement();
				String sql="update ANMELDE set password='"+  newPass+ "'";
				stmt.executeUpdate(sql);
				System.out.println("password changes successfully");
			}else{
				System.out.println("new password and confirm new password is not matching");
			}
		}else {
			System.out.println("'"+this.password+"'");
			System.out.println("'"+oldPass+"'");
			System.out.println("wrong password!!");
		}
		
	}
	
}
