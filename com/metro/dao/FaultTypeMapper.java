package com.metro.dao;

import java.util.List;
import com.metro.bean.FaultTypeBean;

/**  
 * @author Deng Ran
 * @since 2017/12/05
 * @version 1.1
 */
public interface FaultTypeMapper {
	List<FaultTypeBean> selectAllFaultType();
}
