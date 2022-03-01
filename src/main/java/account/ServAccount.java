package account;

import java.io.IOException;
import java.sql.SQLException;

import account.DbConention;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/account")
public class ServAccount  extends HttpServlet{
	private boolean isLogedIn;
	private String username;
	private String password;
	private String nametotest="";
	private String passtotest="";
	

	private static final long serialVersionUID = 1L;

	public ServAccount() {
		super();
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		if (action == null) {
			request.getRequestDispatcher("account/index.jsp").forward(request, response);
		}else {
			if (action.equalsIgnoreCase("logout")) {
				session.removeAttribute("username");
				session.setAttribute("connecte", "false");
				response.sendRedirect("account");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		this.nametotest = request.getParameter("username").trim();
		this.passtotest = request.getParameter("password").trim();
		// db connection
		try {
			DbConention dc = new DbConention();
			dc.setUsername(this.nametotest);
			dc.conect();

			this.password= dc.getPassword();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		if (this.passtotest.equalsIgnoreCase(this.password)) {
			this.isLogedIn= true;
			session.setAttribute("username", this.username);
			session.setAttribute("connecte", "true");

			request.getRequestDispatcher("controllcenter/controllTabs.jsp").forward(request, response);
		} else {
			
			this.isLogedIn=false;
			request.setAttribute("error", "Invalid Account");
			request.getRequestDispatcher("account/index.jsp").forward(request, response);
		}
	}
}
