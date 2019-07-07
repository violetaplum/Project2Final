package frontcontroller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import gamedao.GameDAO;
import gamelist.getAllInfo;
import gamelist.getSearchInfo;
import gamevo.GameVO;

/**
 * Servlet implementation class gameServlet
 */
@WebServlet("*.do")
public class gameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGameList(request,response);
	}

	private void doGameList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String c1 = request.getRequestURI().substring(request.getContextPath().length());
		String kaja=null;
		String src=request.getParameter("src");
		
		if(c1.equals("/getAllInfo.do")) {

			getAllInfo ga=new getAllInfo();
			
			try {
				ga.createL(request,response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(src.equals("start")) {
				kaja="PageMain_p1.jsp";
			}else if(src.equals("PageMain_p1")) {
				kaja="ranking.jsp";
			}
			
		/*	kaja="getAllinfo.jsp";*/
		}
		if(c1.equals("/getSearchInfo.do")) {
			
			
			getSearchInfo gs=new getSearchInfo();
			try {
				gs.createL(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			kaja="getAllinfo.jsp";
		}

		RequestDispatcher rd1=request.getRequestDispatcher(kaja);

		rd1.forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
