package com.gethobby.web.admin;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gethobby.common.Search;
import com.gethobby.service.delivery.DeliveryService;
import com.gethobby.service.domain.Purchase;
import com.gethobby.service.domain.User;
import com.gethobby.service.openhobbyclass.OpenHobbyClassService;
import com.gethobby.service.purchase.PurchaseService;
import com.gethobby.service.user.UserService;

//2020-02-21 Git Commit

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	//Field
	@Autowired
	@Qualifier("openHobbyClassServiceImpl")
	private OpenHobbyClassService oepnhobbyClassService;
	
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	
	@Autowired
	@Qualifier("deliveryServiceImpl")
	private DeliveryService deliveryService;
	
	@Value("#{apiKeyProperties['smartTracking']}")
	private String apiKey;
	
	
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	//Constructor
	public AdminController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping( value="purchase/getPaymentHistoryListAdmin", method=RequestMethod.GET )
	public String getPaymentHistoryListAdmin(Model model, HttpSession session) throws Exception {
		Map purchaseMap = purchaseService.getPaymentHistoryListAdmin(new Search());
		model.addAttribute("purchaseMap", purchaseMap);
		model.addAttribute("resultPage", purchaseMap.get("resultPage"));
		
		
		
		//////////////////// 운송장 입력 ////////////////////
		String reqUrl = "https://info.sweettracker.co.kr/api/v1/companylist?t_key=" + apiKey;
		
		URL url = new URL(reqUrl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("accept", "application/json");
		con.connect();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		String result = "";
		String line = "";
		
		while((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println("response result:::::::::::" + result);
		br.close();
		
		JSONObject json = (JSONObject) JSONValue.parse(result);
		
		System.out.println("json:::::::::: " + json);
		
		ObjectMapper objectMapper = new ObjectMapper();
		List<Map<String, Object>> companyListMap = objectMapper.readValue(json.get("Company").toString(), new TypeReference<List<Map<String, Object>>>(){});
		
		System.out.println("map 안에 들어있는 것들::::::::::" + companyListMap);
		
		
		model.addAttribute("companyListMap", companyListMap);
		System.out.println(companyListMap.get(0).get("Code"));
		////////////////////운송장 입력 ////////////////////
		
		
		return "/admin/getPaymentHistoryListAdmin.jsp";
	}
	
//	배송 정보 등록
	@RequestMapping(value="purchase/getPaymentHistoryListAdmin", method=RequestMethod.POST)
	public String addDeliveryInfo(@ModelAttribute("purchase") Purchase delivery) throws Exception {
		
		deliveryService.addDeliveryInfo(delivery);
		
		return "redirect:/admin/getPaymentHistoryListAdmin.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping( value="hobbyClass/getHobbyClassListAdmin", method=RequestMethod.GET )
	public String getHobbyClassListAdmin(Model model) throws Exception {
		Map purchaseMap = oepnhobbyClassService.getHobbyClassListAdmin(new Search());
		model.addAttribute("hobbyClassMap", purchaseMap);
		model.addAttribute("resultPage", purchaseMap.get("resultPage"));
		return "/admin/listHobbyClassAdmin.jsp";
	}
	
	@RequestMapping( value="purchase/getMoneyAnalysis", method=RequestMethod.GET )
	public String getMoneyAnalysis(Model model) throws Exception {
		model.addAttribute("analysis",purchaseService.getMoneyAnalysisSum());
		return "/admin/getMoneyAnalysisAdmin.jsp";
	}
	
	@RequestMapping( value="getSaveHobbyClassAdmin", method=RequestMethod.GET )
	public String getSaveHobbyClassAdmin(@RequestParam("hobbyClassNo") int hobbyClassNo, Model model) throws Exception {
		model.addAttribute("hobbyClass", oepnhobbyClassService.getSaveHobbyClass(hobbyClassNo));
		return "/admin/getHobbyClassUpdateViewAdmin.jsp";
	}//end of getSaveHobbyClassAdmin
	
	@RequestMapping(value = "user/listUserAdmin")
	public String listUserAdmin(@ModelAttribute("search") Search search,  Model model) throws Exception{
		System.out.println("user/listUserAdmin 시작!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+search);		
		search.setPageSize(pageSize);
		search.setCurrentPage(1);
//		if(search.getCurrentPage() ==0) { 
//			int currentPage = 1; 
//			search.setCurrentPage(currentPage);
//		}				
		Map<String, Object> userlist = new HashMap<String, Object>();
		userlist = userService.getUserListAdmin(search);
		System.out.println(userlist.get("userList"));
		model.addAttribute("userList", userlist.get("userList"));
		model.addAttribute("totalCount", userlist.get("totalCount"));
		model.addAttribute("userCount", userlist.get("userCount"));
		model.addAttribute("creatorCount", userlist.get("creatorCount"));
		model.addAttribute("stopUserCount", userlist.get("stopUserCount"));
		model.addAttribute("retireUserCount", userlist.get("retireUserCount"));		
		return "forward:/admin/listUserAdmin.jsp";
	}
	
	@RequestMapping(value="user/doUser" , method = RequestMethod.GET)
	public String doUser(@RequestParam("userId") String userId, @RequestParam("code") int code, Model model) throws Exception{
		System.out.println("code::::::::::::::::::::::::::::::"+code);
		Map<String, Object> map	= new HashMap<String, Object>();
		map = userService.getUser(userId);
		User user =new User();
		user = (User)map.get("user");
		
		if(code == 1) {
			user.setReasonCode("9");
			userService.stopUser(user);
		}else if(code == 2) {
			userService.removeStopUser(user);
		}else if(code == 3) {
			System.out.println("3번들어어옴!!");
			user.setReasonCode("9");
			userService.deleteUser(user);
		}else {
			userService.removeRetireUser(user);
		}
		
		Search search = new Search();
		search.setPageSize(pageSize);
		search.setCurrentPage(1);
		
		map.clear();
		map = userService.getUserListAdmin(search);
		
		model.addAttribute("userList", map.get("userList"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("userCount", map.get("userCount"));
		model.addAttribute("creatorCount", map.get("creatorCount"));
		model.addAttribute("stopUserCount", map.get("stopUserCount"));
		model.addAttribute("retireUserCount", map.get("retireUserCount"));		
		return "forward:/admin/listUserAdmin.jsp";
	}
}
