package com.ducks.demys.boot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.ContactsService;
import com.ducks.demys.boot.service.MemberService;
import com.ducks.demys.boot.service.PjctService;
import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.boot.vo.Contacts;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Pjct;
import com.ducks.demys.boot.vo.Projects;
import com.ducks.demys.command.SearchCriteria;

@Controller
public class ProjectsController {
	private ProjectsService projectsService;
	private MemberService memberService;
	private ContactsService contactsService;
	private PjctService pjctService;
	
	public ProjectsController(ProjectsService projectsService, MemberService memberService, ContactsService contactsService, PjctService pjctService) {
		this.projectsService = projectsService;
		this.memberService = memberService;
		this.contactsService = contactsService;
		this.pjctService = pjctService;
	}
	
	// Action
	@RequestMapping("project/main")
	public String pjctList(Model model,  @ModelAttribute SearchCriteria cri) {
		if (cri.getPage() < 1) cri.setPage(1);
		if (cri.getPerPageNum() < 1) cri.setPerPageNum(5);
	
	    Map<String, Object> dataMap = projectsService.getPJList(cri); 
	    model.addAttribute("dataMap", dataMap);
		return "project/main";
	}
	
	@RequestMapping("project/detail")
	public String pjctDetail(Model model, int PJ_NUM ) {
		Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);

		List<Pjct> pjctList = pjctService.getContactsPjctList(PJ_NUM);
		
		model.addAttribute("projects", projects);		
		model.addAttribute("pjctList", pjctList);	
			
		return "project/detail";
	}

//	@RequestMapping("project/pjctList")
//	public void pjctDetailRode() {}
	
	@RequestMapping("project/contacts_Regist")
	@ResponseBody
	public void pjctContactsRegistdo(@RequestBody Pjct pjct) {
	    pjctService.registPjct(pjct);
	}
	@RequestMapping("project/contacts_Remove")
	public void pjctContactsRemovedo(int PJCT_NUM) {
		pjctService.removePjct(PJCT_NUM);
	}
	@RequestMapping("project/regist")
	public void pjctRegist() {}
	
	@RequestMapping("project/pjRegistdo")
	@ResponseBody
	public void pjctRegistdo(@RequestBody Projects projects) {
		int memberId = 1;
		Map<String, Object> map = new HashMap<>();
		map.put("MEMBER_NUM", memberId);
		
		projectsService.registPJ(projects);
	}
	
	@RequestMapping("project/regist_PJTYPE")
	public String sendpjtype(Model model, int PJ_TYPE) {
		model.addAttribute("PJ_TYPE",PJ_TYPE);
		//System.out.println(PJ_TYPE);
		return "project/regist_detail";
	}
	
	@RequestMapping("project/regist_detail")
	public void pjctRegistDetail() {}
	
	@RequestMapping("project/Search_Modal")
	@ResponseBody
	public Map<String, Object> pjctSearch() {
		Map<String, Object> data=new HashMap<String, Object>();
		
		List<Member> memberList = memberService.getMemberList();
		List<Contacts> contactsList = contactsService.getContactsListPjRegist();
		
		data.put("memberList",memberList);
		data.put("contactsList",contactsList);
		return data;
	}
	 @RequestMapping("project/regist_searchMEMBER")
	 @ResponseBody
	 public Map<String, Object> sendsearchMember(Model model, 
			 @RequestParam String searchType, @RequestParam String keyword ) {
		 
		 Map<String, Object> data = new HashMap<String, Object>();
		 List<Member> memberList = memberService.getMemberListSearch(searchType, keyword);
		 data.put("memberList", memberList);
		 
		 return data; 
	 }
	 
	 @RequestMapping("project/regist_searchCONTACTS")
	 @ResponseBody
	 public Map<String, Object> sendsearchContacts(Model model, 
			 @RequestParam String searchType, @RequestParam String keyword ) {
		 
		 Map<String, Object> data = new HashMap<String, Object>();
		 List<Contacts> contactsList = contactsService.getContactsListPjRegistSearch(searchType, keyword);
			
		 data.put("contactsList", contactsList);
		 
		 return data; 
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

}










