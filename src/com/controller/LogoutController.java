package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LogoutController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession();
		session.invalidate();
		
		/*out.println("<script type=\"text/javascript\">");
		out.println("alert('you are sucessfully logged out!!!!!')");
		out.println("location='index.jsp';");
		out.println("</script>"); */ 
		
		out.println("<html><head>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("</head><body>");
		out.println("<script type='text/javascript'>");
		out.println("Swal.fire({");
		out.println("  icon: 'success',");
		out.println("  title: 'Successfully Logged Out !!',");
		out.println("  text: 'Redirecting in 2 seconds...',");
		out.println("  timer: 2000,");
		out.println("  showConfirmButton: false");
		out.println("}).then(() => {");
		out.println("  window.location.href = 'index.jsp';");
		out.println("});");
		out.println("</script>");
		out.println("</body></html>");
        out.close(); 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
