package com.ducks.demys.boot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ducks.demys.boot.service.IssueService;
import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.boot.vo.Issue;
import com.ducks.demys.boot.vo.Projects;

@Controller
public class ProjectsController {
	private ProjectsService projectsService;
	private IssueService issueService;
	
	public ProjectsController(ProjectsService projectsService) {
		this.projectsService = projectsService;
		this.issueService = issueService;
	}
	
	// Action
	@RequestMapping("project/main")
	public String showPjctlist(Model model) {
		//Issue issue = issueService.getIssueByISSUE_NUM(issueNum);
		List<Projects> projects = projectsService.getPJList();
		
		model.addAttribute("projects", projects);
		
		
		return "project/main";
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
