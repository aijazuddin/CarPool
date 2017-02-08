package com.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Ride  {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(nullable = false)
	private String source;
	@Column(nullable = false)
	private String destination;
	
	private String travelDate;
	
	private String time;
	
	private String seats;
	
	private long totalCost;
	
	private long totalCostPerPassenger;
	
	private long mobileNumber;
	
	private String postedBy;

	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name="id")
	private List<RideDriver> rideDrivers;*/
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSeats() {
		return seats;
	}

	public void setSeats(String seats) {
		this.seats = seats;
	}

	public long getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(long totalCost) {
		this.totalCost = totalCost;
	}

	public long getTotalCostPerPassenger() {
		return totalCostPerPassenger;
	}

	public void setTotalCostPerPassenger(long totalCostPerPassenger) {
		this.totalCostPerPassenger = totalCostPerPassenger;
	}

	public long getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getPostedBy() {
		return postedBy;
	}

	public void setPostedBy(String postedBy) {
		this.postedBy = postedBy;
	}

/*	public List<RideDriver> getRideDrivers() {
		return rideDrivers;
	}

	public void setRideDrivers(List<RideDriver> rideDrivers) {
		this.rideDrivers = rideDrivers;
	}*/

	public String getTravelDate() {
		return travelDate;
	}

	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}
	
	
		
}
