package com.metro.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.metro.bean.UserBean;
import com.metro.service.UserService;

/**  
 * @author Deng Ran
 * @since 2017/12/12
 * @version 1.1
 */
@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/page.do", method=RequestMethod.GET)
	public String userManage() {
		return "/userManage";
	}
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean addUser(UserBean userBean) {
		this.userService.insertUser(userBean);
		
		return this.userService.isUserExists(userBean.getUserName());
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	@ResponseBody
	public boolean deleteUser(@RequestParam(value="userName", defaultValue="userName")String userName) {
		this.userService.deleteUser(userName);
		
		return this.userService.isUserExists(userName) == false;
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean updateUser(UserBean userBean) {
		if (this.userService.isUserExists(userBean.getUserName()) == false) {
			return false;
		} else {
			this.userService.updateUser(userBean);
			
			return true;
		}
	}
	
	@RequestMapping(value="/allNormal.do", method=RequestMethod.POST) 
	@ResponseBody
	public List<UserBean> getAllNormalUser() {
		return this.userService.selectUserByUserType("normal");
	}
	
	@RequestMapping(value="/selectAdmin.do", method=RequestMethod.POST) 
	@ResponseBody
	public List<UserBean> getAllAdminUser() {
		return this.userService.selectUserByUserType("admin");
	}
	
	@RequestMapping(value="/exist.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean existUserName(@RequestParam(value="userName")String userName) {
		return this.userService.isUserExists(userName);
	}
	
	@RequestMapping(value="/password.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean changePassword(String userName, String oldPassword, String newPassword) {
		return this.userService.changePassword(userName, oldPassword, newPassword);
	}
}
