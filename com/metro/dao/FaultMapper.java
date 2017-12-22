package com.metro.dao;

import java.sql.Timestamp;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.metro.bean.FaultBean;

/**  
 * @author Deng Ran
 * @since 2017/12/05
 * @version 1.3
 */
public interface FaultMapper {
	public void insertFault(FaultBean faultBean);
	public void updateFault(FaultBean faultBean);
	public int selectCurrentFaultSum();
	public int selectHistoryFaultSum();
	public List<FaultBean> selectCurrentFault(@Param("offsetStart")Integer offsetStart, 
											  @Param("rowCount")Integer rowCount);
	public List<FaultBean> selectHistoryFault(@Param("offsetStart")Integer offsetStart, 
										      @Param("rowCount")Integer rowCount);
	public List<FaultBean> selectHistoryFaultByMetroCode(
											  @Param("metroCode")String metroCode, 
											  @Param("offsetStart")Integer offsetStart, 
		      								  @Param("rowCount")Integer rowCount);
	public List<FaultBean> selectHistoryFaultByMetroCodeAndTime(
											  @Param("metroCode")String metroCode, 
											  @Param("offsetStart")Integer offsetStart, 
											  @Param("rowCount")Integer rowCount, 
											  @Param("from")Timestamp from, 
											  @Param("to")Timestamp to);
	public int selectHistoryFaultSumByMetroCodeAndTime(
											  @Param("metroCode")String metroCode, 
											  @Param("from")Timestamp from, 
											  @Param("to")Timestamp to);
	public long selectCurrentFaultItemSum();
	public long selectHistoryFaultItemSum();
	public long selectQueryFaultItemSumByMetroCodeAndTime(
											  @Param("metroCode")String metroCode, 
											  @Param("from")Timestamp from, 
											  @Param("to")Timestamp to);
}
