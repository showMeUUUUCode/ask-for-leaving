package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.AskMapper;
import pojo.LeaveBill;

@Service
public class AskServiceImpl implements AskService {
	@Autowired
	private AskMapper askMapper;

	@Override
	public void submitAsk(LeaveBill leavebill) {
		askMapper.submitAsk(leavebill);
	}

	@Override
	public LeaveBill[] findNow(int userId) {
		return askMapper.findNow(userId);
	}

	@Override
	public LeaveBill[] findList(int userId) {
		return askMapper.findList(userId);
	}

	@Override
	public LeaveBill findByLeaveBillId(String leavebillId) {
		return askMapper.findByLeaveBillId(leavebillId);
	}

	@Override
	public void deleteByLeaveBillId(String leavebillId) {
		askMapper.deleteByLeaveBillId(leavebillId)	;
	}


}
