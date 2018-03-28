package service;

import java.util.List;

import pojo.LeaveBill;

public interface ApproveService {

	List<LeaveBill> findListByeLevel(int userLevel);

	List<LeaveBill> findapproveListByeLevel(int userLevel);

	List<LeaveBill> findreloadListByeLevel(int userLevel);

	List<LeaveBill> findhistoryListByeLevel(int userLevel);

	void changeState(String[] leavebillIds, int temp);

	LeaveBill viewByLeaveBillId(String leavebillId);

}
