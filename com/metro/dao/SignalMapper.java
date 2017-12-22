package com.metro.dao;

import java.sql.Timestamp;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.metro.bean.SignalTypeBean;
import com.metro.bean.SubSignalBean;

/**  
 * @author Deng Ran
 * @since 2017/12/12
 * @version 1.0
 */
public interface SignalMapper {
	public List<SignalTypeBean> selectAllSignalType();
	public long selectInsertId();
	public void insertSubSignal(SubSignalBean subSignalBean);
	public long insertSignalGroup(@Param("metroCode")String metroCode,
			  					  @Param("timeData")Timestamp timeData);
}
