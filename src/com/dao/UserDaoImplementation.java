package com.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.PersistenceException;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import com.pojo.Comment;
import com.pojo.Connections;
import com.pojo.Groupp;
import com.pojo.Post;
import com.pojo.PostMap;
import com.pojo.Ride;
import com.pojo.UserDetails;

public class UserDaoImplementation /* implements UserDao */ {

	private SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	Session session;

	public boolean validateLogin(String userid, String pwd) {
		session = sessionFactory.openSession();
		try {
			UserDetails userDetails = (UserDetails) session.get(UserDetails.class, userid);
			if (userDetails.getPassword().equalsIgnoreCase(pwd)) {

				return true;
			}
			// Un Successfull login case:
			else {
				return false;
			}
		} catch (NullPointerException e) {
		}
		return false;
	}

	public UserDetails getUserDetails(String userid) {
		session = sessionFactory.openSession();
		UserDetails userDetails = null;
		try {
			userDetails = (UserDetails) session.get(UserDetails.class, userid);
		} catch (Exception ex) {

		}
		return userDetails;
	}

	public boolean postRideAsPassenger(Ride ride) {
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			ride.setPostedBy("Passenger");
			session.save(ride);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean postRideAsDriver(Ride ride) {
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			ride.setPostedBy("Driver");
			session.save(ride);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}
	
	public List<Ride> getRideAsPassenger(){
		List<Ride> rides = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			String hql = "from Ride rd where rd.postedBy = 'Passenger'";
			Query query = session.createQuery(hql);
			rides = (List<Ride>)query.list();
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rides;
	}
	
	public List<Ride> getRideAsDriver(){
		List<Ride> rides = null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			String hql = "from Ride rd where rd.postedBy = 'Driver'";
			Query query = session.createQuery(hql);
			rides = (List<Ride>)query.list();
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rides;
	}
	
	
	
	
	
	
	
	
	
	
	/**************************
	 * This method will validate login ID and Password
	 ****************************/

	public ModelAndView loginValidation(String userid, String pwd) {
		// this.sessionFactory= new
		// Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		// session.beginTransaction();

		try {
			UserDetails userDetails = (UserDetails) session.get(UserDetails.class, userid);
			// Post post=(Post) session.get(Post.class,
			// userDetails.getUserid());

			// successfull login Case:
			if (userDetails.getPassword().equalsIgnoreCase(pwd)) {
				ModelAndView modelAndView = new ModelAndView("UserHome.jsp");
				// 1)
				modelAndView.addObject("userid", userDetails.getUserid());
				modelAndView.addObject("fname", userDetails.getfName());
				modelAndView.addObject("lname", userDetails.getlName());
				// 2) for add connection list

				String hql = "from UserDetails u where u.userid not in(select connectionTo from Connections c where c.connectionFrom= :userid) and u.userid != :userid";
				Query query = session.createQuery(hql);
				query.setString("userid", userid);
				List users = query.list();

				// 3)for TOpost list
				hql = "from Connections c where c.connectionFrom= :userid";
				query = session.createQuery(hql);
				query.setString("userid", userid);
				List connections = query.list();
				// 4) to display posts
				hql = "from Post p where p.postedTo= :postedTo";
				query = session.createQuery(hql);
				query.setString("postedTo", userid);
				List<Post> posts = query.list();

				hql = "from Post p where p.postedBy= :postedBy";
				query = session.createQuery(hql);
				query.setString("postedBy", userid);
				List<Post> posts2 = query.list();
				posts.addAll(posts2);
				// End Displaying Post
				List<PostMap> postMap = loadPostMap(posts);

				modelAndView.addObject("postMap", postMap);
				modelAndView.addObject("users", users);
				modelAndView.addObject("connections", connections);
				modelAndView.addObject("posts", posts);

				// ----------------------------------------------------
				// session.getTransaction().commit();
				session.close();
				// sessionFactory.close();
				//
				return modelAndView;
			}
			// Un Successfull login case:
			else {
				ModelAndView modelAndView = new ModelAndView("homeError.jsp");
				return modelAndView;
			}
		} catch (NullPointerException e) {
			ModelAndView modelAndView = new ModelAndView("homeError.jsp");
			return modelAndView;
		}

	}

	@SuppressWarnings("unchecked")
	public List loadPostMap(List<Post> post) {
		List<PostMap> postMap = new ArrayList();
		Post temp;
		String hql;
		Query query;
		int postId;
		PostMap postMapTemp = null;
		List commentsTemp = new ArrayList();
		Iterator itr = post.iterator();
		try {
			while (itr.hasNext()) {
				postMapTemp = new PostMap();
				temp = (Post) itr.next();
				postId = temp.getPostId();
				try {
					hql = "from Comment c where c.postId= :postId";
					query = session.createQuery(hql);
					query.setInteger("postId", postId);
					commentsTemp = query.list();
				} catch (Exception e) {
					System.out.println("error occured in fetching comments post by post:-" + e.getMessage());
				}

				postMapTemp.setComment(commentsTemp);
				postMapTemp.setPost(temp);
				postMap.add(postMapTemp);

			}

		} catch (NullPointerException e) {
			System.out.println("Null Pointer mara yaro !!" + e.getLocalizedMessage() + "-" + e.getMessage());

		}
		return postMap;
	}

	public Post createPostMap(Post temp) {
		Post newPost = new Post();
		newPost.setMessage(temp.getMessage());
		newPost.setPostedTo(temp.getPostedTo());
		newPost.setPostedAt(temp.getPostedAt());
		newPost.setPostedBy(temp.getPostedBy());
		newPost.setPostId(temp.getPostId());

		return newPost;
	}

	/**************************
	 * This method will insert posted message into Table
	 ****************************/
	public ModelAndView publishPost(String postedMessage, String userid, String postTo) {

		// this.sessionFactory= new
		// Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		session.beginTransaction();

		try {

			ModelAndView modelAndView = new ModelAndView("test.jsp");

			Post post = new Post();
			post.setMessage(postedMessage);
			post.setPostedAt(new Date());
			post.setPostedTo(postTo);
			post.setPostedBy(userid);

			session.save(post);

			modelAndView.addObject("post", post);
			session.getTransaction().commit();
			session.close();
			// sessionFactory.close();
			//
			return modelAndView;
		} catch (NullPointerException e) {
			ModelAndView modelAndView = new ModelAndView("homeError.jsp");
			return modelAndView;
		}

	}

	/**************************
	 * This method will insert newly registered user details into userdetails
	 * table
	 ****************************/
	public ModelAndView updateDetails(UserDetails userDetails) {

		session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			session.save(userDetails);
			session.getTransaction().commit();
		} catch (PersistenceException e) {
			ModelAndView modelAndView = new ModelAndView("DuplicateUserId.jsp");
			session.getTransaction().rollback();
			session.close();
			return modelAndView;
		}

		session.close();
		// sessionFactory.close();
		ModelAndView modelAndView = new ModelAndView("registrationResult.jsp");
		return modelAndView;
	}

