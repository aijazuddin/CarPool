package com.service;

import java.util.List;

import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import com.dao.UserDaoImplementation;
import com.pojo.Ride;
import com.pojo.UserDetails;



public class UserServiceImplementation implements UserService {

	@Override
	public boolean validateLogin(String userid, String pwd) {
		UserDaoImplementation userDao = new UserDaoImplementation();
		return userDao.validateLogin(userid,pwd);

	}
	
	@Override
	public UserDetails getUserDetails(String userid){
		UserDaoImplementation userDao = new UserDaoImplementation();
		return userDao.getUserDetails(userid);
	}
	
	public boolean postRideAsPassenger(Ride ride){
		UserDaoImplementation userDao = new UserDaoImplementation();
		return userDao.postRideAsPassenger(ride);
	}
	
	public boolean postRideAsDriver(Ride ride){
		UserDaoImplementation userDao = new UserDaoImplementation();
		return userDao.postRideAsDriver(ride);
	}
	
	public List<Ride> getRideAsPassenger(){
		UserDaoImplementation userDao = new UserDaoImplementation();
		return userDao.getRideAsPassenger();
	}
	
	public List<Ride> getRideAsDriver(){
		UserDaoImplementation userDao = new UserDaoImplementation();
		return userDao.getRideAsDriver();
	}
	
	
	
	@Override
	public ModelAndView loginValidation(String userid, String pwd) {
		UserDaoImplementation userDao = new UserDaoImplementation();
		return userDao.loginValidation(userid,pwd);

	}

	@Override
	public ModelAndView publishPost(String postedMessage, String userid,
			String postTo) {
		UserDaoImplementation userDao = new UserDaoImplementation();
		return userDao.publishPost(postedMessage, userid, postTo);
	}

	public ModelAndView updateDetails(UserDetails userDetails) {
		UserDaoImplementation userDaoImplementation = new UserDaoImplementation();
		return userDaoImplementation.updateDetails(userDetails);
	}

	public ModelAndView addFriend(String friend, String userid) {
		UserDaoImplementation userDaoImplementation = new UserDaoImplementation();
		return userDaoImplementation.addFriend(friend,userid);
	}

	public ModelAndView group(String option,String userid) {
		UserDaoImplementation userDaoImplementation=new UserDaoImplementation();
		return userDaoImplementation.group(option,userid);
		
	}

	public ModelAndView startGroup(String name,String description,String type,String userid) {
		UserDaoImplementation userDaoImplementation=new UserDaoImplementation();
		return userDaoImplementation.startGroup(name,description,type,userid);
		
	}

	public ModelAndView accountSettings(String option, String userid) {
		UserDaoImplementation userDaoImplementation=new UserDaoImplementation();
		return userDaoImplementation.accountSettings(option,userid);
	}

	
	public ModelAndView manageAccount(UserDetails updateDetails,
			BindingResult result) {
		UserDaoImplementation userDaoImplementation=new UserDaoImplementation();
		return userDaoImplementation.manageAccount(updateDetails,result);
	}

	public ModelAndView editGroup(String groupName) {
		UserDaoImplementation userDaoImplementation=new UserDaoImplementation();
		return userDaoImplementation.editGroup(groupName);
	}

	public ModelAndView deleteGroup(String member, String groupName) {
		UserDaoImplementation userDaoImplementation=new UserDaoImplementation();
		return userDaoImplementation.deleteGroup(member,groupName);
	}

	public ModelAndView addMember(String groupName) {
		UserDaoImplementation userDaoImplementation=new UserDaoImplementation();
		return userDaoImplementation.addMember(groupName);
	}

	public ModelAndView memberAdded(String groupName, String friend) {
		UserDaoImplementation userDaoImplementation=new UserDaoImplementation();
		return userDaoImplementation.memberAdded(groupName,friend);
	}

	public ModelAndView comment(String content, int postId, String userid) {
		UserDaoImplementation userDaoImplementation=new UserDaoImplementation();
		return userDaoImplementation.comment(content,postId,userid);
	}

	
	
	}
	