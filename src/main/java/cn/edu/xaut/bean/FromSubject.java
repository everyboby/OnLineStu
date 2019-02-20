package cn.edu.xaut.bean;

import java.io.Serializable;

public class FromSubject implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer subjectId;

	private String subjectName;
	
	public FromSubject() {
		super();
	}

	public FromSubject(String subjectName) {
		super();
		this.subjectName = subjectName;
	}

	public FromSubject(Integer subjectId, String subjectName) {
		super();
		this.subjectId = subjectId;
		this.subjectName = subjectName;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	@Override
	public String toString() {
		return "FromSubject [subjectId=" + subjectId + ", subjectName=" + subjectName + "]";
	}
}