	// private void creatTable(String userid) {
	// /**** here we are going to user JDBC **************/
	// String Database,password;
	// Database="librarymanagement";
	// String create="create table '"+userid+"' (connection varchar(255))";
	// String url = "jdbc:mysql://localhost:3306/"+Database;
	// try{
	// Class.forName("com.mysql.jdbc.Driver").newInstance();
	// Connection con = DriverManager.getConnection(url, "root", "abc");
	// Statement st = con.createStatement();
	// int rs=st.executeUpdate(create);
	// }
	// catch(Exception e){}
	//
	//
	// }
	/**************************
	 * This method will update details in connection table
	 ****************************/
	public ModelAndView addFriend(String friend, String userid) {

		Connections connections = new Connections();
		connections.setConnectionFrom(userid);
		connections.setConnectionTo(friend);

		/************/

		// this.sessionFactory= new
		// Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		session.beginTransaction();
		try {

			session.save(connections);
			session.getTransaction().commit();
		} catch (PersistenceException e) {
			ModelAndView modelAndView = new ModelAndView("addFriendSuccess.jsp");
			modelAndView.addObject("friend", friend);
			modelAndView.addObject("result", "un successfull operation!!");
			session.close();
			// sessionFactory.close();
			return modelAndView;
		}
		session.close();
		// sessionFactory.close();
		//

		/**************/

		ModelAndView modelAndView = new ModelAndView("addFriendSuccess.jsp");
		modelAndView.addObject("friend", friend);
		modelAndView.addObject("result", "Successfully connected!!");
		return modelAndView;
	}

