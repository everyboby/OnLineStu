package cn.edu.xaut.bean;

public class Thinkinginfo {
	private Integer thinkId;

	private String thinkdate;

	private String thinkUserName;

	private String thinkTheme;

	private String thinkFlag;

	private String thinkImg;

	private String thinkData;

	public String getThinkData() {
		return thinkData;
	}

	public void setThinkData(String thinkData) {
		this.thinkData = thinkData;
	}

	public Integer getThinkId() {
		return thinkId;
	}

	public void setThinkId(Integer thinkId) {
		this.thinkId = thinkId;
	}

	public String getThinkdate() {
		return thinkdate;
	}

	public void setThinkdate(String thinkdate) {
		this.thinkdate = thinkdate;
	}

	public String getThinkUserName() {
		return thinkUserName;
	}

	public void setThinkUserName(String thinkUserName) {
		this.thinkUserName = thinkUserName;
	}

	public String getThinkTheme() {
		return thinkTheme;
	}

	public void setThinkTheme(String thinkTheme) {
		this.thinkTheme = thinkTheme;
	}

	public String getThinkFlag() {
		return thinkFlag;
	}

	public void setThinkFlag(String thinkFlag) {
		this.thinkFlag = thinkFlag;
	}

	public String getThinkImg() {
		return thinkImg;
	}

	public void setThinkImg(String thinkImg) {
		this.thinkImg = thinkImg;
	}

	@Override
	public String toString() {
		return "Thinkinginfo [thinkId=" + thinkId + ", thinkdate=" + thinkdate + ", thinkUserName=" + thinkUserName
				+ ", thinkTheme=" + thinkTheme + ", thinkFlag=" + thinkFlag + ", thinkImg=" + thinkImg + ", thinkData="
				+ thinkData + "]";
	}

}