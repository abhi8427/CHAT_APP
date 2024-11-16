
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;

public class RoomListServlet extends HttpServlet{
   public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException{
		RequestDispatcher view=request.getRequestDispatcher("RoomListServlet.jsp");
		view.forward(request, response);		
   }
   public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException{
		doGet(request, response);
   }	
}
