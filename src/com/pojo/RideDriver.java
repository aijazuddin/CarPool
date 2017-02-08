package com.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class RideDriver {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int rdid;
	
	private String name;
	
	private String review;
	
	@ManyToOne
	@JoinColumn(name="id", 
				insertable=false, updatable=false, 
				nullable=false)
	private Ride ride;


	public int getRdid() {
		return rdid;
	}


	public void setRdid(int rdid) {
		this.rdid = rdid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getReview() {
		return review;
	}


	public void setReview(String review) {
		this.review = review;
	}


	public Ride getRide() {
		return ride;
	}


	public void setRide(Ride ride) {
		this.ride = ride;
	}
	
	
}
