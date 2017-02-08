package com.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;



@Entity
public class Connections {
	@Id @GeneratedValue
	private int connectionId;
	private String connectionFrom;
	private String connectionTo;
	public int getConnectionId() {
		return connectionId;
	}
	public void setConnectionId(int connectionId) {
		this.connectionId = connectionId;
	}
	public String getConnectionFrom() {
		return connectionFrom;
	}
	public void setConnectionFrom(String connectionFrom) {
		this.connectionFrom = connectionFrom;
	}
	public String getConnectionTo() {
		return connectionTo;
	}
	public void setConnectionTo(String connectionTo) {
		this.connectionTo = connectionTo;
	}
	

}
