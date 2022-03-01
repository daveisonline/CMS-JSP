package controler;

import java.io.IOException;

import db.data.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/controll"})
public class PageController extends HttpServlet{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
		
		
	}
	private void processRequest( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("font")!= null) {
			DBWriter dbwA = new DBWriter();
			if(request.getParameter("fontFamily")!= null){
				if(request.getParameter("fontFamily")!= ""){
					dbwA.updateAttribut(request.getParameter("fontFamily"), "fontFamily" );
				}
				
			}
			if(request.getParameter("fontSizeMenu")!= null ){
				if(request.getParameter("fontSizeMenu")!= ""){
					dbwA.updateAttribut(request.getParameter("fontSizeMenu"), "fontSizeMenu" );
				}
				
			}
			if(request.getParameter("fontColor")!= null){
				if(request.getParameter("fontColor")!= ""){
					dbwA.updateAttribut(request.getParameter("fontColor"), "fontColor" );
				}
			}
			if(request.getParameter("fontSizeHeader")!= null ){
				if(request.getParameter("fontSizeHeader")!= ""){
					dbwA.updateAttribut(request.getParameter("fontSizeHeader"), "fontSizeHeader" );
				}
			}
			request.getRequestDispatcher("controllcenter/font.jsp").forward(request, response);
			return;
		}
		if(request.getParameter("menubgcolor")!= null) {
			DBWriter dbwA = new DBWriter();
			dbwA.updateAttribut(request.getParameter("menuBgColorValue"), "menuBgColor" );
			
			request.getRequestDispatcher("controllcenter/bgColor.jsp").forward(request, response);
			return;
		}if(request.getParameter("logo")!= null) {
			DBWriter dbwA = new DBWriter();
			if(request.getParameter("logoWidth")!= null){
				if(request.getParameter("logoWidth")!= ""){
					dbwA.updateAttribut(request.getParameter("logoWidth"), "logoWidth" );
				}
				
			}
			if(request.getParameter("logoHeight")!= null ){
				if(request.getParameter("logoHeight")!= ""){
					dbwA.updateAttribut(request.getParameter("logoHeight"), "logoHeight" );
				}
				
			}
			request.getRequestDispatcher("controllcenter/sizeOfMenuHeader.jsp").forward(request, response);
			return;
		}
		if(request.getParameter("menuWidth")!= null) {
			DBWriter dbwA = new DBWriter();
			dbwA.updateAttribut(request.getParameter("widthValue"), "menuWidth" );
			request.getRequestDispatcher("controllcenter/sizeOfMenuHeader.jsp").forward(request, response);
			return;
		}

		if(request.getParameter("value")!= null) {
			DBWriter dbwA = new DBWriter();
			dbwA.updateAttribut(request.getParameter("headerHeightValue"), "headerHight" );
			request.getRequestDispatcher("controllcenter/sizeOfMenuHeader.jsp").forward(request, response);
			return;
		}
		
		if(request.getParameter("t")  == null) {
			request.getRequestDispatcher("controllcenter/controllTabs.jsp").forward(request, response);
			return;
		}else{
			if(request.getParameter("t").equalsIgnoreCase("upload") ) {
				if(request.getParameter("type") == null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("controllcenter/controllTabs.jsp?t=upload");
			        dispatcher.forward(request, response);
				}else {
					if(request.getParameter("type").equalsIgnoreCase("page")) {
						RequestDispatcher dispatcher = request.getRequestDispatcher("controllcenter/upload.jsp?t=uploadPage");
				        dispatcher.forward(request, response);
					}else if(request.getParameter("type").equalsIgnoreCase("pdf")) {
						RequestDispatcher dispatcher = request.getRequestDispatcher("controllcenter/upload.jsp?t=uploadPdf");
				        dispatcher.forward(request, response);
					}else if(request.getParameter("type").equalsIgnoreCase("logo")) {
						RequestDispatcher dispatcher = request.getRequestDispatcher("controllcenter/upload.jsp?t=uploadLogo");
				        dispatcher.forward(request, response);
					}
				}
				return;
			}if(request.getParameter("t").equalsIgnoreCase("t") ) {
				
				request.setAttribute("t", "sbf");
				RequestDispatcher dispatcher = request.getRequestDispatcher("controllcenter/controllTabs.jsp?t=sbf");
				        dispatcher.forward(request, response);
			}
			if (request.getParameter("t").equalsIgnoreCase("changePass")) {
				request.setAttribute("t", "form");
				RequestDispatcher dispatcher = request.getRequestDispatcher("account/changePass.jsp?t=form");
				dispatcher.forward(request, response);
				return;
			}
			return;
		}
	}
	  
}
