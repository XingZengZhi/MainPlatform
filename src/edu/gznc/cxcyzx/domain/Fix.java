package edu.gznc.cxcyzx.domain;

import java.util.HashSet;
import java.util.Set;

public class Fix {
	private long fix_id;
	private String fix_name;
	private String fix_pass;
	private String fix_tel;
	private Set<equipment> eqs = new HashSet<equipment>();
	public long getFix_id() {
		return fix_id;
	}
	public void setFix_id(long fix_id) {
		this.fix_id = fix_id;
	}
	public String getFix_name() {
		return fix_name;
	}
	public void setFix_name(String fix_name) {
		this.fix_name = fix_name;
	}
	public String getFix_pass() {
		return fix_pass;
	}
	public void setFix_pass(String fix_pass) {
		this.fix_pass = fix_pass;
	}
	public String getFix_tel() {
		return fix_tel;
	}
	public void setFix_tel(String fix_tel) {
		this.fix_tel = fix_tel;
	}
	public Set<equipment> getEqs() {
		return eqs;
	}
	public void setEqs(Set<equipment> eqs) {
		this.eqs = eqs;
	}
}
