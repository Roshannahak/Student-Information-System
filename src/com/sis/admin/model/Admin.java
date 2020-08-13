package com.sis.admin.model;

public class Admin {
	
	private String id;
	private String password;
	private String first;
	private String last;
	private String email;
	private String phone;
	private String designation;
	
	//default constructor
	public Admin() {
		//Default
	}
	
	//parameterized constructor 
	public Admin(String id, String password, String first, String last, String email, String phone, String designation) {
		this.id = id;
		this.password = password;
		this.first = first;
		this.last = last;
		this.email = email;
		this.phone = phone;
		this.designation = designation;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirst() {
		return first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public String getLast() {
		return last;
	}

	public void setLast(String last) {
		this.last = last;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}
	
}
