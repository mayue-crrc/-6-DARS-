package com.metro.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.metro.bean.MetroBean;
import com.metro.dao.MetroMapper;

/**  
 * @author Deng Ran
 * @since 2017/12/01
 * @version 1.2
 */
@Service
public class MetroService {
	@Autowired
	private MetroMapper metroMapper;
	
	// insert a new metro
	public void insertMetro(MetroBean metroBean) {
		if (this.isMetroExists(metroBean.getMetroCode())) {
			System.out.println("the metro has already been in the database");
			
			return;
		}
		
		metroBean.setDateManufacture(new Date(System.currentTimeMillis()));
		
		this.metroMapper.insertMetro(metroBean);
	}
	
	// delete the metro by its metro code
	public void deleteMetro(String metroCode) {
		this.metroMapper.deleteMetro(metroCode);
	}
	
	// update the information of metro except its metro code
	public void updateMetro(MetroBean metroBean) {
		if (this.isMetroExists(metroBean.getMetroCode())) {
			this.metroMapper.updateMetro(metroBean);
		} else {
			System.out.print("the metro does not exist in the database, please check it");
		}
	}
	
	// get the information of metro by its metro code
	public MetroBean selectMetroByMetroCode(String metroCode) {
		return this.metroMapper.selectMetroByMetroCode(metroCode);
	}
	
	// get the information of all metro
	public List<MetroBean> selectAllMetro() {
		return this.metroMapper.selectAllMetro();
	}
	
	// get all metro code
	public List<String> selectAllMetroCode() {
		List<String> metroCodeList = new ArrayList<String>();
		
		for (MetroBean metroBean: this.selectAllMetro()) {
			metroCodeList.add(metroBean.getMetroCode());
		}
		
		return metroCodeList;
	}
	
	// check if the metro has already been in the database
	public boolean isMetroExists(String metroCode) {
		if (this.selectMetroByMetroCode(metroCode) == null) {
			return false;
		} else {
			return true;
		}
	}
}