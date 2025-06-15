package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.UserBean;
import com.dao.UserDao;


@WebServlet("/UserLoginController")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UserLoginController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		UserDao dao=new UserDao();
		UserBean user = new UserBean();
		user=dao.CheckUser(email, password);
		
		if((user.getEmail()!=null && user.getEmail()!="") && (user.getPassword()!=null && user.getPassword()!=""))
		{
			
//			out.println("<script type=\"text/javascript\">");
//			out.println("alert('Login Successful')");
//			out.println("location='UserHome.jsp';");
//			out.println("</script>");
//			out.print("welcome "+email);
			
			out.println("<html><head>");
			out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
			out.println("</head><body>");
			out.println("<script type='text/javascript'>");
			out.println("Swal.fire({");
			out.println("  icon: 'success',");
			out.println("  title: 'Welcome to Personality Prediction !!',");
			out.println("  text: 'Redirecting in 2 seconds...',");
			out.println("  timer: 2000,");
			out.println("  showConfirmButton: false");
			out.println("}).then(() => {");
			out.println("  window.location.href = 'UserHome.jsp';");
			out.println("});");
			out.println("</script>");
			out.println("</body></html>");
			
			
			HttpSession session=request.getSession();  
	        session.setAttribute("email",user.getEmail());  
	        session.setAttribute("name", user.getName());
	        session.setAttribute("userId", user.getId());
		    
		}
		else
		{
	     /*out.println("<script type=\"text/javascript\">");
		 out.println("alert('Invalid User...')");
		 out.println("location='UserLogin.jsp';");
		out.println("</script>");*/
			
			out.println("<html><head>");
			out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
			out.println("</head><body>");
			out.println("<script type='text/javascript'>");
			out.println("Swal.fire({");
			out.println("  icon: 'error',");
			out.println("  title: 'Invalid User Details !!',");
			out.println("  text: 'Redirecting in 2 seconds...',");
			out.println("  timer: 2000,");
			out.println("  showConfirmButton: false");
			out.println("}).then(() => {");
			out.println("  window.location.href = 'UserLogin.jsp';");
			out.println("});");
			out.println("</script>");
			out.println("</body></html>");
			
		}
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