	/**************************
	 * This method will decide startGroup or ManageGroup
	 ****************************/
	public ModelAndView group(String option, String userid) {

		if (option.equalsIgnoreCase("start")) {
			ModelAndView modelAndView = new ModelAndView("startGroup.jsp");
			modelAndView.addObject("userid", userid);
			return modelAndView;
		} else {
			ModelAndView modelAndView = new ModelAndView("manageGroup.jsp");

			// this.sessionFactory= new
			// Configuration().configure().buildSessionFactory();
			session = sessionFactory.openSession();
			session.beginTransaction();

			String hql = "from Groupp where groupAdmin= :userid";

			Query query = session.createQuery(hql);
			query.setString("userid", userid);
			List<Groupp> groups = query.list();
			modelAndView.addObject("groups", groups);
			session.getTransaction().commit();
			session.close();
			// sessionFactory.close();
			Map<String, Integer> groupsMap = createMap(groups);
			modelAndView.addObject("groupsMap", groupsMap);
			return modelAndView;
		}

	}

	private Map<String, Integer> createMap(List groups) {
		Groupp name;
		int count;
		HashMap<String, Integer> groupMap = new HashMap();
		Iterator<Groupp> groupsIterator = groups.iterator();
		// this.sessionFactory= new
		// Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		session.beginTransaction();
		String hql = "select count(*) from connections where connectionTo= :name";
		while (groupsIterator.hasNext()) {
			name = groupsIterator.next();
			count = ((Long) session.createQuery("select count(*) from Connections c where c.connectionTo= :name")
					.setString("name", name.getGroupName()).uniqueResult()).intValue();
			groupMap.put(name.getGroupName(), count);
		}
		session.getTransaction().commit();
		session.close();
		return groupMap;
	}

