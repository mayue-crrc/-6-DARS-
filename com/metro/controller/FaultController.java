package com.metro.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.metro.bean.FaultBean;
import com.metro.service.FaultService;

/**  
 * @author Deng Ran
 * @since 2017/12/07
 * @version 1.2
 */
@Controller
@RequestMapping(value="/fault")
public class FaultController {
	@Autowired
	private FaultService faultService;
	
	@RequestMapping(value="/page.do", method=RequestMethod.GET) 
	public String page() {
		return "/faultCheck";
	}
	
	@RequestMapping(value="/currentSum.do", method=RequestMethod.POST)
	@ResponseBody
	public int getCurrentFaultSumPage() {
		return this.faultService.selectCurrentFaultSumPage();
	}
	
	@RequestMapping(value="/historySum.do", method=RequestMethod.POST)
	@ResponseBody
	public int getHistoryFaultSumPage() {
		return this.faultService.selectHistoryFaultSumPage();
	}
	
	@RequestMapping(value="/querySum.do", method=RequestMethod.POST)
	@ResponseBody
	public int getQueryFaultSumPage(String metroCode, Date from, Date to) {
		return this.faultService.selectHistoryFaultSumByMetroCodeAndTime(
							metroCode, 
							new Timestamp(from.getTime()), 
							new Timestamp(to.getTime()));
	}
	
	@RequestMapping(value="/currentFault.do", method=RequestMethod.POST)
	@ResponseBody
	public List<FaultBean> getCurrentFault(Integer page) {
		return this.faultService.selectCurrentFaultByPage(page.intValue());
	}
	

	
	@RequestMapping(value="/historyFault.do", method=RequestMethod.POST)
	@ResponseBody
	public List<FaultBean> getHistoryFault(Integer page) {
		return this.faultService.selectHistoryFaultByPage(page.intValue());
	}
	
	@RequestMapping(value="queryFault.do", method=RequestMethod.POST)
	@ResponseBody
	public List<FaultBean> historyFaultQuery(String metroCode, Date from, Date to, Integer page) {
		return this.faultService.selectHistoryFaultByMetroCodeAndTime(metroCode,
													new Timestamp(from.getTime()), 
													new Timestamp(to.getTime()),
													page.intValue());
	}
}
