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

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	EmployeeDao empdao = new EmployeeDao();

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("Success.jsp");
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean checked = empdao.checkExistenceOfRecord(id);
			if (checked) {
				empdao.deleteEmployee(id);
				response.sendRedirect("NewHome.jsp"); 
			}else {
				
				request.setAttribute("msg", "Not a employee");
				rd.forward(request, response);
			}
			
		}
		catch(Exception e){
			
			e.printStackTrace();
			
			request.setAttribute("msg","Enter valid id");
			rd.forward(request, response);
		}
		


	}

}