	/**************************
	 * This method will update DB for start group
	 ****************************/
	public ModelAndView startGroup(String name, String description, String type, String userid) {
		Groupp group = new Groupp();
		group.setGroupDescription(description);
		group.setGroupName(name);
		group.setGroupType(type);
		group.setGroupAdmin(userid);
		// this.sessionFactory= new
		// Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			System.out.println("******!!!!" + group.getGroupName() + "$$" + group.getGroupType() + "$$"
					+ group.getGroupDescription() + group.getGroupAdmin());
			session.save(group);
			session.getTransaction().commit();
			session.close();
			// sessionFactory.close();
		} catch (PersistenceException e) {
			ModelAndView modelAndView = new ModelAndView("startGroup.jsp");
			modelAndView.addObject("error2", "persistence exception occured");
			System.out.println(e.getLocalizedMessage() + "*************!!!!!!!!!!!!!Latest" + userid);
			// session.close();
			// sessionFactory.close();
			return modelAndView;
		}

		ModelAndView modelAndView = new ModelAndView("groupCreated.jsp");
		return modelAndView;

	}

	public ModelAndView accountSettings(String option, String userid) {

		if (option.equalsIgnoreCase("settings")) {
			ModelAndView modelAndView;
			// this.sessionFactory= new
			// Configuration().configure().buildSessionFactory();
			session = sessionFactory.openSession();
			session.beginTransaction();
			try {
				UserDetails userDetails = (UserDetails) session.get(UserDetails.class, userid);
				modelAndView = new ModelAndView("ManageAccount.jsp");
				modelAndView.addObject("userDetails", userDetails);
				session.getTransaction().commit();
				session.close();
				// sessionFactory.close();
				return modelAndView;

			} catch (Exception e) {
				modelAndView = new ModelAndView("ManageAccountError.jsp");
				modelAndView.addObject("error", e.getLocalizedMessage());
				session.close();
				// sessionFactory.close();
				return modelAndView;
			}
		} else {
			ModelAndView modelAndView = new ModelAndView("login.jsp");

			// session.close();
			// sessionFactory.close();
			return modelAndView;
		}

	}

	public ModelAndView manageAccount(UserDetails updateDetails, BindingResult result) {
		if (result.hasErrors()) {
			ModelAndView modelAndView = new ModelAndView("Registration.jsp");
			modelAndView.addObject("error", "Please correct the details");
			return modelAndView;
		}
		// this.sessionFactory= new
		// Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			// creatTable(userDetails.getUserid());
			session.saveOrUpdate(updateDetails);
			session.getTransaction().commit();
			session.close();
			// sessionFactory.close();
		} catch (PersistenceException e) {
			ModelAndView modelAndView = new ModelAndView("ManageAccount.jsp");
			modelAndView.addObject("error", "unable to update details, please correct !!");
			session.close();
			// sessionFactory.close();
			return modelAndView;
		}

		ModelAndView modelAndView = new ModelAndView("ManageAccountResult.jsp");
		modelAndView.addObject("userDetails", updateDetails);
		return modelAndView;
	}

	public ModelAndView editGroup(String groupName) {
		ModelAndView modelAndView = new ModelAndView("EditGroup.jsp");
		modelAndView.addObject("groupName", groupName);

		// this.sessionFactory= new
		// Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			Groupp group = (Groupp) session.get(Groupp.class, groupName);
			modelAndView.addObject("group", group);

			String hql = "from Connections c where c.connectionTo= :groupName";
			Query query = session.createQuery(hql);
			query.setString("groupName", groupName);
			List<Connections> connections = query.list();
			modelAndView.addObject("connections", connections);
			session.getTransaction().commit();
			session.close();
			// sessionFactory.close();
			return modelAndView;
		} catch (Exception e) {
			modelAndView = new ModelAndView("ManageAccountError.jsp");
			modelAndView.addObject("error", e.getLocalizedMessage());
			session.close();
			// sessionFactory.close();
			return modelAndView;
		}

		// return modelAndView;
	}

	public ModelAndView deleteGroup(String member, String groupName) {

		ModelAndView modelAndView = new ModelAndView("memberDeleted.jsp");
		modelAndView.addObject("member", member);

		// this.sessionFactory= new
		// Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		session.beginTransaction();

		String hql = "DELETE FROM Connections c WHERE c.connectionTo= :groupName AND c.connectionFrom= :member";
		Query query = session.createQuery(hql);
		query.setString("groupName", groupName);
		query.setString("member", member);
		try {
			int result = query.executeUpdate();
			session.getTransaction().commit();
			modelAndView.addObject("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
			session.close();
			// sessionFactory.close();
		}

		session.close();
		// sessionFactory.close();

		return modelAndView;
	}

	public ModelAndView addMember(String groupName) {
		ModelAndView modelAndView = new ModelAndView("addMember.jsp");
		modelAndView.addObject("groupName", groupName);
		session = sessionFactory.openSession();
		session.beginTransaction();
		String hql = "from UserDetails u where u.userid not in(select connectionFrom from Connections c where c.connectionTo= :groupName)";
		List<UserDetails> userDetails = session.createQuery(hql).setString("groupName", groupName).list();
		session.getTransaction().commit();
		session.close();
		modelAndView.addObject("userDetails", userDetails);
		return modelAndView;
	}

	public ModelAndView memberAdded(String groupName, String friend) {

		ModelAndView modelAndView = new ModelAndView("addMemberResult.jsp");
		session = sessionFactory.openSession();
		session.beginTransaction();

		Connections connections = new Connections();
		connections.setConnectionFrom(friend);
		connections.setConnectionTo(groupName);
		try {
			session.save(connections);
		} catch (Exception e) {
			System.out.println("Atavur Catched **********!!!" + e.getMessage());
			session.getTransaction().rollback();
		}
		session.getTransaction().commit();
		session.close();
		return modelAndView;
	}

	public ModelAndView comment(String content, int postId, String userid) {
		String pwd = new String();
		Comment comment = new Comment();
		comment.setContent(content);
		comment.setPostId(postId);
		comment.setUserid(userid);
		session = sessionFactory.openSession();
		session.beginTransaction();
		try {
			pwd = ((String) session.createQuery("select password from UserDetails u where u.userid= :userid")
					.setString("userid", userid).uniqueResult());
			System.out.println("password is:" + pwd);
			System.out.println("======+++++=====================|||||||||");
			System.out.println("content:" + comment.getContent() + "\nuserid:" + comment.getUserid() + "\npostid:"
					+ comment.getPostId());
			session.save(comment);
			System.out.println("***************************!!!!!!!!!!!!!!!!!!!!!!!!");
			System.out.println("content:" + comment.getContent() + "\nuserid:" + comment.getUserid() + "\npostid:"
					+ comment.getPostId() + " and" + comment.getCommentId());
			session.getTransaction().commit();
			session.close();
			return this.loginValidation(userid, pwd);
		} catch (Exception e) {
			ModelAndView modelAndView = new ModelAndView("commentError.jsp");
			modelAndView.addObject("errorLocalizedMessage", e.getLocalizedMessage());
			modelAndView.addObject("errorGetMessage", e.getMessage());
			session.getTransaction().commit();
			session.close();
			return modelAndView;
		}
	}

}
// count=((Long)session.createQuery("select count(*) from Connections c where
// c.connectionTo= :name").setString
// ("name",name.getGroupName()).uniqueResult()).intValue();