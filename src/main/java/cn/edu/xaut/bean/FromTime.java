package cn.edu.xaut.bean;

import java.io.Serializable;

public class FromTime implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long fromId;

	private String fromTime;
	
	public FromTime() {
		super();
	}
	
	public FromTime(String fromTime) {
		super();
		this.fromTime = fromTime;
	}

	public FromTime(Long fromId, String fromTime) {
		super();
		this.fromId = fromId;
		this.fromTime = fromTime;
	}

	public Long getFromId() {
		return fromId;
	}

	public void setFromId(Long fromId) {
		this.fromId = fromId;
	}

	public String getFromTime() {
		return fromTime;
	}

	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}

	@Override
	public String toString() {
		return "FromTime [fromId=" + fromId + ", fromTime=" + fromTime + "]";
	}
	
}