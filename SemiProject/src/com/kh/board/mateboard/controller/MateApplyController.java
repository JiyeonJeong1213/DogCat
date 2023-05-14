package com.kh.board.mateboard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.mateboard.model.service.mateBoardService;
import com.kh.board.mateboard.model.vo.Board;
import com.kh.board.mateboard.model.vo.Mate;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MateApplyController
 */
@WebServlet("/applyMate")
public class MateApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MateApplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	
//		int boardNo = Integer.parseInt(request.getParameter("bno"));
//		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
//		
//		ArrayList<Mate> applyList = new mateBoardService().applyMateList(boardNo, userNo);
//		int result = new mateBoardService().applyMate(userNo, boardNo);
//
//		if(applyList== null &&result>0) {
//			response.getWriter().print(result);
//		}
		
		/*
		 * if(result>0) { Board b = new mateBoardService().selectBoard(boardNo);
		 * request.setAttribute("b", b);
		 * request.getRequestDispatcher("views/board/mateboard/mateboardDetail.jsp").
		 * forward(request, response);
		 * 
		 * }else { request.setAttribute("errorMsg", "신청실패");
		 * request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,
		 * response); }
		 */
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int userNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		HttpSession session = request.getSession();
		List<String> appliedList = (List<String>)session.getAttribute("appliedList");
		int result = new mateBoardService().applyMate(userNo, boardNo);
		if(appliedList != null && appliedList.contains(boardNo)) { //이전에 신청한 게시글인지 확읺기
			//이미 신청한 게시글인 경우, 클라이언트에서 처리할 수 있도록 1을 반환
			response.getWriter().write("1");
		}else {
			
			if(appliedList==null && result>0) {
				appliedList = new ArrayList<String>();
			}
			appliedList.add(boardNo+"");
			session.setAttribute("appliedList", appliedList);
			response.getWriter().print(result);
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
