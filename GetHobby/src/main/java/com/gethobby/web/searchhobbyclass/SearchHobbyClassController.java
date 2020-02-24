package com.gethobby.web.searchhobbyclass;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gethobby.common.Page;
import com.gethobby.common.Search;
import com.gethobby.service.community.CommunityService;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.ClassAssess;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.HobbyClassMin;
import com.gethobby.service.domain.Lesson;
import com.gethobby.service.domain.LessonTimes;
import com.gethobby.service.domain.Reply;
import com.gethobby.service.domain.User;
import com.gethobby.service.lesson.LessonService;
import com.gethobby.service.searchhobbyclass.SearchHobbyClassService;


@Controller
@RequestMapping("/searchHobbyClass/*")
public class SearchHobbyClassController {
	@Autowired
	@Qualifier("searchHobbyClassServiceImpl")
	private SearchHobbyClassService searchHobbyClassService;
	
	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Value("#{hashtagProperties}")
	private Properties hashtag;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['articlePageSize']}")
	int pageSize;
	
	public SearchHobbyClassController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value = "getSearchHobbyClassIntro" )
	public String getSearchHobbyClassIntro( @RequestParam("hobbyClassNo") String hobbyClassNo, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model ) throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		
		System.out.println("----------hobbyClassNo ? : " + hobbyClassNo);
		
		User user = (User)session.getAttribute("user");
		
		String userId = null;
		
		if ( user != null ) {
			userId = user.getUserId();
		}
	
		inputData.put("userId", userId);
		inputData.put("hobbyClassNo", hobbyClassNo);
		
		HobbyClass hobbyClass = searchHobbyClassService.getHobbyClass(inputData);
		System.out.println("------hobbyClass ? : " + hobbyClass);

		System.out.println("-------------------hobbyClass.getHobbyClassPrice() ? : " + hobbyClass.getHobbyClassPrice());
		
		hobbyClass.getEvent().setResultPrice( (int)Math.round( ( (100 - hobbyClass.getEvent().getEventDiscount() ) / 100.0 ) * hobbyClass.getHobbyClassPrice() ) );
		
		model.addAttribute("hobbyClass", hobbyClass);
		
		
		
		// 구매여부 판별 -----------------------
		int purchaseCheck = 0;
		
		if ( user != null ) {
			System.out.println("----------purchasCheck inputData ? : " + inputData);
			purchaseCheck = searchHobbyClassService.getPurchaseClassCheck(inputData);
		}
		model.addAttribute("purchaseCheck", purchaseCheck);
		System.out.println("--------------purchaseCheck ? : " + purchaseCheck);
		// 구매여부 판별 -----------------------
		
		// 클래스 한줄평 가져오기 -------------------------
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		inputData = new HashMap<String, Object>();
		inputData.put("hobbyClassNo", hobbyClassNo);
		inputData.put("search", search);
		
		Map<String, Object> returnMap = searchHobbyClassService.getHobbyClassAssessContent(inputData); 
		
		List<ClassAssess> listAssessContent = (List<ClassAssess>)returnMap.get("list"); 
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)returnMap.get("total")).intValue(), pageUnit, pageSize);
		System.out.println("--------resultPage ? : " + resultPage);
		model.addAttribute("listAssessContent", listAssessContent);
		model.addAttribute("resultPage", resultPage);
		// 클래스 한줄평 가져오기 -------------------------
		
		Map<String, Object> resultMap = lessonService.getLessonList(Integer.parseInt(hobbyClassNo));
		
		List<Lesson> lessonList = (List<Lesson>)resultMap.get("list");
		int total = (Integer)resultMap.get("total");
		model.addAttribute("lessonList", resultMap.get("list"));
		
		// Page lessonCountResultPage = new Page( 1, ((Integer)returnMap.get("total")).intValue(), pageUnit, 3);
		Page lessonCountResultPage = new Page( 1, total, pageUnit, 3);
		System.out.println("lessonCountResultPage ? : " + lessonCountResultPage);
		model.addAttribute("lessonCountResultPage", lessonCountResultPage);
		// 클래스 강의 가져오기 -----------------------------
		
		// 이벤트 저장 구간 -----------------------------------------------------------
		model.addAttribute("eventList", hobbyClass.getEventList());
		// 이벤트 저장 구간 -----------------------------------------------------------
		
		// 클래스 한줄평 작성여부 구간 ---------------------------------------------------
		inputData = new HashMap<String, Object>();
		inputData.put("hobbyClassNo", hobbyClassNo);
		inputData.put("userId", userId);
		
		ClassAssess classAssess = searchHobbyClassService.getUserClassAssess(inputData);
		
		model.addAttribute("classAssess", classAssess);
		// 클래스 한줄평 작성여부 구간 ---------------------------------------------------
		
		return "forward:/searchhobbyclass/getHobbyClassIntro.jsp";
	}
	
	/* 안쓸듯 
	@RequestMapping( value = "getSearchHobbyClassKit" )
	public String getSearchHobbyClassKit( @RequestParam("hobbyClassNo") String hobbyClassNo, HttpSession session, Model model ) throws Exception {
		Map<String, Object> inputData = new HashMap<String, Object>();
		
		System.out.println("----------hobbyClassNo ? : " + hobbyClassNo);
		
		User user = (User)session.getAttribute("user");
		
		String userId = null;
		if (user != null ) {
			userId = user.getUserId();
		}
		
		// c@c.c가 로그인했다고 가정 
		inputData.put("userId", userId);
		inputData.put("hobbyClassNo", hobbyClassNo);
		
		HobbyClass hobbyClass = searchHobbyClassService.getHobbyClass(inputData);
		System.out.println("------hobbyClass ? : " + hobbyClass);
		model.addAttribute("hobbyClass", hobbyClass);
		
		return "forward:/hobbyclass/getHobbyClassKit.jsp";
	}
	*/
	
	@RequestMapping( value = "getHobbyClassAssessContent" )
	public String getHobbyClassAssessContent( @RequestParam("hobbyClassNo") String hobbyClassNo, Model model ) throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("hobbyClassNo", hobbyClassNo);
		inputData.put("search", search);
		
		Map<String, Object> returnMap = searchHobbyClassService.getHobbyClassAssessContent(inputData); 
		
		List<ClassAssess> listAssessContent = (List<ClassAssess>)returnMap.get("list"); 
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)returnMap.get("total")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("listAssessContent", listAssessContent);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/hobbyclass/getHobbyClassAssessContent.jsp";
	}
	
	@RequestMapping( value = "getHobbyClassLessonContent" )
	public String getHobbyClassLessonContent( @RequestParam("hobbyClassNo") String hobbyClassNo, HttpSession session, Model model ) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		String userId = null;
		
		if (user != null) {
			userId = user.getUserId();
		}
		
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("hobbyClassNo", hobbyClassNo);
		inputData.put("userId", userId);
		
		List<LessonTimes> lessonTimesList = searchHobbyClassService.getHobbyClassLessonContent(inputData);
		
		model.addAttribute("lesson", lessonTimesList);
		
		System.out.println("-----lessonTimesList.get(0)? : " + lessonTimesList.get(0));
		return "forward:/hobbyclass/getHobbyClassLessonContent.jsp";
	}
	
	@RequestMapping( value = "getPopularHobbyClassList" )
	public String getPopularHobbyClassList(Model model, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		
		String userId = null;
		
		if ( user != null ) {
			userId = user.getUserId();
		}
		
		Search search = new Search(); 
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		Map<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("userId", userId);
		inputData.put("search", search);
		
		Map<String, Object> map = searchHobbyClassService.getPopularHobbyClassList(inputData);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("total")).intValue(), pageUnit, pageSize);
		List<HobbyClass> hobbyClassList = (List<HobbyClass>)map.get("list");
		
		model.addAttribute("list", hobbyClassList);
		model.addAttribute("resultPage", resultPage);

		return "forward:/hobbyclass/listPopularHobbyClass.jsp";
	}
	
	@RequestMapping( value = "getRegisterHobbyClassList" ) 
	public String getRegisterHobbyClassList(HttpSession session, Model model) throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		
		User user = (User)session.getAttribute("user");
		
		String userId = null;
		
		if ( user != null ) {
			userId = user.getUserId();
		}
		
		Map<String, Object> inputData = new HashMap<String, Object>(); 
		inputData.put("search", search);
		inputData.put("userId", userId);
		
		Map<String, Object> map = searchHobbyClassService.getRegisterHobbyClassList(inputData);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("total")).intValue(), pageUnit, pageSize);
		List<HobbyClass> hobbyClassList = (List<HobbyClass>)map.get("list");
		System.out.println("-----resultPage ? : " + resultPage);
		model.addAttribute("list", hobbyClassList);
		model.addAttribute("resultPage", resultPage);
		
		return "forward:/hobbyclass/listRegisterHobbyClass.jsp";
	}
	
	/* 안쓸듯
	@RequestMapping( value = "getRecentlyHobbyClassList" )
	public Map<String, Object> getRecentlyHobbyClassList(HttpServletRequest request, HttpSession session) throws Exception {
		String history = null;

		List<HobbyClass> hobbyClassList = new ArrayList<HobbyClass>();
		User user = (User)session.getAttribute("user");
		
		Cookie[] cookies = request.getCookies();
		System.out.println("-----------------cookies ? : " + cookies);
		System.out.println("-----------------cookies.length ? : " + cookies.length);
		System.out.println("-----------------cookies.get ? : " + cookies[0]);
		System.out.println("-----------------cookies.get.get ? : " + cookies[0].getValue());
		if ( cookies != null && cookies.length > 0 ) {
			for (int i = 0; i < cookies.length; i++) {
				
				Cookie cookie = cookies[i];
				
				if (cookie.getName().equals("history")) {
					history = cookie.getValue();
				}
			}
			if ( history != null ) {
				String[] h = history.split(",");
				
				for ( int i = 0; i < h.length; i++ ) {
					int hobbyClassNo = Integer.parseInt(h[i]);
					System.out.println("------history hobbyClassNo ? : " + hobbyClassNo);
					HobbyClass hobbyClass = new HobbyClass();
					
					Map<String, Object> inputData = new HashMap<String, Object>();
					inputData.put("hobbyClass", hobbyClassNo);
					inputData.put("userId", user.getUserId());
					
					hobbyClass = searchHobbyClassService.getHobbyClass(inputData);
					
					hobbyClassList.add(hobbyClass);
				}
			}
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("recentlyHobbyClassList", hobbyClassList);
		System.out.println("-----------returnMap ? : " + returnMap);
		return null;
	}
	*/
	
	// 더미데이터 저장용
	@RequestMapping( value = "addDummyData" ) 
	public String addDummyData() throws Exception {
		HobbyClass hobbyClass = new HobbyClass();
		
		String userId = "c1@naver.com";
		String classTitle = "Circle Line Art School-연필 드로잉";
		String classImage = "art-main1.jpg";
		String classState = "3";
		int classPrice = 500000;
		String category = "A";
		Date startDate = Date.valueOf("2020-01-24");
		Date endDate = Date.valueOf("2020-07-24");
		int totalStudent = 5;
		int totalSteam = 10;
		String kitTitle = "더웬트 연필 드로잉 세트";
		int kitPrice = 100000;
		String kitImage = "art-kit.jpg";
		String kitIntro = "<p><img src=\"/images/min/art-kit.jpg\" style=\"width: 50%;\"></p><p><br></p><p><b>파버카스텔 9000 연필 (HB, 3B)</b></p><p>전체적인 스케치와 베이스 톤에 사용되는 연필 입니다.</p><p><br></p><p><b>스테들러 마스 연필 (6B)</b></p><p>가장 진한 부분 위주로 강조할 때 주로 사용되는 연필 입니다.</p><p><br></p><p><b>톰보 지우개 (기본형)&nbsp;</b></p><p>깔끔하게 연필 선을 지울 수 있습니다.</p><p><br></p><p><b>16절 스케치북 (20매/좌철)</b></p><p>켄트지로 구성된 스케치북입니다. 커버 디자인은 변경될 수 있습니다.</p><p><br></p><p><b>연필깍지 (2개입)</b></p><p>연필이 짧아졌을 경우 사용하는 펜슬홀더입니다.</p><p><br></p><p><b>펜슬케이스</b></p><p>연필 및 각종 펜을 보관할 수 있는 휴대하기 편한 케이스입니다.</p><p><br></p><p>&nbsp;</p><p><br></p>";
		int totalLesson = 10;
		
		User user = new User();
		user.setUserId(userId);
		
		hobbyClass.setUser(user);
		
		hobbyClass.setHobbyClassName(classTitle);
		hobbyClass.setHobbyClassImage(classImage);
		hobbyClass.setHobbyClassState(classState);
		hobbyClass.setHobbyClassPrice(classPrice);
		hobbyClass.setCategory(category);
		hobbyClass.setStartDate(startDate);
		hobbyClass.setEndDate(endDate);
		hobbyClass.setHobbyClassPersonnel(totalStudent);
		hobbyClass.setSteamCount(totalSteam);
		hobbyClass.setKitName(kitTitle);
		hobbyClass.setKitPrice(kitPrice);
		hobbyClass.setKitImage(kitImage);
		hobbyClass.setKitIntro(kitIntro);
		hobbyClass.setLessonTotalCount(totalLesson);
		
		String classIntro = "<div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">환영합니다! Circle Line Art School의 연필 드로잉 수업입니다.</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><img src=\"/images/min/art-main1.jpg\" style=\"width: 50%;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">여러분들은 1점 관점으로 드로잉 하는 법을 집중적으로 배우게 될 것입니다.&nbsp;</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">총 10개의 강의 영상이 있으며 이를 최대 30일동안 배우게 될 것입니다.&nbsp;</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><img src=\"/images/min/1_point_Perspective_first.jpg\" style=\"width: 50%;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">여러분들은 강의 영상을 보며 시간이 부족할 수도 있다고 걱정하실 수 있을지 모르겠지만,</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">걱정하지 않으셔도 됩니다!&nbsp;</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">해당 클래스가 종강될 때 까지 총 6개월동안 여러분들은 언제나 수업을 들으실 수 있으니까요.&nbsp;</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><img src=\"/images/min/1_point_Perspective_second.jpg\" style=\"width: 50%;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">처음 세 개의 강의 영상에서는 1점 관점에 대한 기초적인 사항을 배우게 될 것입니다.</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">그 뒤 바로 거리를 1점 관점으로 그려봄으로써 여러분들이 얼마나 익숙하게 연필 드로잉을 할 수 있는지&nbsp;확인하실 수 있으실 겁니다.</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><img src=\"/images/min/multiple_1_point_Perspective_buliding_on_street.jpg\" style=\"width: 50%;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">다음으로는 간단하게 다중 관점으로 연필 드로잉을 하는 방법에 대해 알려 드릴 겁니다.</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">물론 해당 강의 영상은 이 클래스의 주제에는 다소 맞지 않지만, 경험해 보는 것 또한&nbsp;</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">좋은 경험이 될 것입니다.</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><img src=\"/images/min/pencil_drawing_road.jpg\" style=\"width: 50%;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><br></div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">이 후, 여러분들은 본격적으로 1점 관점으로 연필 드로잉을 그리는 방법에 대해 배우실 겁니다.</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">도로, 뉴욕, 멘해튼 다리, 도시, 도시 거리 뷰를 그리면서 여러분들이 원하실 때</div><div style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">언제라도 연필 드로잉을 그릴 수 있도록 반복, 숙달을 할 수 있으실 겁니다.</div>";
		
		hobbyClass.setHobbyClassIntro(classIntro);
		/*
		searchHobbyClassService.addDummyData(hobbyClass);
		
		searchHobbyClassService.addDummyDataHashtag("A01");
		searchHobbyClassService.addDummyDataHashtag("A02");
		searchHobbyClassService.addDummyDataHashtag("A03");
		*/
		
		hobbyClass.setHobbyClassNo(10000);
		searchHobbyClassService.addDummyData(hobbyClass);
		
		Lesson lesson = new Lesson();
		lesson.setLessonNo(10000);
		lesson.setLessonContent(classIntro);
		lessonService.updateLessonDummyData(lesson);
		
		hobbyClass = new HobbyClass();
		hobbyClass.setHobbyClassNo(10012);
		hobbyClass.setHobbyClassIntro("<h5><b>사랑스러운 강아지 얼굴을 만들고 싶다면, 누구든</b></h5><h6><img src=\"/images/min/ssal-1.jpg\" style=\"width: 633px;\"></h6><p>펠트가 처음이신 분들도, 만들기가 서툰 분들도 괜찮아요.</p><p>우리 집 작은 가족을 사랑하는 <b>따뜻한 마음</b>을 담아 만들다 보면, 조금 서툴더라도 하나뿐인&nbsp;</p><p>나만의 강아지 얼굴을 만드실 수 있을 거예요.</p><h5><span style=\"font-weight: bolder;\">서툴어도 괜찮아요. 차근차근 완성해요.</span></h5><h5><img src=\"/images/min/ssal-2.jpg\" style=\"width: 630px;\"><span style=\"font-weight: bolder;\"><br></span></h5><p><img src=\"/images/min/ssal-3.jpg\" style=\"width: 618px;\"><br></p><p>우리 집 강아지를 만들어 낼 수 있도록, 저와 함께 <b>몇 가지 대표 견종</b>을 만들며 연습을&nbsp;</p><p>해보실 거예요.</p><p>다양한 친구들의 얼굴을 만들며 <b>여러 가지 팁</b>들을 알려드릴게요!</p><p><b>가지각색</b>의 모색, 모질, 귀모양, 표정의 강아지들을 만들며, 기초부터 탄탄히 노하우를 익혀요!</p><p>결국엔 <b>여러분이 키우고 계신 사랑스러운 강아지</b>의 미니미를 만들 수 있는 실력을</p><p>갖추게 되실 거예요!</p><p><br></p><p><img src=\"/images/min/ssal-4.jpg\" style=\"width: 632px;\"></p><p>우리 집 강아지 얼굴을 들여다보며, 사랑하는 마음을 담아 미니미를 만드는 건 누구나 분명&nbsp;</p><p><b>즐겁고 행복한 일</b>일 거예요.&nbsp;&nbsp;</p><p>그렇게 만들어진 미니미를<b> 키 링이나 액자로 만들어 매일 함께한다면 더욱 좋겠죠?</b></p><p>이번 클래스는 단순히 강아지 얼굴만을 만드는 것이 아닌, 키 링과 액자 등의 소품으로&nbsp;</p><p>완성하도록 구성됩니다.</p><p>키 링으로 일상생활에서 늘 함께 지니고 다니거나, 액자로 오래도록 예쁜 얼굴 그대로&nbsp;</p><p>간직하실 수 있어요.</p>");
		
		searchHobbyClassService.addDummyData(hobbyClass);
		
		return null;
	}
	
	@RequestMapping( value = "getCommunityContent" )
	public String getCommunityContent(@RequestParam("articleNo") int articleNo, Model model) throws Exception {
		System.out.println("/getCommunity");
		System.out.println("articleNo:"+articleNo);
		
		Map<String, Object> map = communityService.getCommunity(articleNo);
		Article article = (Article) map.get("article");
		
		System.out.println(article.getUser());
		List<Reply> list = (List<Reply>)map.get("replyList");
		for (int i = 0; i < list.size(); i++) {
//			System.out.println("replyList의 ----"+list.get(i).getReplyNo());
//			System.out.println(list.get(i).getRegDate());
//			System.out.println(list.get(i).getUser().getName());
		}
		//System.out.println(map.get("replyList"));
		
		model.addAttribute("article", map.get("article"));
		model.addAttribute("replyList", list);
//		return "forward:/community/getCommunity.jsp";
		
		return "forward:/searchhobbyclass/getCommunityTest.jsp";
	}
	
	@RequestMapping(value = "getCommunity") //==> method = RequestMethod.GET으로 설정하면 안됨
	public String getCommunity(@RequestParam("articleNo") int articleNo, 
									Model model)throws Exception{
		
		System.out.println("/getCommunity");
		System.out.println("articleNo:"+articleNo);
		
		Map<String, Object> map = communityService.getCommunity(articleNo);
		Article article = (Article) map.get("article");
		
		System.out.println(article.getUser());
		List<Reply> list = (List<Reply>)map.get("replyList");

		model.addAttribute("article", map.get("article"));
		model.addAttribute("replyList", list);
		return "forward:/questionreport/getReportTargetCommunityArticle.jsp";
	}

	
	@RequestMapping( value = "getPreview" )
	public String getPreview(@RequestParam("hobbyClassNo") String hobbyClassNo, Model model) throws Exception {
		// 클래스 가져오기 ----------------------
		Map<String, Object> inputData = new HashMap<String, Object>();

		inputData.put("hobbyClassNo", hobbyClassNo);
		
		HobbyClass hobbyClass = searchHobbyClassService.getHobbyClass(inputData);
		
		model.addAttribute("hobbyClass", hobbyClass);
		// 클래스 가져오기 ----------------------
		
		// 클래스 강의 가져오기 -----------------------------
		Map<String, Object> resultMap = lessonService.getLessonList(Integer.parseInt(hobbyClassNo));
		
		List<Lesson> lessonList = (List<Lesson>)resultMap.get("list");
		int total = (Integer)resultMap.get("total");
		model.addAttribute("lessonList", resultMap.get("list"));
		
		Page lessonCountResultPage = new Page( 1, total, pageUnit, 3);
		System.out.println("lessonCountResultPage ? : " + lessonCountResultPage);
		model.addAttribute("lessonCountResultPage", lessonCountResultPage);
		// 클래스 강의 가져오기 -----------------------------
		
		//return "forward:/searchhobbyclass/getHobbyClassIntro.jsp";
		return "forward:/openhobbyclass/getPreview.jsp";
	}
	
}
