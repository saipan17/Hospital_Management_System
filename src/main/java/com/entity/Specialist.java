package com.entity;

public class Specialist {
	
	private int id;
	private String spec_name;
	
    public Specialist() {
	   super();
    }
	
	public Specialist(int id, String spec_name) {
		super();
		this.id = id;
		this.spec_name = spec_name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSpec_name() {
		return spec_name;
	}
	public void setSpec_name(String spec_name) {
		this.spec_name = spec_name;
	}
	
}
