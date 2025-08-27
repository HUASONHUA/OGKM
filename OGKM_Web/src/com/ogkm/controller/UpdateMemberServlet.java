package com.ogkm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import uuu.ogkm.entity.Customer;
import uuu.ogkm.exception.DataInvalidException;
import uuu.ogkm.exception.OGKMException;
import uuu.ogkm.service.CustomerService;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/member/update.do")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();
		
		HttpSession session = request.getSession();
		Customer member = (Customer)session.getAttribute("member");
		//1.取得Form Data並檢查之
		String id = request.getParameter("AcctNo");
		String name = request.getParameter("name");
		String password = request.getParameter("password");		
		String newpassword = request.getParameter("newpassword");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String address1 = request.getParameter("address1");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String sub = request.getParameter("sub");
		
		
		//TODO:檢查其他欄位...
//		if(member==null) {
//			//TODO: redirect 回login.jsp
//			//return;
//			
//		}
		
		if(id!=null && !id.equals(member.getId())) {
			errors.add("不得竄改AcctNo");
		}
		if(name==null || name.length()==0) {
			errors.add("請輸入姓名");
		}
		
		if(password==null || !password.equals(member.getPassword())) {
			errors.add("原密碼不正確");
		}else {
			password = member.getPassword();
		}
		
		if(newpassword!=null  ) {
			if(password.equals(newpassword)&&newpassword!="") {
				errors.add("新密碼不能跟原密碼相同");
			}else {
				if(newpassword!="") {
				password = newpassword;
				}
			}
		}
		if(email==null || email.length()==0) {
			errors.add("請輸入email");
		}

//		if(phone==null) {
//			errors.add("請輸入電話");
//		}else {
//			phone = member.getPhone();
//		}
		
//		if(address==null||address1==null) {
//			errors.add("請輸入地址");
//		}else {
//			address = member.getAddress();
//			address1 = member.getAddress1();
//		}
		
				//2.若無誤則呼叫商業邏輯
				if(errors.isEmpty()) {
					try {
						Customer c = member.getClass().newInstance();
						c.setId(member.getId());
						c.setName(name);
						c.setPassword(password);
						c.setEmail(email);
						c.setPhone(phone);
						c.setAddress(address);
						c.setAddress1(address1);
						c.setGender(gender.charAt(0));
						c.setBirthday(birthday);
						c.setSubscribed(sub.equals("true"));	
						
						//TODO:帶入其他欄位
						
						CustomerService cs = new CustomerService();
						cs.update(c);
						
					//TODO: 3.1 redirect to 首頁 
						session.setAttribute("member",c);
						RequestDispatcher dispatcher =request.getRequestDispatcher("/member/memberupdateok.jsp");
						dispatcher.forward(request, response);
						
						return;
					}catch(DataInvalidException e) {
						errors.add(e.getMessage());
					}catch(OGKMException e) {
						this.log("修改失敗", e); // FOR ADMIN DEVELOPRE,TESTER
						errors.add(e.getMessage());// FOR USER
					}catch(Exception e){
						this.log("修改失敗,發生非預期錯誤", e); // FOR ADMIN DEVELOPRE,TESTER
						errors.add(e.getMessage());// FOR USER
					}
				}
				// 3.2 error: forward to memberupdate.jsp
				request.setAttribute("errors",errors);
				RequestDispatcher dispatcher =
					request.getRequestDispatcher("/member/member.jsp#membermodify");
				dispatcher.forward(request, response);
	}

}
