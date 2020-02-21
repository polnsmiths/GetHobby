package com.gethobby.service.purchase;

import java.util.List;
import java.util.Map;

import com.gethobby.common.Search;
import com.gethobby.service.domain.HobbyClass;
import com.gethobby.service.domain.Purchase;
//2020-02-21 Git Commit
public interface PurchaseDAO {
	
	public HobbyClass getComponentOption(int hobbyClassNo) throws Exception; // Out : Ŭ���� ����, �غ� ����, �غ� �̸�, Ŭ���� �̸�, Ŭ����id, 
	
	public Purchase getPayment(String userId) throws Exception; // Out : �������(�̸�,�޴���,����ּ�,�������ּ�,�����ȣ) / ������ �Է½� flagó�� ���
	
	public int addPayment(Purchase purchase) throws Exception; // In : �������(�̸�,�޴���,����ּ�,�������ּ�,�����ȣ,��û����), ����ǰ��, ���űݾ�, �������, Ŭ����ID
	
	public Purchase getPurchase(String purchaseId) throws Exception;
	
	public List getPaymentHistoryList(Search search) throws Exception; // Out : ����Id, ���Ż���, ��ۻ���, ���Ű���, ����ǰ��, �غ���ü���, Ŭ���� ����, �̹���, ī�װ�, �ؽ��±�
	
	public int getTotalPurchase(String userId) throws Exception;
	
	public HobbyClass getPurchaseHobbyClass(int hobbyClassId) throws Exception;
	
	public Purchase getDelivery(String userId) throws Exception; // Out : ������� ���
	
	public int requestRefund(String purchaseId) throws Exception;
	
	public int getLessonNoASC(int hobbyClassNo) throws Exception;
	
	// Admin
	public List getPaymentHistoryListAdmin(Search search) throws Exception; // Out : ����ǰ��, ����ID, ȸ��ID,����,�������, ����
	
	public int getPurchaseTotalCountAdmin(Map<String, Object> totalCountMap) throws Exception;
	
	public int updateRefund(String purchaseId) throws Exception; 
	
	public int addDeliveryInfo(Purchase purchase) throws Exception;
	
	public String getMoneyAnalysisSum(String date) throws Exception;
	
	public int getMoneyAnalysisAvg(Map<String, Object> keyWordAndWhat) throws Exception;
	
	public int getMoneyAnalysisCount(Map<String, Object> keyWordAndWhat) throws Exception;
	
	public List getCreatorList() throws Exception; // Out : ũ�������� ȸ�� ����Ʈ
	
	public int startingPurchaseData(Purchase purchase) throws Exception;
	
}//end of interface PurchaseDAO
