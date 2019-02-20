package cn.edu.xaut.bean;

import java.io.Serializable;

public class FromSign implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer signId;

	private String signName;
	
	public FromSign() {
		super();
	}

	public FromSign(String signName) {
		super();
		this.signName = signName;
	}

	public FromSign(Integer signId, String signName) {
		super();
		this.signId = signId;
		this.signName = signName;
	}

	public Integer getSignId() {
		return signId;
	}

	public void setSignId(Integer signId) {
		this.signId = signId;
	}

	public String getSignName() {
		return signName;
	}

	public void setSignName(String signName) {
		this.signName = signName;
	}

	@Override
	public String toString() {
		return "FromSign [signId=" + signId + ", signName=" + signName + "]";
	}
	
}