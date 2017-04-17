package edu.gznc.cxcyzx.domain;

public class equipment {
	private long eq_id;
	private String eq_name;
	private String eq_fixtime;
	private String eq_message;
	private String eq_space;
	private Integer eq_sta;
	private User user;
	private Fix fixer;
	private Classify classify;
	public Integer getEq_sta() {
		return eq_sta;
	}
	public void setEq_sta(Integer eq_sta) {
		this.eq_sta = eq_sta;
	}
	public Classify getClassify() {
		return classify;
	}
	public void setClassify(Classify classify) {
		this.classify = classify;
	}
	public long getEq_id() {
		return eq_id;
	}
	public void setEq_id(long eq_id) {
		this.eq_id = eq_id;
	}
	public String getEq_name() {
		return eq_name;
	}
	public void setEq_name(String eq_name) {
		this.eq_name = eq_name;
	}
	public String getEq_fixtime() {
		return eq_fixtime;
	}
	public void setEq_fixtime(String eq_fixtime) {
		this.eq_fixtime = eq_fixtime;
	}
	public String getEq_message() {
		return eq_message;
	}
	public void setEq_message(String eq_message) {
		this.eq_message = eq_message;
	}
	public String getEq_space() {
		return eq_space;
	}
	public void setEq_space(String eq_space) {
		this.eq_space = eq_space;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Fix getFixer() {
		return fixer;
	}
	public void setFixer(Fix fixer) {
		this.fixer = fixer;
	}
}
