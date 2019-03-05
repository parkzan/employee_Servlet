package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.InterningXmlVisitor;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			doGet(request, response);
			
			
			
			
			 String name_insert = request.getParameter("Name_insert");
			 String name_search = request.getParameter("name_search");
			 String name_edit =  request.getParameter("name_edit");
			 String del = request.getParameter("btn-delete");
			 if(name_insert != null){
				 InsertData(request, response);
			 }
			if(name_search != null){
				SearchData(request, response);
			}
			if(name_edit != null) {
				UpdateData(request,response);
			}
			if(del != null) {
				if(del.equals("DELETE")) {
					response.sendRedirect("index.jsp");
				}
				if(del.equals("CANCEL")) {
					showData(request,response);	
				}
			}
		
			showData(request,response);	
		
		
			
			
		}
		
	protected void InsertData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		 String name_insert = request.getParameter("Name_insert");
		 String Email_insert = request.getParameter("Email_insert");
		 int Type_insert = Integer.parseInt(request.getParameter("Type_insert"));
		 int Team_insert =  Integer.parseInt(request.getParameter("Team_insert"));	
		 if(name_insert!=null){
			 ConnectDB insert = new ConnectDB();
			 boolean status = insert.InsertDate(name_insert, Email_insert, Type_insert, Team_insert);
			 session.setAttribute("status_insert", status);
			 request.getRequestDispatcher("insert.jsp").forward(request, response);	
		 }
		
	}
	protected void SearchData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String name_search = request.getParameter("name_search");
		if(name_search!=null){
			try {
				ResultSet result = ConnectDB.getStaff(name_search);
				request.setAttribute("result_staff", result);
				request.setAttribute("input_search", name_search);
				request.getRequestDispatcher("result.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
			}	
		}
		
	}
	protected void showData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		try {
			ResultSet result2 = ConnectDB.ShowData();
			request.setAttribute("Show_Data", result2);
			request.getRequestDispatcher("show.jsp").forward(request, response);	
		} catch (Exception e) {
			
		}
	}
	protected void UpdateData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		int id_em  = (int) session.getAttribute("id_edit");
		String name_edit = request.getParameter("name_edit");
		String email_edit = request.getParameter("email_edit");
		int type_edit = Integer.parseInt(request.getParameter("type_edit"));
		int team_edit =  Integer.parseInt(request.getParameter("team_edit"));
		try {
			boolean update = ConnectDB.UpdateDate(id_em, name_edit, email_edit, type_edit, team_edit);
		} catch (Exception e) {
			
		}
	}

}
