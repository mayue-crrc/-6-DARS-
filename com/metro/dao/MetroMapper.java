package com.metro.dao;

import java.util.List;
import com.metro.bean.MetroBean;

/**  
 * @author Deng Ran
 * @since 2017/12/01
 * @version 1.2
 */
public interface MetroMapper {
	public void insertMetro(MetroBean metroBean);
	public void deleteMetro(String metroCode);
	public void updateMetro(MetroBean metroBean);
	public MetroBean selectMetroByMetroCode(String metroCode);
	public List<MetroBean> selectAllMetro();
}