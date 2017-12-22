package com.metro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**  
 * @author Deng Ran
 * @since 2017/12/07
 * @version 1.0
 */
@Controller
@RequestMapping(value="/overview")
public class OverviewController {
	@RequestMapping(value="/page.do", method=RequestMethod.GET)
	String page() {
		return "overview";
	}
}
