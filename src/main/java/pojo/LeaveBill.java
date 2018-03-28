package pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="tb_leavebill")
public class LeaveBill implements Serializable{
	@Id
	private String leavebillId;
	private UserInfo userInfo;
	private int days;
	private int state;//状态：0 完成 1审批不通过 2待审批 3待上传资料4已上传
 	private int level;//请假等级：1 分管班委处理即可 2班主任处理 3 辅导员处理 4院长处理
	private int type;//请假类型：0 事假  1 病假
	private Date outDate;
	private String reason;
	private String remark;
	public String getLeavebillId() {
		return leavebillId;
	}
	public void setLeavebillId(String leavebillId) {
		this.leavebillId = leavebillId;
	}
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserinfo(UserInfo userinfo) {
		this.userInfo = userinfo;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getOutDate() {
		return outDate;
	}
	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
