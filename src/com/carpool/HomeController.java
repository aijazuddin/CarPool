package com.carpool;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.lang.String;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pojo.Ride;
import com.pojo.UserDetails;
import com.service.UserService;
import com.service.UserServiceImplementation;

@Controller
public class HomeController {

	UserDetails userDetails;
	List<String> locations = new ArrayList<String>(
			Arrays.asList("UCMLS", "UCMWarres", "OverlandPark", "Shawnee", "CoachHouse", "wallmartWarrensburg"));
	List<String> time = new ArrayList<String>(Arrays.asList("morning", "aftnoon", "evening", "night"));

	public ModelAndView bindHeaderValues(ModelAndView modelAndView) {
		modelAndView.addObject("userDetails", userDetails);
		modelAndView.addObject("locations", locations);
		modelAndView.addObject("time", time);
		return modelAndView;
	}

	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView("login.jsp");
		return modelAndView;
	}

	/**************************************
	 * End
	 * 
	 * @throws SystemException
	 * @throws RollbackException
	 * @throws HeuristicRollbackException
	 * @throws HeuristicMixedException
	 * @throws SecurityException
	 ****************************/

	@RequestMapping(value = "/validateLogin", method = RequestMethod.POST)
	public ModelAndView validateLogin(@RequestParam("userid") String userid, @RequestParam("password") String pwd,
			HttpServletRequest req) throws SecurityException, HeuristicMixedException, HeuristicRollbackException,
					RollbackException, SystemException {
		UserService userService = new UserServiceImplementation();
		boolean isValid = userService.validateLogin(userid, pwd);
		req.getSession().setAttribute("userid", userid);
		ModelAndView modelAndView = null;
		if (isValid == true) {
			userDetails = userService.getUserDetails(userid);
			return home();
		} else {
			modelAndView = new ModelAndView("loginError.jsp");
		}

		return modelAndView;
	}

	/* Method for displaying registration form */
	@RequestMapping("/registration")
	public String registration() {

		return "Registration.jsp";
	}
	/************************************** End ****************************/

	/***********
	 * Method for reading registration details and updating in DB
	 * 
	 * @throws SystemException
	 * @throws RollbackException
	 * @throws HeuristicRollbackException
	 * @throws HeuristicMixedException
	 * @throws SecurityException
	 *************/
	@RequestMapping(value = "/updateDetails", method = RequestMethod.POST)
	public ModelAndView updateDetails(@ModelAttribute("userDetails") UserDetails userDetails, BindingResult result,
			HttpServletRequest req) throws SecurityException, HeuristicMixedException, HeuristicRollbackException,
					RollbackException, SystemException {
		if (result.hasErrors()) {
			ModelAndView modelAndView = new ModelAndView("Registration.jsp");
			modelAndView.addObject("error", "Please correct the details");
			return modelAndView;
		}
		UserService userService = new UserServiceImplementation();
		/*
		 * System.out.println("---role--->");
		 * System.out.println(req.getParameter("role"));
		 * System.out.println("---role--->");
		 * System.out.println(userDetails.getRole());
		 */
		return userService.updateDetails(userDetails);
	}

	/****** This method will be called when we click Home button ******/
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView modelAndView = null;
		if (userDetails == null) {
			return login();
		} else {
			modelAndView = new ModelAndView("home.jsp");
			modelAndView.addObject("userDetails", userDetails);
		}

		return modelAndView;
	}

	@RequestMapping("/contactUs")
	public ModelAndView contactUs() {
		ModelAndView modelAndView = new ModelAndView("contactUs.jsp");
		return modelAndView;
	}

	@RequestMapping("/myPostsAsDriver")
	public ModelAndView myPostAsDriver() {
		ModelAndView modelAndView = null;
		List<Ride> rides = null;
		modelAndView = new ModelAndView("myPostsAsDriver.jsp");
		modelAndView = bindHeaderValues(modelAndView);
		UserService userService = new UserServiceImplementation();
		rides = userService.getRideAsDriver();
		modelAndView.addObject("ridesList", rides);
		return modelAndView;
	}

	@RequestMapping("/postAsDriver")
	public ModelAndView postAsDriver() {
		ModelAndView modelAndView = null;
		modelAndView = new ModelAndView("postAsDriver.jsp");
		modelAndView = bindHeaderValues(modelAndView);
		return modelAndView;
	}

	@RequestMapping("/myPostsAsPassenger")
	public ModelAndView myPostAsPassenger() {
		ModelAndView modelAndView = null;
		List<Ride> rides = null;
		modelAndView = new ModelAndView("myPostsAsPassenger.jsp");
		UserService userService = new UserServiceImplementation();
		rides = userService.getRideAsPassenger();
		modelAndView.addObject("ridesList", rides);
		modelAndView = bindHeaderValues(modelAndView);
		return modelAndView;
	}

	@RequestMapping("/postAsPassenger")
	public ModelAndView postAsPassenger() {
		ModelAndView modelAndView = null;
		modelAndView = new ModelAndView("postAsPassenger.jsp");
		modelAndView = bindHeaderValues(modelAndView);
		return modelAndView;
	}

	@RequestMapping("/findPassengers")
	public ModelAndView findPassengers() {
		ModelAndView modelAndView = null;
		modelAndView = new ModelAndView("findPassengers.jsp");
		modelAndView = bindHeaderValues(modelAndView);
		List<Ride> rides = null;
		UserService userService = new UserServiceImplementation();
		rides = userService.getRideAsPassenger();
		modelAndView.addObject("ridesList", rides);
		return modelAndView;
	}

	@RequestMapping("/findDrivers")
	public ModelAndView findDrivers() {
		ModelAndView modelAndView = null;
		modelAndView = new ModelAndView("findDrivers.jsp");
		modelAndView = bindHeaderValues(modelAndView);
		List<Ride> rides = null;
		UserService userService = new UserServiceImplementation();
		rides = userService.getRideAsDriver();
		modelAndView.addObject("ridesList", rides);
		return modelAndView;
	}

	@RequestMapping("/postAsPassengerSubmit")
	public ModelAndView postAsPassengerSubmit(@ModelAttribute("ride") Ride ride, BindingResult result) {
		ModelAndView modelAndView = null;
		boolean success = false;
		//List<Ride> rides = null;
		try {
			//modelAndView = new ModelAndView("findPassengers.jsp");
			UserService userService = new UserServiceImplementation();
			success = userService.postRideAsPassenger(ride);
			if(success == false){
				modelAndView = new ModelAndView("loginError.jsp");
			}else{
				/*rides = userService.getRideAsPassenger();
				modelAndView.addObject("ridesList", rides);*/
				return myPostAsPassenger();
			}
			return modelAndView;
		} catch (Exception ex) {
			
		}
		modelAndView = bindHeaderValues(modelAndView);
		return modelAndView;
	}

	@RequestMapping("/postAsDriverSubmit")
	public ModelAndView postAsDriverSubmit(@ModelAttribute("ride") Ride ride, BindingResult result) {
		ModelAndView modelAndView = null;
		boolean success = false;
		//List<Ride> rides = null;
		try {
			UserService userService = new UserServiceImplementation();
			success = userService.postRideAsDriver(ride);
			if(success == false){
				modelAndView = new ModelAndView("loginError.jsp");
			}else{
				return myPostAsDriver();
			}
			return modelAndView;
		} catch (Exception ex) {
			
		}
		modelAndView = bindHeaderValues(modelAndView);
		return modelAndView;
	}
	
	@RequestMapping("/openPassenger")
	public ModelAndView openPassenger() {
		ModelAndView modelAndView = null;
		modelAndView = new ModelAndView("openPassenger.jsp");
		modelAndView = bindHeaderValues(modelAndView);
		return modelAndView;
	}
	
	@RequestMapping("/openDriver")
	public ModelAndView openDriver() {
		ModelAndView modelAndView = null;
		modelAndView = new ModelAndView("openDriver.jsp");
		modelAndView = bindHeaderValues(modelAndView);
		return modelAndView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**************************************
	 * End
	 * 
	 * @throws SystemException
	 * @throws RollbackException
	 * @throws HeuristicRollbackException
	 * @throws HeuristicMixedException
	 * @throws SecurityException
	 ****************************/

	/*
	 * method for reading login credentials and validating; displaying
	 * respective page
	 */
	@RequestMapping(value = "/loginValidation", method = RequestMethod.POST)
	public ModelAndView loginValidation(@RequestParam("userid") String userid, @RequestParam("password") String pwd,
			HttpServletRequest req) throws SecurityException, HeuristicMixedException, HeuristicRollbackException,
					RollbackException, SystemException {
		req.getSession().setAttribute("userid", userid);
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.loginValidation(userid, pwd);
	}

	/**************************************
	 * End
	 * 
	 * @throws SystemException
	 * @throws RollbackException
	 * @throws HeuristicRollbackException
	 * @throws HeuristicMixedException
	 * @throws SecurityException
	 ****************************/

	/*
	 * ***************** method for updating tables with posted content
	 * *************
	 */
	@RequestMapping(value = "/PublishPost", method = RequestMethod.POST)
	public ModelAndView publishPost(@RequestParam("WritePost") String postedMessage,
			@RequestParam("userid") String userid, @RequestParam("friend") String postTo) throws SecurityException,
					HeuristicMixedException, HeuristicRollbackException, RollbackException, SystemException {
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.publishPost(postedMessage, userid, postTo);
	}

	/************************************** End ****************************/

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setDisallowedFields(new String[] { "password2" });
	}

	/************************************** End ****************************/

	/****** This method will be called when we click About Us button ******/
	@RequestMapping("/aboutUs")
	public ModelAndView aboutUs() {
		ModelAndView modelAndView = new ModelAndView("aboutUs.jsp");
		return modelAndView;
	}
	/****** This method will be called when we click Home button ******/

	/********************* Adding new Friend *****************************/
	@RequestMapping(value = "/addFriend", method = RequestMethod.POST)
	public ModelAndView addFriend(@RequestParam("friend") String friend, @RequestParam("userid") String userid)
			throws SecurityException, HeuristicMixedException, HeuristicRollbackException, RollbackException,
			SystemException {
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.addFriend(friend, userid);
	}

	/********************** Group *****************************/
	@RequestMapping(value = "/group", method = RequestMethod.POST)
	public ModelAndView group(@RequestParam("group") String option, @RequestParam("userid") String userid) {
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.group(option, userid);
	}

	/********************* Start a Group ************************/
	@RequestMapping(value = "/startGroup", method = RequestMethod.POST)
	public ModelAndView startGroup(@RequestParam("groupName") String name,
			@RequestParam("groupDescription") String description, @RequestParam("groupType") String type,
			@RequestParam("userid") String userid) {
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.startGroup(name, description, type, userid);
	}

	/*********************************** Account *************/
	@RequestMapping(value = "/accountSettings", method = RequestMethod.POST)
	public ModelAndView startGroup(@RequestParam("AccountSettings") String option,
			@RequestParam("userid") String userid) {
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.accountSettings(option, userid);
	}

	/************************** Manage Account *************/
	@RequestMapping(value = "/manageAccount", method = RequestMethod.POST)
	public ModelAndView manageAccount(@ModelAttribute("updateDetails") UserDetails updateDetails,
			BindingResult Result) {
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.manageAccount(updateDetails, Result);
	}

	/**************************    ***************************/

	@RequestMapping(value = "/editGroup")
	public ModelAndView editGroup(@RequestParam("groupName") String groupName) {
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.editGroup(groupName);
	}

	/***********************
	 * when user select delete member from manage group page
	 *****************************/
	@RequestMapping(value = "/deleteGroup")
	public ModelAndView deleteGroup(@RequestParam("member") String member,
			@RequestParam("groupName") String groupName) {
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.deleteGroup(member, groupName);
	}

	/*************************
	 * When user select add member in edit group page
	 ************************/
	@RequestMapping(value = "/addMember")
	public ModelAndView addMember(@RequestParam("groupName") String groupName) {
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.addMember(groupName);
	}

	/**************************
	 * when user select add button on addMember page
	 ****************/

	@RequestMapping(value = "/memberAdded")
	public ModelAndView memberAdded(@RequestParam("groupName") String groupName,
			@RequestParam("friend") String friend) {
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.memberAdded(groupName, friend);
	}

	/*****************************
	 * When user comment to a Post
	 ***************************************/

	@RequestMapping(value = "/comment")
	public ModelAndView comment(@RequestParam("content") String content, @RequestParam("postId") int postId,
			@RequestParam("userid") String userid) {
		UserServiceImplementation userService = new UserServiceImplementation();
		return userService.comment(content, postId, userid);
	}

	/* This Request mapping method is for displaying home page */
	@RequestMapping("/home.html")
	public ModelAndView test() {
		ModelAndView modelAndView = new ModelAndView("home.jsp");
		return modelAndView;
	}
}
