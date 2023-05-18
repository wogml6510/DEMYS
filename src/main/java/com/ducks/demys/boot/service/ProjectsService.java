package com.ducks.demys.boot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.IssueRepository;
import com.ducks.demys.boot.repository.MemberRepository;
import com.ducks.demys.boot.repository.ProjectsRepository;
import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.boot.vo.Projects;
import com.ducks.demys.command.PageMaker;
import com.ducks.demys.command.SearchCriteria;

@Service
public class ProjectsService {

	private ProjectsRepository projectsRepository;
	private IssueRepository issueRepository;
//private MemberRepository memberRepository;

	public ProjectsService(ProjectsRepository projectsRepository, IssueRepository issueRepository) {
		this.projectsRepository = projectsRepository;
		this.issueRepository = issueRepository;
	//	this.memberRepository = memberRepository;
	}

	public Map<String, Object> getPJList(SearchCriteria cri) {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<Projects> projectsList = projectsRepository.getPJList(cri);
		// 각 프로젝트의 이슈 갯수
		for (Projects project : projectsList) {
			project.setISSUE_COUNT(issueRepository.getIssuePjListCount(project.getPJ_NUM()));
		}
		dataMap.put("projects", projectsList);

		int totalCount = projectsRepository.getPJListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("pageMaker", pageMaker);

		// memberList
//		List<Member> memberList = memberRepository.getMemberList(cri);
//		dataMap.put("member", memberList);
		
		//System.out.println("Service: dataMap: "+ cri.getKeyword() + cri.getSearchType());

		
		return dataMap;
	}

	public List<Projects> getPJListByMEMBER_NUM(int MEMBER_NUM) {
		return projectsRepository.getPJListByMEMBER_NUM(MEMBER_NUM);
	}

	public Projects getPJByPJ_NUM(int PJ_NUM) {
		Projects projects = projectsRepository.getPJByPJ_NUM(PJ_NUM);
		//System.out.println("PJ_NUM: "+PJ_NUM);
		return projects;
	}

	public void registPJ(Projects project) {
		project.setPJ_NUM(projectsRepository.selectPJSequenceNextValue());
		projectsRepository.registPJ(project);
	}

	public void modifyPJ(Projects project) {
		projectsRepository.modifyPJ(project);
	}

	public void removePJ(int PJ_NUM) {
		projectsRepository.removePJ(PJ_NUM);
	}
}
