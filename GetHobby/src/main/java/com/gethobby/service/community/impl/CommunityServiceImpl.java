package com.gethobby.service.community.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.gethobby.common.Search;
import com.gethobby.service.community.CommunityDAO;
import com.gethobby.service.community.CommunityService;
import com.gethobby.service.domain.Article;
import com.gethobby.service.domain.Reply;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	@Qualifier("communityDAOImpl")
	CommunityDAO communityDAO;
	
	public CommunityServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Article getCommunityArticle(int articleNo) throws Exception {
		// TODO Auto-generated method stub
		return communityDAO.getCommunityArticle(articleNo);
		
	}

	@Override
	public void addCommunityArticle(Article article) throws Exception {
		//System.out.println("ServiceImpl:"+article);
		communityDAO.addCommunityArticle(article);
	}

	@Override
	public void updateCommunityArticle(Article article) throws Exception {
		
		communityDAO.updateCommunityArticle(article);

	}

	@Override
	public void deleteCommunityArticle(int articleNo) throws Exception {
		
		System.out.println("delete하려는 ArticleNo: "+articleNo);
		communityDAO.deleteCommunityArticle(articleNo);
	}

	@Override
	public Reply getCommunityReply(int replyNo) throws Exception {
		return communityDAO.getCommunityReply(replyNo);
	}
	
	@Override
	public void addCommunityReply(Reply reply) throws Exception {
			communityDAO.addCommunityReply(reply);
	}
	
	@Override
	public void deleteCommunityReply(int replyNo) throws Exception {
		communityDAO.deleteCommunityReply(replyNo);
	}
	
	@Override
	public void updateCommunityReply(Reply reply) throws Exception {
		
		communityDAO.updateCommunityReply(reply);
	}
	
	@Override
	public Map<String, Object> getCommunity(int articleNo) throws Exception {

		System.out.println("가져올 articleNo:"+articleNo);
		Map<String, Object> map = new HashMap<String, Object>();
		Article article = communityDAO.getCommunityArticle(articleNo);
		List<Reply>replyList = communityDAO.getReplyListUnderArticle(articleNo);
		for (int i = 0; i < replyList.size(); i++) {
			System.out.println(replyList.get(i).getRegDate());
			System.out.println(replyList.get(i).getUser().getName());
		}
		
		map.put("article", article);
		map.put("replyList", replyList);
		return map;
	}
	
	@Override
	public List<Reply> getReplyListUnderArticle(int articleNo) throws Exception {

		List<Reply>replyList = communityDAO.getReplyListUnderArticle(articleNo);

		return replyList;
	}
	
	@Override
	public void updateSelectedCreator(List<Integer> list) throws Exception {
		
		//System.out.println("update할 글,댓글 list:"+list);
		communityDAO.updateSelectedCreator(list);
	}
	
	@Override
	public Map<String, Object> getCommunityList(Map serviceMap) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		//글 List
		List<Article>articlelist = communityDAO.getCommunityArticleList(serviceMap);
		//댓글 List
		List<Reply>replylistUnderOneArticle = new ArrayList<Reply>();
		List<List<Reply>> array = new ArrayList<List<Reply>>();
		for (int i = 0; i < articlelist.size(); i++) {
			replylistUnderOneArticle = communityDAO.getReplyListUnderArticle(articlelist.get(i).getArticleNo());
			array.add(i, replylistUnderOneArticle);
		}
		
		//글 총갯수
		int totalCountCommunityArticle =communityDAO.getTotalCountCommunityArticle((Integer)serviceMap.get("hobbyClassNo"));
		//System.out.println("totalCountCommunityArticle확인:"+totalCountCommunityArticle);
		
		map.put("totalCountCommunityArticle", totalCountCommunityArticle);
		map.put("articleList", articlelist);
		map.put("array", array);
		return map;
	}

}
