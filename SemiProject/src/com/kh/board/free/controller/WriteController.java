package com.kh.board.free.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.free.model.service.FreeService;
import com.kh.board.free.model.vo.Category;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class FreeJoinController
 */
@WebServlet("/insert.bf")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 카테고리 조회
		ArrayList<Category> categoryList = new FreeService().selectCategoryList();
		
		request.setAttribute("categoryList", categoryList);
		
		request.getRequestDispatcher("views/board/free/freeEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request) ) {
			
			int maxSize = 1024 * 1024 * 10;// 
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/free_board_upfiles/");
			
			MultipartRequest multi = new MultipartRequest(request , savePath, maxSize ,"UTF-8", new MyFileRenamePolicy());
			 
	
			String category = multi.getParameter("category");
			String title = multi.getParameter("title"); 
			String content = multi.getParameter("content"); 
	
			//로그인 user 확인
			String boardWriter = ((Member) request.getSession().getAttribute("loginUser")).getUserNo()+""; 

			Board board = new Board();
			board.setBoardCategory(category);
			board.setBoardTitle(title);
			board.setBoardContent(content);
			board.setBoardWriter(boardWriter);
			 
			Attachment at = null;

			if(multi.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName( multi.getOriginalFileName("upfile")  );
				at.setChangeName( multi.getFilesystemName("upfile") );
				at.setFilePath("resources/free_board_upfiles/");
			}
			 
			//write
			int result = new FreeService().insertBoard(board , at);
			
			if(result > 0 ) {  //게시글 성공
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				response.sendRedirect(request.getContextPath()+"/list.bf?currentPage=1");
			}
			else { 	
				if(at != null) { new File(savePath+at.getChangeName()).delete(); }
				request.setAttribute("errorMsg", "게시글 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);				 
			}
			
		} else {
			request.setAttribute("errorMsg", "전송방법이 잘못되었습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
