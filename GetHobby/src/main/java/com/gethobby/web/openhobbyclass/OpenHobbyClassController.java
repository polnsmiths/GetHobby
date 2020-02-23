package com.gethobby.web.openhobbyclass;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
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

//2020-02-21 Git Commit
@Controller
@RequestMapping("/hobbyclass/*")
public class OpenHobbyClassController {
	
	//Field
	@Autowired
	@Qualifier("openHobbyClassServiceImpl")
	private OpenHobbyClassService oepnhobbyClassService;
	
	//Constructor
	public OpenHobbyClassController() {
		System.out.println(this.getClass());
	}
	
	//Method
	@RequestMapping( value="getMyHobbyClassList", method=RequestMethod.GET )
	public String getMyHobbyClassList(Model model, HttpSession session) throws Exception {
		model.addAttribute("hobbyClassMap", oepnhobbyClassService.getHobbyClassList(new Search(), session));
		return "/openhobbyclass/listMyHobbyClass.jsp";
	}//end of getMyHobbyClassList
		
	@RequestMapping( value="addHobbyClass", method=RequestMethod.GET )
	public String addHobbyClass(Model model, HttpSession session) throws Exception {
		model.addAttribute("hobbyClass", oepnhobbyClassService.addHobbyClass( ((User)session.getAttribute("user")).getUserId() ) );
		return "/openhobbyclass/saveHobbyClass.jsp";
	}//end of addHobbyClass
		
	@RequestMapping( value="getSaveHobbyClass", method=RequestMethod.GET )
	public String getSaveHobbyClass(@RequestParam("hobbyClassNo") int hobbyClassNo, Model model) throws Exception {
		model.addAttribute("hobbyClass", oepnhobbyClassService.getSaveHobbyClass(hobbyClassNo));
		return "/openhobbyclass/saveHobbyClass.jsp";
	}//end of getSaveHobbyClass
		
	@RequestMapping( value="getDetailView", method=RequestMethod.GET )
	public String getDetailView(@RequestParam("hobbyClassNo") int hobbyClassNo, Model model) throws Exception {
		model.addAttribute("hobbyClass", oepnhobbyClassService.getSaveHobbyClass(hobbyClassNo));
		return "/openhobbyclass/getHobbyClassDetailView.jsp";
	}//end of getDetailView
	
	@RequestMapping( value="getPreview", method=RequestMethod.GET )
	public String getPreview(@RequestParam("hobbyClassNo") int hobbyClassNo, Model model) throws Exception {
		return "/openhobbyclass/test.jsp";
	}//end of getDetailView

	@Scheduled(cron="0 0/30 * * * *") // 1초마다 실행
    public void updateClassState() throws Exception{
		oepnhobbyClassService.updateClassState();
    }

}//end of OpenHobbyClassController
