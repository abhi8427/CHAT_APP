

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SQLOutputImpl;

public class MainChatServlet extends HttpServlet {
	
	String chRoomPath;
	String roomListPath;
	String adminChatPath;
	
	public static void main (String ab[]) {
		System.out.println("Hi");
	}
	
	public void init() {
		
		ServletContext servletcontext = getServletContext();
		servletcontext.setAttribute("chRoomPath", servletcontext.getInitParameter("CHROOM_PATH"));
		servletcontext.setAttribute("roomListPath", servletcontext.getInitParameter("ROOMLIST_PATH"));
		servletcontext.setAttribute("adminChatPath", servletcontext.getInitParameter("ADMINCHAT_PATH"));
		
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		chRoomPath = (String)getServletContext().getAttribute("chRoomPath");
		roomListPath = (String)getServletContext().getAttribute("roomListPath");
		adminChatPath = (String)getServletContext().getAttribute("adminChatPath");
		session.setAttribute(chRoomPath, chRoomPath);
		session.setAttribute(roomListPath, roomListPath);
		session.setAttribute(adminChatPath, adminChatPath);
		HashMap hashmap = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CHATAPP","root","root");
			synchronized (getServletContext()) {
				hashmap = (HashMap)getServletContext().getAttribute("roomList");
				if(hashmap == null) {
					hashmap = new HashMap();
					Statement stmt = con.createStatement();
					String query = "select * from chatrooms";
					ResultSet rs = stmt.executeQuery(query);
					while(rs.next()) {
						hashmap.put(rs.getString(1), new ChatRooms (rs.getString(1), rs.getString(2), 4));
					}rs.close();
					getServletContext().setAttribute("roomList", hashmap);
				}
				
			}con.close();
		
		}catch(SQLException e) {
			
		}catch(ClassNotFoundException e) {
			
		}
		RequestDispatcher view = request.getRequestDispatcher("chat.jsp");
		view.forward(request, response);
		
	}
	
}


