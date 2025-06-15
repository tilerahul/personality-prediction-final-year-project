package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AdminLoginController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		if(email.equals("admin@gmail.com") && password.equals("Admin123"))
		{
			/*out.println("<script type=\"text/javascript\">");
			out.println("alert('Login Successful')");
			out.println("location='AdminHome.jsp';");
			out.println("</script>");*/
			
			out.println("<html><head>");
			out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
			out.println("</head><body>");
			out.println("<script type='text/javascript'>");
			out.println("Swal.fire({");
			out.println("  icon: 'success',");
			out.println("  title: 'Admin Login Successfull !!',");
			out.println("  text: 'Redirecting in 2 seconds...',");
			out.println("  timer: 2000,");
			out.println("  showConfirmButton: false");
			out.println("}).then(() => {");
			out.println("  window.location.href = 'AdminHome.jsp';");
			out.println("});");
			out.println("</script>");
			out.println("</body></html>");
			
			HttpSession ss=request.getSession();
			ss.setAttribute("email", email);
		}
		else
		{
			/*out.println("<script type=\"text/javascript\">");
			out.println("alert('Login Fail.......')");
			out.println("location='AdminLogin.jsp';");
			out.println("</script>");*/
			
			out.println("<html><head>");
			out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
			out.println("</head><body>");
			out.println("<script type='text/javascript'>");
			out.println("Swal.fire({");
			out.println("  icon: 'error',");
			out.println("  title: 'Invalid Admin Details !!',");
			out.println("  text: 'Please Login Again !!',");
			out.println("  timer: 2000,");
			out.println("  showConfirmButton: false");
			out.println("}).then(() => {");
			out.println("  window.location.href = 'AdminLogin.jsp';");
			out.println("});");
			out.println("</script>");
			out.println("</body></html>");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
