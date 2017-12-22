package com.metro.dao;

import java.util.List;
import com.metro.bean.UserBean;

/**  
 * @author Deng Ran
 * @since 2017/12/01
 * @version 1.2
 */
public interface UserMapper {
	public void insertUser(UserBean userBean);
	public void deleteUser(String userName);
	public void updateUser(UserBean userBean);
	public UserBean selectUserByUserName(String userName);
	public List<UserBean> selectAllUser();
}