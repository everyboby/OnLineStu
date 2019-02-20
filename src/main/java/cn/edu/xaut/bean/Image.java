package cn.edu.xaut.bean;

import java.io.Serializable;

public class Image implements Serializable {
	private static final long serialVersionUID = 1L;
	private String name;
	private String url;
	private String uuidName;

	public Image() {
		super();
	}

	public Image(String name, String url, String uuidName) {
		super();
		this.name = name;
		this.url = url;
		this.uuidName = uuidName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUuidName() {
		return uuidName;
	}

	public void setUuidName(String uuidName) {
		this.uuidName = uuidName;
	}

	@Override
	public String toString() {
		return "Image [name=" + name + ", url=" + url + ", uuidName=" + uuidName + "]";
	}

}
