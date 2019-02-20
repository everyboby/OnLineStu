package cn.edu.xaut.bean;

public class ExamPoint {
    private Long pointId;

    private String pointName;

    private String pointVideourl;

    private String pointThinkFlag;
    
    public ExamPoint() {
		super();
	}
    

	public ExamPoint(String pointName, String pointThinkFlag) {
		super();
		this.pointName = pointName;
		this.pointThinkFlag = pointThinkFlag;
	}


	public Long getPointId() {
        return pointId;
    }

    public void setPointId(Long pointId) {
        this.pointId = pointId;
    }

    public String getPointName() {
        return pointName;
    }

    public void setPointName(String pointName) {
        this.pointName = pointName;
    }

    public String getPointVideourl() {
        return pointVideourl;
    }

    public void setPointVideourl(String pointVideourl) {
        this.pointVideourl = pointVideourl;
    }

    public String getPointThinkFlag() {
        return pointThinkFlag;
    }

    public void setPointThinkFlag(String pointThinkFlag) {
        this.pointThinkFlag = pointThinkFlag;
    }
}