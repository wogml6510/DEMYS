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
import com.ducks.demys.boot.service.PjhrService;
import com.ducks.demys.boot.service.ProjectsService;
import com.ducks.demys.boot.vo.Contacts;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Pjct;
import com.ducks.demys.boot.vo.Pjhr;
import com.ducks.demys.boot.vo.Projects;
import com.ducks.demys.command.SearchCriteria;

@Controller
public class ProjectsController {
	private ProjectsService projectsService;
	private MemberService memberService;
	private ContactsService contactsService;
	private PjctService pjctService;
	private PjhrService pjhrService;
	
	public ProjectsController(ProjectsService projectsService, MemberService memberService, ContactsService contactsService
			, PjctService pjctService, PjhrService pjhrService) {
		this.projectsService = projectsService;
		this.memberService = memberService;
		this.contactsService = contactsService;
		this.pjctService = pjctService;
		this.pjhrService = pjhrService;
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
		int pjctListCount = pjctService.getContactsPjctListCount(PJ_NUM);		
		model.addAttribute("projects", projects);		
		model.addAttribute("pjctList", pjctList);	
		model.addAttribute("pjctListCount", pjctListCount);	
			
		return "project/detail";
	}
	@RequestMapping("project/PjModifyDo")
	@ResponseBody
	public int PjModifyDo(@RequestBody Projects project) {

		projectsService.modifyPJ(project);
		System.out.println("project : " + project);
		
		return project.getPJ_NUM();
	}
	
	

//	거래처
	@RequestMapping("project/contacts_Regist")
	@ResponseBody
	public void pjctContactsRegistdo(@RequestBody Pjct pjct) {
	    pjctService.registPjct(pjct);
	}
	@RequestMapping("project/pjct_Remove")
	@ResponseBody
	public void pjctRemovedo(int PJCT_NUM) {
		pjctService.removePjct(PJCT_NUM);
	}
	
	
	@RequestMapping("project/regist_PJTYPE")
	public String sendpjtype(Model model, int PJ_TYPE) {
		model.addAttribute("PJ_TYPE",PJ_TYPE);
		//System.out.println(PJ_TYPE);
		return "project/regist_detail";
	}
	
	@RequestMapping("project/regist")
	public void pjctRegist() {}
	
	@RequestMapping("project/regist_detail")
	public void pjctRegistDetail() {}
	
	@RequestMapping("project/pjRegistdo")
	@ResponseBody
	public void pjctRegistdo(@RequestBody Projects projects) {
		int memberId = 1;
		Map<String, Object> map = new HashMap<>();
		map.put("MEMBER_NUM", memberId);
		
		projectsService.registPJ(projects);
	}
	
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
	 
	
	 
//	참여인력
	@RequestMapping("project/PjNumhrList")
	public String sendPjNumhrList(Model model, int PJ_NUM) {
		Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);
		List<Pjhr> pjhrList = pjhrService.getPjhrListByPJ_NUM(PJ_NUM);
		int pjhrListCount = pjhrService.getPjhrListByPJ_NUMCount(PJ_NUM);
		
		model.addAttribute("projects",projects);
		model.addAttribute("pjhrList",pjhrList);
		model.addAttribute("pjhrListCount",pjhrListCount);
		model.addAttribute("PJ_NUM",PJ_NUM);
		return "project/hr_list";
	}
	
	@RequestMapping("project/hr_list")
	public void showPjctHrList() {}
	
	
	@RequestMapping("project/hr_detail")
	public void showPjctHrDetail(Model model, int PJHR_NUM) {
		Pjhr pjhr = pjhrService.getPjhrByPJHR_NUM(PJHR_NUM);
		model.addAttribute("pjhr",pjhr);
	}

	@RequestMapping("project/hr_listadd")
	@ResponseBody
	public void PjctHrDetailAdd(Model model, int PJ_NUM) {
		Projects projects = projectsService.getPJByPJ_NUM(PJ_NUM);
		List<Pjhr> pjhrList = pjhrService.getPjhrListByPJ_NUM(PJ_NUM);
		int pjhrListCount = pjhrService.getPjhrListByPJ_NUMCount(PJ_NUM);
		
		model.addAttribute("projects",projects);
		model.addAttribute("pjhrList",pjhrList);
		model.addAttribute("pjhrListCount",pjhrListCount);
		model.addAttribute("PJ_NUM",PJ_NUM);
	}
	@RequestMapping("project/hr_modify")
	public void showPjctHrModify(Model model, int PJHR_NUM,int PJ_NUM) {
		Pjhr pjhr = pjhrService.getPjhrByPJHR_NUM(PJHR_NUM);
		model.addAttribute("pjhr",pjhr);
	}
	@RequestMapping("project/hr_modifydo")
	@ResponseBody
	public int PjctHrModifyDo(@RequestBody Pjhr pjhr) {
		int PJHR_NUM = pjhr.getPJHR_NUM();
	    pjhrService.getPjhrByPJHR_NUM(PJHR_NUM);
		pjhrService.modifyPjhr(pjhr);
		System.err.println("PJHR_NUM: "+PJHR_NUM);
		return pjhr.getPJ_NUM();
	}
	@RequestMapping("project/pjhr_Remove")
	@ResponseBody
	public void pjhrRemovedo(int PJHR_NUM) {
		pjhrService.removePjhr(PJHR_NUM);
	}
	@RequestMapping("project/pjhrRegist")
	@ResponseBody
	public void pjhrRegistdo(@RequestBody Pjhr pjhr) {
		pjhrService.registPjhr(pjhr);
	}
	
	

}










