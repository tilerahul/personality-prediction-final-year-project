package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.UserBean;

import com.dao.UserDao;



@MultipartConfig(maxFileSize = 10485760)
@WebServlet("/UserRegistrationController")
public class UserRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	InputStream image=null;		
	String imageName="";
	String path=null;
	File upload=null;
    public UserRegistrationController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String mobileno=request.getParameter("mobileno");
		String dob=request.getParameter("dob");
		String password=request.getParameter("password");
	;
		UserDao db=new UserDao();
		
		UserBean bean=new UserBean();
		bean.setName(name);
		bean.setAddress(address);
		bean.setEmail(email);
		bean.setMobileno(mobileno);
		bean.setDob(dob);
		bean.setPassword(password);
		
		
		UserDao dao=new UserDao();
		
		
		
		try {
			if(db.alreadyUser(email))
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User already exists')");
				out.println("location='UserLogin.jsp';");
				out.println("</script>");
				
			}
			else
			{
			if(dao.InsertUserData(bean))
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Registration Successful')");
				out.println("location='UserLogin.jsp';");
				out.println("</script>");
				
				
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Registration UnSuccessful')");
				out.println("location='UserRegistration.jsp';");
				out.println("</script>");
			}
}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
