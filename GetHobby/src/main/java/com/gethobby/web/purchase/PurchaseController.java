package com.gethobby.web.purchase;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gethobby.common.Search;
import com.gethobby.service.domain.User;
import com.gethobby.service.openhobbyclass.OpenHobbyClassService;
import com.gethobby.service.purchase.PurchaseService;

//2020-02-24 Git Commit
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	//Field
	@Autowired
	@Qualifier("openHobbyClassServiceImpl")
	private OpenHobbyClassService oepnhobbyClassService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	//Constructor
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	//Method
	@RequestMapping( value="getSelectOption", method=RequestMethod.GET )
	public String getSelectOption(@RequestParam("hobbyClassNo") int hobbyClassNo,
			@RequestParam("eventDiscount") int eventDiscount, HttpSession session, Model model) throws Exception {
		model.addAttribute("purchase", purchaseService.getPayment(((User)session.getAttribute("user")).getUserId()));
		System.out.println("1");
		model.addAttribute("hobbyClass", purchaseService.getPaymentOption(hobbyClassNo, session));
		System.out.println("2");
		model.addAttribute("discountPrice", eventDiscount);
		System.out.println("3");
		System.out.println("getSelectOption End");
		return "/purchase/getSelectOption.jsp";
	}

	@RequestMapping( value="getPaymentHistoryList", method=RequestMethod.GET )
	public String getPaymentHistoryList(HttpSession session, Model model) throws Exception {
		User user = new User();
		user.setUserId("user01@naver.com");
		session.setAttribute("user", user);
		model.addAttribute("purchaseMap", purchaseService.getPaymentHistoryList(((User)session.getAttribute("user")).getUserId(), new Search()));
		return "/purchase/getPaymentHistory.jsp";
	}
		
	@RequestMapping( value="getLessonPage", method=RequestMethod.GET )
	public String getLessonPage(@RequestParam("hobbyClassNo") int hobbyClassNo) throws Exception {
		return "redirect:/lesson/getLesson?hobbyClassNo="+hobbyClassNo+"&lessonNo="+purchaseService.getLessonNoASC(hobbyClassNo);
	}
	
	@RequestMapping( value="startDB", method=RequestMethod.GET )
	public String startingstartingPurchaseData() throws Exception{
		purchaseService.startingPurchaseData();
		return "/admin/getMoneyAnalysisAdmin.jsp";
	}
}
