package com.ducks.demys.boot.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String pjctList(Model model, @ModelAttribute SearchCriteria cri, 
			@RequestParam(value = "searchType", defaultValue = "") String searchType,
	        @RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int perPageNum) {
		//Issue issue = issueService.getIssueByISSUE_NUM(issueNum);
		
		cri.setPage(page);
		cri.setPerPageNum(perPageNum);
		cri.setSearchType(searchType);
	    cri.setKeyword(keyword);
		
		// 시작 위치(startRow) 계산
		int startRow = (cri.getPage() - 1) * cri.getPerPageNum() + 1;
		// 끝 위치(endRow) 계산
		int endRow = cri.getPage() * cri.getPerPageNum();
		
		 if (cri.getPage() < 1) cri.setPage(1);
		 if (cri.getPerPageNum() < 1) cri.setPerPageNum(5);
		
		
		Map<String, Object> dataMap = projectsService.getPJList(cri, startRow, endRow);
		
		model.addAttribute("dataMap", dataMap);
		
		
		return "project/main";
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
