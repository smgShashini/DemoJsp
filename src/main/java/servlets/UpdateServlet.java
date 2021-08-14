package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDao;

@WebServlet("/updateName")
public class UpdateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	EmployeeDao empdao = new EmployeeDao();

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd=request.getRequestDispatcher("Success.jsp");
		
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			try {
				String newLastName=request.getParameter("newLastName").toString();
				boolean checked=empdao.checkExistenceOfRecord(id);
				if(checked) {
					try {						
						empdao.updateEmployee(id, newLastName);
						response.sendRedirect("NewHome.jsp"); 
					} catch (ClassNotFoundException | SQLException e) {
						e.printStackTrace();
						request.setAttribute("msg", "Something went wrong ");
						rd.forward(request, response);
					}
					
				}else {
					// display error message 
					request.setAttribute("msg","Not a employee.");
					rd.forward(request, response);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				request.setAttribute("msg","Somthing went wrong");
				rd.forward(request, response);
				
			}
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("msg","Enter valid id. ");
			rd.forward(request, response);
		}
			
	}

}
