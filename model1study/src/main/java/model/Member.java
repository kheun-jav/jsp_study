package model;
/*
 * DTO : 데이터를 DB에 전달해주는 객체
 * Bean 클래스
 * 	get 프로퍼티 : gedId(){} => id 프로퍼티
 * 				 getXxx() => get xxx 프로퍼티
 *  set 프로퍼티 : setId() => id 프로퍼티
 *  			 setXxx() => set xxx 프로퍼티
 */
public class Member {
	private String id;
	private String pass;
	private String name;
	private int gender;
	private String tel;
	private String email;
	private String picture;
	//getter, setter, toString
	public String getId() {
		return id;
	}
	public String getPass() {
		return pass;
	}
	public String getName() {
		return name;
	}
	public int getGender() {
		return gender;
	}
	public String getTel() {
		return tel;
	}
	public String getEmail() {
		return email;
	}
	public String getPicture() {
		return picture;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", pass=" + pass + ", name=" + name + ", gender=" + gender + ", tel=" + tel
				+ ", email=" + email + ", picture=" + picture + "]";
	}

	
}
