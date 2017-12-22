package com.metro.controller;

import java.sql.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.metro.bean.CumulantBean;
import com.metro.service.CumulantService;

/**  
 * @author Deng Ran
 * @since 2017/12/07
 * @version 1.2
 */
@Controller
@RequestMapping(value="/cumulant")
public class CumulantController {
	@Autowired
	CumulantService cumulantService;
	
	@RequestMapping(value="/page.do", method=RequestMethod.GET)
	public String page() {
		return "/cumulantCheck";
	}
	
	@RequestMapping(value="/today.do", method=RequestMethod.POST)
	@ResponseBody
	public CumulantBean todayCumulantBean(String metroCode) {
		return this.cumulantService.selectPeriodCumulant(metroCode, 
													new Date(System.currentTimeMillis() - 24 * 3600 * 1000), 
													new Date(System.currentTimeMillis()));
	}
	
	@RequestMapping(value="/total.do", method=RequestMethod.POST)
	public CumulantBean totalCumulant(String metroCode) {
		return this.cumulantService.selectCumulantByMetroCodeAndDate(metroCode, 
													new Date(System.currentTimeMillis()));
	}
	
	@RequestMapping(value="/period.do", method=RequestMethod.POST)
	public CumulantBean periodCumulant(String metroCode, Date from, Date to) {
		return this.cumulantService.selectPeriodCumulant(metroCode, from, to);
	}
}