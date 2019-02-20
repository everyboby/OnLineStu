package cn.edu.xaut.bean;

public class FromClass {
    private Integer classId;

    private String className;
    
    public FromClass() {
		super();
	}
    
	public FromClass(String className) {
		super();
		this.className = className;
	}

	public FromClass(Integer classId, String className) {
		super();
		this.classId = classId;
		this.className = className;
	}

	public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

	@Override
	public String toString() {
		return "FromClass [classId=" + classId + ", className=" + className + "]";
	}
    
}