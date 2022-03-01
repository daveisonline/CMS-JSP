package db.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBReader {
	private Connection con;
	private Statement stmt;
	public int lineNum=0;
	public String[][] arrData;
	public String [] attribut;
	public String [] row;
	
	public DBReader() {
		arrData= new String[20][7];
		attribut = new String [11];
		row = new String [4];
	}
	public void readAtrtribut (String command) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}  
		try {
			con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/webdata","webuser","123");
		//here sonoo is database name, root is username and password  
			stmt=con.createStatement();
		ResultSet rs;
			rs = stmt.executeQuery(command);
			int i =0;
			while(rs.next()&&lineNum<20) {
				
				attribut[i]= rs.getString(1);
				i++;
			}
		con.close();  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void readContent(String command) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}  
		try {
			con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/webdata","webuser","123");
		
		//here sonoo is database name, root is username and password  
			stmt=con.createStatement();
		ResultSet rs;
			rs = stmt.executeQuery(command);
			
			while(rs.next()&&lineNum<20) {
				
				arrData[lineNum][0]=rs.getString(1);
				arrData[lineNum][1]=rs.getString(2);
				arrData[lineNum][2]=rs.getString(3);
				arrData[lineNum][3]=rs.getString(4);
				arrData[lineNum][4]=rs.getString(5);
				arrData[lineNum][5]=rs.getString(6);
				arrData[lineNum][6]=rs.getString(7);
				lineNum++;
			}
			
		con.close();  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public void readRow(int stelle) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}  
		try {
			con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/webdata","webuser","123");
		String command = "Select * from menuData WHERE menuData.stelle ='"+stelle+"'; ";
		//here sonoo is database name, root is username and password  
			stmt=con.createStatement();
		ResultSet rs;
			rs = stmt.executeQuery(command);
			
			while(rs.next()) {
				row[0]=rs.getString(2);
				row[1]=rs.getString(3);
				row[2]=rs.getString(4);
				row[3]=rs.getString(5);
			}
			
		con.close();  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String[][] getArrData() {
		return arrData;
	}
}
