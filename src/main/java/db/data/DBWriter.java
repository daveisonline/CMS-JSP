package db.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBWriter {
	private Connection con;
	private Statement stmt;

	public void insertRow( int stelle, String link, String path1, String path2, String bgc) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}  
		try {
			con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/webdata","webuser","123");
			stmt=con.createStatement();
			String statment="INSERT INTO menuData (id, stelle, link, path, path2, bgc) VALUES (NULL, '"+stelle+"', '"+link+"', '"+path1+"', '"+path2+"', '"+bgc+"')";
			stmt.execute(statment);
			con.close();  
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void removeRow(int stelle) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}  
		try {
			con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/webdata","webuser","123");
			stmt=con.createStatement();
			String statment="DELETE FROM menuData WHERE menuData.stelle ='"+stelle+"';";
			if(stmt.execute(statment)) {
				System.out.println("hallo falsch");
			}
			con.close();  
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void updateStelle(String name, int stelle) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}  
		try {
			con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/webdata","webuser","123");
			stmt=con.createStatement();
			String statment="UPDATE `menuData` SET stelle = '"+stelle+"' WHERE menuData.path ='"+name+"';";
			if(stmt.execute(statment)) {
				System.out.println("hallo falsch");
			}
			con.close();  
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void publishPages(String name, int stat) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}  
		try {
			con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/webdata","webuser","123");
			stmt=con.createStatement();
			String statment="UPDATE `menuData` SET isPublished = '"+stat+"' WHERE menuData.path ='"+name+"';";
			if(stmt.execute(statment)) {
				System.out.println("hallo falsch");
			}
			con.close();  
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void changePagesName(String name, int id) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}  
		try {
			con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/webdata","webuser","123");
			stmt=con.createStatement();
			String statment="UPDATE `menuData` SET path = '"+name+"' WHERE menuData.id = '"+id+"';";
			if(stmt.execute(statment)) {
				System.out.println("hallo falsch");
			}
			con.close();  
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateRow(int stelle, String link, String path1, String path2, String farbe, int letztStelle) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}  
		try {
			con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/webdata","webuser","123");
			stmt=con.createStatement();
			String statment="UPDATE `menuData` SET stelle = '"+stelle+"', link = '"+link+"', path = '"+path1+"', path2 = '"+path2+"', bgc = '"+farbe+"' WHERE menuData.stelle ="+letztStelle+"; ";
			if(stmt.execute(statment)) {
				System.out.println("hallo falsch");
			}
			con.close();  
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateAttribut( String value, String attribut) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}  
		try {
			con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/webdata","webuser","123");
			stmt=con.createStatement();
			String statment="UPDATE webAttributs SET value = '"+value+"' WHERE webAttributs.attribut ='"+attribut+"'; ";
			if(stmt.execute(statment)) {
				System.out.println("hallo falsch attribut");
			}
			con.close();  
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private String encodeHTML(String s)
	{
	StringBuffer out = new StringBuffer();
	  
	for(int i=0; i<s.length(); i++)
	  
	{
	  
	  char c = s.charAt(i);
	  
	  if((int)c > 127 )
	  
	  {
	  
	 out.append("&#"+(int)c+";");
	  
	  }
	  
	  else
	  
	  {
	  
	out.append(c);
	  
	  }
	  
	}
	  
	return out.toString();
	  
	  }
	
}
