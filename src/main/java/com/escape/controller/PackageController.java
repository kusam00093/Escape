package com.escape.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Package")
public class PackageController {

	@RequestMapping("/Home")
	public  String   home() {		
		return "package/package_home";
	}
}
