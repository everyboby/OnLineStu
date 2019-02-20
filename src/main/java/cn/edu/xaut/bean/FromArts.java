package cn.edu.xaut.bean;

import java.io.Serializable;

public class FromArts implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer artsId;

	private String artsName;
	
	public FromArts() {
		super();
	}
	
	public FromArts(String artsName) {
		super();
		this.artsName = artsName;
	}

	public Integer getArtsId() {
		return artsId;
	}

	public void setArtsId(Integer artsId) {
		this.artsId = artsId;
	}

	public String getArtsName() {
		return artsName;
	}

	public void setArtsName(String artsName) {
		this.artsName = artsName;
	}

	@Override
	public String toString() {
		return "FromArts [artsId=" + artsId + ", artsName=" + artsName + "]";
	}
	
}