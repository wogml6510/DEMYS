package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Issue;

@Mapper
public interface IssueRepository {

	// JH
	public int getIssuePjListCount(int PJ_NUM);
	// JH
	
	public List<Issue> getIssueList();

	public List<Issue> getIssueListByPJ_NUM(int PJ_NUM);
	
	public List<Issue> getIssueListByMEMBER_NUM(int MEMBER_NUM);
	
	public Issue getIssueByISSUE_NUM(int ISSUE_NUM);
	
	public int selectIssueSequenceNextValue();
	
	public void registIssue(Issue issue);
	
	public void modifyIssue(Issue issue);
	
	public void removeIssue(int ISSUE_NUM);
	
}