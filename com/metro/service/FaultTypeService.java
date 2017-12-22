package com.metro.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.metro.bean.FaultTypeBean;
import com.metro.dao.FaultTypeMapper;

/**  
 * @author Deng Ran
 * @since 2017/12/05
 * @version 1.1
 */
@Service
public class FaultTypeService {
	@Autowired
	private FaultTypeMapper faultTypeMapper;
	
	// get the information of all fault type
	public List<FaultTypeBean> selectAllFaultType() {
		return this.faultTypeMapper.selectAllFaultType();
	}
	
	// get the information of all fault type
	public HashMap<Integer, FaultTypeBean> selectAllFaultTypeHashMap() {
		HashMap<Integer, FaultTypeBean> faultTypeMap = new HashMap<Integer, FaultTypeBean>();
		List<FaultTypeBean> faultTypeList = this.selectAllFaultType();
		
		for (FaultTypeBean faultTypeBean: faultTypeList) {
			faultTypeMap.put(faultTypeBean.getFaultIndex(), faultTypeBean);
		}
		
		return faultTypeMap;
	}
}
