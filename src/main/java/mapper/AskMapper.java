package mapper;

import pojo.LeaveBill;

public interface AskMapper extends SysMapper<LeaveBill>{

	LeaveBill[] findNow(int userId);

	LeaveBill[] findList(int userId);

	void submitAsk(LeaveBill leavebill);

	LeaveBill findByLeaveBillId(String leavebillId);

	void deleteByLeaveBillId(String leavebillId);
	
}
