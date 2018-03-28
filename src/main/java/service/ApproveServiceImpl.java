package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.ApproveMapper;
import pojo.LeaveBill;

@Service
public class ApproveServiceImpl implements ApproveService {
	@Autowired
	private ApproveMapper approveMapper;

	@Override
	public List<LeaveBill> findListByeLevel(int userLevel) {
		return approveMapper.findListByeLevel(userLevel);
	}

	@Override
	public List<LeaveBill> findapproveListByeLevel(int userLevel) {
		return approveMapper.findapproveListByeLevel(userLevel);
	}

	@Override
	public List<LeaveBill> findreloadListByeLevel(int userLevel) {
		return approveMapper.findreloadListByeLevel(userLevel);
	}

	@Override
	public List<LeaveBill> findhistoryListByeLevel(int userLevel) {
		return approveMapper.findhistoryListByeLevel(userLevel);
	}

	@Override
	public void changeState(String[] leavebillIds, int temp) {
		LeaveBill[] lbTemps = approveMapper.findListByLeaveBillId(leavebillIds);
		for (LeaveBill lbTemp : lbTemps) {
			int state = lbTemp.getState();
			int level = lbTemp.getLevel();
			int type = lbTemp.getType();
			if (temp < 0) {
				state = 1;
			} else {
				if (level == 1) {
					if (type == 1) {
						if (state == 4) {
							state = 0;
						} else {
							state = 3;
						}
					} else {
						state = 0;
					}
				} else {
					state = 2;
					lbTemp.setLevel(lbTemp.getLevel()-1);
				}
			}

			approveMapper.updateState(lbTemp.getLeavebillId(), state, lbTemp.getLevel());
		}
	}

	@Override
	public LeaveBill viewByLeaveBillId(String leavebillId) {
		return approveMapper.findByLeaveBillId(leavebillId);
	}

}
