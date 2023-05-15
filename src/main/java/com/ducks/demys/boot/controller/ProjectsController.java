package com.ducks.demys.boot.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.command.SearchCriteria;

@Controller
public class ProjectsController {
	private ProjectsService projectsService;
	
	public ProjectsController(ProjectsService projectsService) {
		this.projectsService = projectsService;
	}
	
	// Action
	@RequestMapping("project/main")
	public void pjctList(Model model, SearchCriteria cri) {
		//Issue issue = issueService.getIssueByISSUE_NUM(issueNum);
		
		if(cri.getPage()<1) cri.setPage(1);
		if(cri.getPerPageNum()<1) cri.setPerPageNum(5);
		
		//List<Projects> projects
		Map<String, Object> dataMap = projectsService.getPJList(cri);
		
		model.addAttribute("dataMap", dataMap);
		
		
		//return "project/main";
	}
	@RequestMapping("project/regist")
	public void pjctRegist() {
	}
	@RequestMapping("project/regist_detail")
	public void pjctRegistDetail() {
	}
	
	@RequestMapping("project/detail")
	public void pjctDetail() {
	}
	
	@RequestMapping("project/hr_list")
	public void showPjctHrList() {
	}
	
	@RequestMapping("project/hr_detail")
	public void showPjctHrDetail() {
	}
	
	@RequestMapping("project/hr_modify")
	public void showPjctHrModify() {
	}
	
	/*
	 * @RequestMapping("requre/list") public void showRequreList() { }
	 */
}
