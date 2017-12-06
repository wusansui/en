package com.oa.pojo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Department implements Serializable{

	private Long id;
	private String name;
	private String note;
	private User manager;
	private Set<User> users=new HashSet<User>();
	
	public Department() {
	}
	
	public Department(String name, String note) {
		this.name = name;
		this.note = note;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public User getManager() {
		return manager;
	}

	public void setManager(User manager) {
		this.manager = manager;
	}
	
}
