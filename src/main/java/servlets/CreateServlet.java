package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDao;
import models.Employee;

@WebServlet("/create")
public class CreateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	EmployeeDao empdao = new EmployeeDao();

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		RequestDispatcher rd = request.getRequestDispatcher("Success.jsp");
		try {
			
			int id = Integer.parseInt(request.getParameter("id"));
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");

			Employee emp = new Employee();
			emp.setId(id);
			emp.setFirstName(firstName);
			emp.setLastName(lastName);

			boolean checked = empdao.checkExistenceOfRecord(id);
			if (!checked) {
				try {
					// if not exists add record
					empdao.createEmpolyee(emp);
					response.sendRedirect("NewHome.jsp"); 
				} catch (ClassNotFoundException | SQLException e) {

					e.printStackTrace();

					
					request.setAttribute("msg", "Something went wrong");
					rd.forward(request, response);
				}

			} else {
				// display error message
				
				request.setAttribute("msg", "Record already exists.");
				rd.forward(request, response);
			}
		} catch (Exception e1) {

			
			request.setAttribute("msg", "Enter valid  details.");

			rd.forward(request, response);

		}

	}

}
