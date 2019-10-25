package lee.hg.control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lee.hg.db.DBconn;
import lee.hg.model.ApplyVO;

/**
 * Servlet implementation class InsertControl
 */
@WebServlet("/apply/insert")
public class InsertControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertControl() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String grade = request.getParameter("grade");
		String subject = request.getParameter("subject");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		
		ApplyVO applyVO = new ApplyVO();
		applyVO.setName(name);
		applyVO.setPhone(phone);
		applyVO.setGrade(grade);
		applyVO.setSubject(subject);
		applyVO.setDate(date);
		applyVO.setTime(time);
		
		ApplyControl control = new ApplyControl();
		int result = control.insertApply(applyVO);
		if(result > 0) {
			response.setHeader("Content-Type", "application/html");
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			response.getWriter().append("입력 성공<br>");
			response.getWriter().append("<a href='../index.jsp'>첫화면</a>");
		}
	}
}
