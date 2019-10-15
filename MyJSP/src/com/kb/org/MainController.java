package com.kb.org;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.org.member.MemberVO;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null; // jsp파일지정
		request.setCharacterEncoding("UTF-8");
		String reqURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = reqURI.substring(contextPath.length());
		
		System.out.println("reqURI = "+ reqURI);
		System.out.println("contextPath = "+ contextPath);
		System.out.println("cmd = "+ cmd);
		
		if( cmd.equals("/index.do")) {
			/*
			 * 최신회원가입한 목록 5개
			 * 최신글 목록 5개
			 */
			rd = request.getRequestDispatcher("index.jsp");
		}
		else if(cmd.equals("/member.do")) {
			
			try {
				List<MemberVO> list = new ArrayList<>();
				Connection conn = ConnectionPool.getConnection(); // context.xml 에 DB연결
				PreparedStatement pstmt = conn.prepareStatement("select * from member");
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					list.add(
						new MemberVO(
							rs.getString("name"),
							rs.getString("id"),
							rs.getString("pwd"),
							rs.getInt("seq"),
							rs.getString("joindate"),
							rs.getString("gender")
						)		
					);
				}
				
				request.setAttribute("myList",list);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			rd = request.getRequestDispatcher("member.jsp");
		}
		else if(cmd.equals("/freeboard.do")) {
			rd = request.getRequestDispatcher("freeboard.jsp");
		}
		else if(cmd.equals("/memberInsert.do")) {
			rd = request.getRequestDispatcher("memberInsert.jsp");
		}
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}


