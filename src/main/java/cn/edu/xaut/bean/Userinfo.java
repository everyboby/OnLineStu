package cn.edu.xaut.bean;

import java.io.Serializable;

public class Userinfo implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long userId;

	private String userName;

	private String userPwd;

	private String userEmail;

	private String userIsroot;

	private String userPower;

	private int add;// 1
	private int del;// 2
	private int upd;// 4

	public int getAdd() {
		return add;
	}

	public void setAdd(int add) {
		this.add = add;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getUpd() {
		return upd;
	}

	public void setUpd(int upd) {
		this.upd = upd;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserIsroot() {
		return userIsroot;
	}

	public void setUserIsroot(String userIsroot) {
		this.userIsroot = userIsroot;
	}

	public String getUserPower() {
		return userPower;
	}

	public void setUserPower(String userPower) {
		this.userPower = userPower;
		if ("0".equals(userPower)) {
			this.setAdd(0);
			this.setDel(0);
			this.setUpd(0);
		} else if ("1".equals(userPower)) {
			this.setAdd(1);
			this.setDel(0);
			this.setUpd(0);
		} else if ("2".equals(userPower)) {
			this.setAdd(0);
			this.setDel(1);
			this.setUpd(0);
		} else if ("3".equals(userPower)) {
			this.setAdd(1);
			this.setDel(1);
			this.setUpd(0);
		} else if ("4".equals(userPower)) {
			this.setAdd(0);
			this.setDel(0);
			this.setUpd(1);
		} else if ("5".equals(userPower)) {
			this.setAdd(1);
			this.setDel(0);
			this.setUpd(1);
		} else if ("6".equals(userPower)) {
			this.setAdd(0);
			this.setDel(1);
			this.setUpd(1);
		} else if ("7".equals(userPower)) {
			this.setAdd(1);
			this.setDel(1);
			this.setUpd(1);
		}
	}

	@Override
	public String toString() {
		return "Userinfo [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", userEmail="
				+ userEmail + ", userIsroot=" + userIsroot + ", userPower=" + userPower + ", add=" + add + ", del="
				+ del + ", upd=" + upd + "]";
	}
}