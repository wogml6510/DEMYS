package com.ducks.demys.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	
	@RequestMapping("project/main")
	public void showMain() {
		
	}
	@RequestMapping("project/regist")
	public void showPjctRegist() {
	}
	@RequestMapping("project/regist_detail")
	public void showPjctRegistDetail() {
	}
	
	@RequestMapping("project/detail")
	public void showPjctDetail() {
	}
	
	@RequestMapping("project/hr_list")
	public void showPjctHrList() {
	}
}
