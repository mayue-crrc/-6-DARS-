package com.metro.service;

import java.sql.Timestamp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.metro.bean.UserBean;
import com.metro.dao.UserMapper;
import java.util.List;

/**  
 * @author Deng Ran
 * @since 2017/12/02
 * @version 1.3
 */
@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	
	// insert a new user
	public void insertUser(UserBean userBean) {
		if (this.isUserExists(userBean.getUserName())) {
			System.out.println("the user has already been in the database");
			
			return;
		}
		
		userBean.setCreateTime(new Timestamp(System.currentTimeMillis()));
		userBean.setEnable(true);

		this.userMapper.insertUser(userBean);
	}
	
	// delete a user by its user name
	public void deleteUser(String userName) {
		this.userMapper.deleteUser(userName);
	}
	
	// update a user if it exists
	public void updateUser(UserBean userBean) {
		if (this.isUserExists(userBean.getUserName())) {
			this.userMapper.updateUser(userBean);	
		} else {
			System.out.println("the user does not exist in the database, please check it");
		}
	}
	
	// get the information of user by its user name
	public UserBean selectUserByUserName(String userName) {
		return this.userMapper.selectUserByUserName(userName);
	}
	
	// get the information of all users except user's password
	public List<UserBean> selectAllUser() {
		List<UserBean> userBeanList = this.userMapper.selectAllUser();
		
		// delete the user's password for it is unsafe
		for (UserBean userBean: userBeanList) {
			userBean.setPassword(null);
		}
		
		return userBeanList;
	}
	
	// check if the user has already been in the database
	public boolean isUserExists(String userName) {
		if (this.selectUserByUserName(userName) == null) {
			return false;
		} else {
			return true;
		}
	}
	
	// check if the user name matches the password
	public boolean checkUserNameAndPassword(String userName, String password) {
		if (this.isUserExists(userName) == false) {
			return false;
		}
		
		if (this.selectUserByUserName(userName).getPassword() == password) {
			return true;
		} else {
			return false;
		}
	}
	
	// get the information of user by user type
	public List<UserBean> selectUserByUserType(String userType) {
		List<UserBean> userBeanList = this.selectAllUser();
		
		for (int i = 0; i < userBeanList.size(); i ++) {
			if (userBeanList.get(i).getUserType().equals(userType) == false) {
				userBeanList.remove(i);
			}
		}
		
		return userBeanList;
	}
	
	// change password according to the user name and the password
	public boolean changePassword(String userName, String oldPassword, String newPassword) {
		if (this.isUserExists(userName) == false) {
			return false;
		}
		
		UserBean bean = this.selectUserByUserName(userName);
		
		if (bean.getPassword().equals(oldPassword) == false) {
			return false;
		} else {
			bean.setPassword(newPassword);
			this.updateUser(bean);
			
			return true;
		}
	}
}
