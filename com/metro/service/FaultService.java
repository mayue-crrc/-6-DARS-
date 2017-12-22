package com.metro.service;

import java.sql.Timestamp;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.metro.bean.FaultBean;
import com.metro.dao.FaultMapper;

/**  
 * @author Deng Ran
 * @since 2017/12/08
 * @version 1.3 add three method to get the total item of current, history and query
 */
@Service
public class FaultService {
	// items in each page
	private final int number = 20;
	
	@Autowired
	private FaultMapper faultMapper;
	
	// insert a new fault
	public void insertFault(FaultBean faultBean) {
		this.faultMapper.insertFault(faultBean);
	}
	
	// update a fault when it disappears
	public void updateFault(FaultBean faultBean) {
		this.faultMapper.updateFault(faultBean);
	}
	
	// get the sum of current fault
	public int selectCurrentFaultSum() {
		return this.faultMapper.selectCurrentFaultSum();
	}
	
	// get the sum of history fault
	public int selectHistoryFaultSum() {
		return this.faultMapper.selectHistoryFaultSum();
	}
	
	// get the sum page of current fault
	public int selectCurrentFaultSumPage() {
		int sum = this.selectCurrentFaultSum();
		
		if (sum < number) {
			return 1;
		} else if (sum % number == 0) {
			return sum / number;
		} else {
			return sum / number + 1;
		}
	}
	
	// get the sum page of history fault
	public int selectHistoryFaultSumPage() {
		int sum = this.selectHistoryFaultSum();
		
		if (sum < this.number) {
			return 1;
		} else if (sum % this.number == 0) {
			return sum / this.number;
		} else {
			return sum / this.number + 1;
		}
	}
	
	// get the list of current fault by page
	public List<FaultBean> selectCurrentFaultByPage(int page) {
		if (page < 1) {
			System.out.println("fail to select current fault by page");
			
			return null;
		}
		
		return this.faultMapper.selectCurrentFault(
						(page -1) * this.number, this.number);
	}
	
	// get the list of history fault by page
	public List<FaultBean> selectHistoryFaultByPage(int page) {
		if (page < 1) {
			System.out.println("fail to select history fault by page");
			
			return null;
		}
		
		return this.faultMapper.selectHistoryFault(
						(page -1) * this.number, this.number);
	}
	
	// get the list of history fault by metro code and page
	public List<FaultBean> selectHistoryFaultByMetroCode(String metroCode, int page) {
		if (page < 1) {
			System.out.println("fail to select history fault by page");
			
			return null;
		}
		
		return this.faultMapper.selectHistoryFaultByMetroCode(
						metroCode, (page -1) * this.number, this.number);
	}
	
	// get the list of history fault by metro code, page and time
	public List<FaultBean> selectHistoryFaultByMetroCodeAndTime(String metroCode,
																Timestamp from,
																Timestamp to,
																int page) {
		if (page < 1) {
			System.out.println("fail to select history fault by page");
			
			return null;
		}
		
		return this.faultMapper.selectHistoryFaultByMetroCodeAndTime(
									metroCode, 
									(page -1) * this.number, 
									this.number, 
									from, 
									to);
	}
	
	// get the sum of history query
	public int selectHistoryFaultSumByMetroCodeAndTime(String metroCode, Timestamp from, Timestamp to) {
		return this.faultMapper.selectHistoryFaultSumByMetroCodeAndTime(metroCode, from, to);
	}
	
	// get the item sum of current fault
	// public long select
}
