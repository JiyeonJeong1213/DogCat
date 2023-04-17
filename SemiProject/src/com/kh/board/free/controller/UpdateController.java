package com.kh.board.free.controller;

import java.io.File;
import java.io.IOException;
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
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateController
 */
@WebServlet("/update.bf")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				FreeService bService = new FreeService();
				int boardNo = Integer.parseInt(request.getParameter("bno"));
				
				ArrayList<Category> list = bService.selectCategoryList();
				Board b = bService.selectBoard(boardNo);
				Attachment at = bService.selectAttachment(boardNo);
				
				request.setAttribute("list", list);
				request.setAttribute("b", b);
				request.setAttribute("at", at);
			
				
				request.getRequestDispatcher("views/board/free/freeUpdateForm.jsp").forward(request, response);
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				if(ServletFileUpload.isMultipartContent(request)) {
					
					int maxSize = 10 * 1024 * 1024;
					String savePath = request.getSession().getServletContext().getRealPath("/resources/free_board_upfiles/");
					
					MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
					
					int boardNo = Integer.parseInt(multi.getParameter("bno").trim());
					String category = multi.getParameter("category");
					String title = multi.getParameter("title");
					String content = multi.getParameter("content");
					
					Board b = new Board();
					b.setBoardContent(content);
					b.setBoardTitle(title);
					b.setBoardNo(boardNo);
					b.setBoardCategory(category);
					
					
					Attachment at = null;
					
					if(multi.getOriginalFileName("upfile") != null) {
						
						at= new Attachment();
						at.setOriginName(multi.getOriginalFileName("upfile"));
						at.setChangeName(multi.getFilesystemName("upfile"));
						at.setFilePath("resources/free_board_upfiles/");
						
						if(multi.getParameter("originFileNo") != null) {
							
							at.setFileNo( Integer.parseInt(multi.getParameter("originFileNo")));
							
							 new File(savePath+ multi.getParameter("changeFileName") ).delete();
						}else { 
							at.setRefBno( boardNo );
						}
					}
					int result = new FreeService().updateBoard(b, at);
					
					if(result > 0) {
						request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다");
						response.sendRedirect(request.getContextPath()+"/detail.bf?bno="+boardNo);
					}else { 
						request.setAttribute("errorMsg", "게시글 수정에 실패했습니다");
						request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					}
					
				} else {
					request.setAttribute("errorMsg","전송방식이 잘못되었습니다");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
	}

}
