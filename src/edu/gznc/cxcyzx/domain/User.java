package edu.gznc.cxcyzx.domain;

import java.util.HashSet;
import java.util.Set;

public class User {
	private long uid;
	private String uname;
	private String upassword;
	private String utelphone;
	private String uimgpath;
	private Set<equipment> eqs = new HashSet<equipment>();
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUtelphone() {
		return utelphone;
	}
	public void setUtelphone(String utelphone) {
		this.utelphone = utelphone;
	}
	public String getUimgpath() {
		return uimgpath;
	}
	public void setUimgpath(String uimgpath) {
		this.uimgpath = uimgpath;
	}
	public Set<equipment> getEqs() {
		return eqs;
	}
	public void setEqs(Set<equipment> eqs) {
		this.eqs = eqs;
	}
}
