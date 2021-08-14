package dao;

import java.sql.*;

import models.Employee;

public class EmployeeDao {
	public ResultSet viewAllEmployee() throws SQLException {
		Connection con=getConnection();
		Statement st = con.createStatement();
		return st.executeQuery("select *from employee");
		
	}

	public void createEmpolyee(Employee emp) throws ClassNotFoundException, SQLException {
		int id = emp.getId();
		String fname = emp.getFirstName();
		String lname = emp.getLastName();

		
		Connection con=getConnection();
		PreparedStatement st = con.prepareStatement("insert into employee values(?, ?, ?)");
		st.setInt(1, id);
		st.setString(2, fname);
		st.setString(3, lname);
		st.executeUpdate();
		st.close();
		con.close();

	}


	public Employee getEmployee(int id) throws ClassNotFoundException, SQLException {
		Employee emp = new Employee();

		
		Connection con=getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select *from employee where id=" + id);
		if (rs.next()) {
			emp.setId(id);
			emp.setFirstName(rs.getString(2));
			emp.setLastName(rs.getString(3));
		}
		st.close();
		con.close();

		return emp;

	}

	public void deleteEmployee(int id) throws ClassNotFoundException, SQLException {

		
		Connection con=getConnection();
		Statement st = con.createStatement();
		st.executeUpdate("DELETE FROM employee WHERE id=" + id);

	}

	public void updateEmployee(int id, String newLastName) throws ClassNotFoundException, SQLException {
		
		Connection con=getConnection();
		PreparedStatement st = con.prepareStatement("update employee set last_name=? where id=?");

		st.setString(1, newLastName);
		st.setInt(2, id);

		st.executeUpdate();
		st.close();
		con.close();
	}

	public boolean checkExistenceOfRecord(int id) throws ClassNotFoundException, SQLException {
		boolean ex=false;
		
		Connection con=getConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select *from employee where id=" + id);
		ex=(rs.next())? true:false;
		con.close();
		return ex;
		
		
	}
	
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/xyzcompany","root","24091@MySql");
		
	}

}
