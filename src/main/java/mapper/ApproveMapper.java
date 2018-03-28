package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.LeaveBill;

public interface ApproveMapper {

	List<LeaveBill> findListByeLevel(int userLevel);

	List<LeaveBill> findapproveListByeLevel(int userLevel);

	List<LeaveBill> findreloadListByeLevel(int userLevel);

	List<LeaveBill> findhistoryListByeLevel(int userLevel);

	LeaveBill[] findListByLeaveBillId(String[] leavebillId);

	void updateState(@Param("leavebillId")String leavebillId, @Param("state")int state, @Param("level")int level);

	LeaveBill findByLeaveBillId(String leavebillIds);
}
