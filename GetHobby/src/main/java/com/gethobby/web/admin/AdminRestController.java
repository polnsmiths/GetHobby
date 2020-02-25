package com.gethobby.web.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.delivery.DeliveryService;
import com.gethobby.service.domain.Purchase;
import com.gethobby.service.openhobbyclass.OpenHobbyClassService;
import com.gethobby.service.purchase.PurchaseService;
import com.gethobby.service.user.UserService;

//2020-02-24 Git Commit
@RestController
@RequestMapping("/admin/*")
public class AdminRestController {
	
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
	
	
	
	

	//Constructor
	public AdminRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/purchase/getPaymentHistoryListAdmin", method=RequestMethod.POST )
	public Map getPaymentHistoryListAdmin(@RequestBody Search search) throws Exception {
		return purchaseService.getPaymentHistoryListAdmin(search);
	}
	
	
	@RequestMapping( value="json/purchase/addDeliveryInfo", method=RequestMethod.POST )
	public Purchase getPaymentHistoryAdmin(@RequestBody Purchase purchase) throws Exception {
		//return purchaseService.getPaymentHistoryListAdmin(search);
		deliveryService.addDeliveryInfo(purchase);
		
		return purchaseService.getPurchase(purchase.getPurchaseId());
	}
	
	
	@RequestMapping( value="json/purchase/updateRefund", method=RequestMethod.POST )
	public Purchase updateRefund(@RequestBody Purchase purchase) throws Exception {
		return purchaseService.updateRefund(purchase);
	}
	
	@RequestMapping( value="json/hobbyClass/getHobbyClassListAdmin", method=RequestMethod.POST )
	public Map getHobbyClassListAdmin(@RequestBody Search search) throws Exception {
		return oepnhobbyClassService.getHobbyClassListAdmin(search);
	}
	
	@RequestMapping( value="json/hobbyClass/saveCheckHobbyClassAdmin", method=RequestMethod.POST )
	public int saveCheckHobbyClassAdmin(@RequestBody HobbyClass hobbyClass) throws Exception {
		return oepnhobbyClassService.saveCheckHobbyClassAdmin(hobbyClass.getHobbyClassNo());
	}
	
	@RequestMapping(value="json/user/getSearchlistUserAdmin" , method = RequestMethod.POST)
	public Map getSearchlistUserAdmin(@RequestBody HashMap<String, String> map) throws Exception{
		System.out.println(map);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setSearchCondition(map.get("searchCondition"));
		
		return userService.getUserListAdmin(search);
	}


}
