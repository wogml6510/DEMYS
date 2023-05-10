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
}
