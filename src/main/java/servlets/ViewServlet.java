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

@WebServlet("/view")
public class ViewServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	EmployeeDao empdao = new EmployeeDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		RequestDispatcher rd = request.getRequestDispatcher("ViewEmployee.jsp");
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			try {
				Employee e1 = empdao.getEmployee(id);
				request.setAttribute("emp", e1);
				rd.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				request.setAttribute("msg","Something went wrong");
				rd.forward(request, response);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg","Enter valid id");
			rd.forward(request, response);
		}

	}

}
