package com.metro.dao;

import java.sql.Date;
import org.apache.ibatis.annotations.Param;
import com.metro.bean.CumulantBean;

/**  
 * @author Deng Ran
 * @since 2017/12/05
 * @version 1.1
 */
public interface CumulantMapper {
	public void insertCumulant(CumulantBean cumulantBean);
	public void updateCumulant(CumulantBean cumulantBean);
	public CumulantBean selectCumulantByMetroCodeAndDate(@Param("metroCode")String metroCode,
											 		        @Param("timeData")Date timeData);
}
