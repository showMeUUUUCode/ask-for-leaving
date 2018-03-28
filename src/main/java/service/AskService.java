package service;

import pojo.LeaveBill;

public interface AskService {

	void submitAsk(LeaveBill leavebill);

	LeaveBill[] findNow(int userId);

	LeaveBill[] findList(int userId);

	LeaveBill findByLeaveBillId(String leavebillId);

	void deleteByLeaveBillId(String leavebillId);


}
