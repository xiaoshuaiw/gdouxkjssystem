package cn.xkjs.vo;

public class MsgVo {
	private int msgId;
	private String msgContent;
	
	public int getMsgId() {
		return msgId;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	
	public MsgVo(int msgId, String msgContent) {
		super();
		this.msgId = msgId;
		this.msgContent = msgContent;
	}
	public MsgVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
