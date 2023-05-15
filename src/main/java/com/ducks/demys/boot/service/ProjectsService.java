package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.IssueRepository;
import com.ducks.demys.boot.repository.ProjectsRepository;
import com.ducks.demys.boot.vo.Projects;

@Service
public class ProjectsService {
	
	private ProjectsRepository projectsRepository;
	private IssueRepository issueRepository;
	
	public ProjectsService(ProjectsRepository projectsRepository, IssueRepository issueRepository) {
		this.projectsRepository= projectsRepository;
		this.issueRepository = issueRepository;
	}
	
	
	
	public List<Projects> getPJList(){
		
		List<Projects> projectsList = projectsRepository.getPJList();
		
		for(Projects project : projectsList) {
			project.setISSUE_COUNT(issueRepository.getIssuePjListCount(project.getPJ_NUM()));
//			projectsList.add(project);
		}
		System.out.println("~~projectsList: "+projectsList);
		return projectsList;
	}
	public List<Projects> getPJListByMEMBER_NUM(int MEMBER_NUM){
		return projectsRepository.getPJListByMEMBER_NUM(MEMBER_NUM);
	}

	public Projects getPJByPJ_NUM(int PJ_NUM){
		return projectsRepository.getPJByPJ_NUM(PJ_NUM);
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
