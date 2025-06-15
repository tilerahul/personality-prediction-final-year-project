package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static String DBName="personality";
	public static String DBUSER="root";
	public static String DBPASSWORD="root";
	public static Connection connection;
	public static Connection getConnection() {
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+DBName,DBUSER,DBPASSWORD);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return connection;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public static String DBName1="mysql";
	public static Connection getConnectionn() {
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+DBName1,DBUSER,DBPASSWORD);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return connection;
	}
}
