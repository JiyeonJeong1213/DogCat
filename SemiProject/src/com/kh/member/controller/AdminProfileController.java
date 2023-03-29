package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.pet.model.service.PetService;
import com.kh.pet.model.vo.Pet;

/**
 * Servlet implementation class AdminProfileController
 */
@WebServlet("/adminProfile")
public class AdminProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/admin/adminProfile.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		String userNickname = request.getParameter("userNickname");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("newPwd");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String pet = request.getParameter("pet");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
	
		
		Member m = new Member();
		m.setUserName(userName);
		m.setUserNickname(userNickname);
		m.setUserId(userId);
		m.setEmail(email);
		m.setAddress(address);
		m.setUserPwd(userPwd);
		
		
		Pet p = new Pet();
		p.setUserNo(userNo);
		p.setSpecies(pet);
		
		Pet updatePet = new PetService().updatePet(p);
		Member updateMem = new MemberService().updateMember(m);
		
		if(updateMem == null) {
			request.setAttribute("errorMsg", "관리자정보 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("pet", updatePet);
			session.setAttribute("alertMsg", "관리자정보 수정 성공");

			response.sendRedirect(request.getContextPath());
			
		}
		
		
		
		
		
	}

}
