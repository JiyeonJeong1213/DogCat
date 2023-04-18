package com.kh.board.mateboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.mateboard.model.service.mateBoardService;
import com.kh.board.mateboard.model.vo.Board;

/**
 * Servlet implementation class MateSerchController
 */
@WebServlet("/mateSearch")
public class MateSerchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MateSerchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String address = request.getParameter("address1")+","+request.getParameter("address2");
		String search = request.getParameter("searchText");
		
		ArrayList<Board> list = new mateBoardService().searchMateList("BOARD_TITLE", address, search);
		
		if(!list.isEmpty()) {
			request.getRequestDispatcher("views/board/mateboard/mateboardlist.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "게시글 검색 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
