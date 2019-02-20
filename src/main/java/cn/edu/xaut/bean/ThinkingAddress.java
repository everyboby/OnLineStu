package cn.edu.xaut.bean;

import java.io.Serializable;

public class ThinkingAddress implements Serializable{
	private static final long serialVersionUID = 1L;

	private Integer addressId;

    private String key;

    private String parent;

    private String text;

    private String dir;

    private String brush;

    private String loc;

    private String addressThinkFlag;

	public ThinkingAddress() {
		super();
	}

	public ThinkingAddress(Integer addressId, String key, String parent, String text, String dir, String brush,
			String loc, String addressThinkFlag) {
		super();
		this.addressId = addressId;
		this.key = key;
		this.parent = parent;
		this.text = text;
		this.dir = dir;
		this.brush = brush;
		this.loc = loc;
		this.addressThinkFlag = addressThinkFlag;
	}

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getBrush() {
		return brush;
	}

	public void setBrush(String brush) {
		this.brush = brush;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	@Override
	public String toString() {
		return "ThinkingAddress [addressId=" + addressId + ", key=" + key + ", parent=" + parent + ", text=" + text
				+ ", dir=" + dir + ", brush=" + brush + ", loc=" + loc + ", addressThinkFlag=" + addressThinkFlag + "]";
	}

	public String getAddressThinkFlag() {
		return addressThinkFlag;
	}

	public void setAddressThinkFlag(String addressThinkFlag) {
		this.addressThinkFlag = addressThinkFlag;
	}
    
}