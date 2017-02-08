package com.service;

import java.util.List;

import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import com.pojo.Ride;
import com.pojo.UserDetails;

public interface UserService {
	boolean validateLogin(String userid, String pwd);
	public UserDetails getUserDetails(String userid);
	public ModelAndView updateDetails(UserDetails userDetails);
	public boolean postRideAsPassenger(Ride ride);
	//public boolean postRideAsDriver(Ride ride);
	
	public List<Ride> getRideAsPassenger();
	public List<Ride> getRideAsDriver();
	
	ModelAndView loginValidation(String userid, String pwd);
	ModelAndView publishPost(String postedMessage, String userid, String postTo);
	
	public ModelAndView addFriend(String friend, String userid);
	public ModelAndView group(String option, String userid);
	public ModelAndView accountSettings(String option, String userid);
	public ModelAndView manageAccount(UserDetails updateDetails,
			BindingResult result);
	boolean postRideAsDriver(Ride ride);
}
