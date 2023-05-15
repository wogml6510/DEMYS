package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Projects;
import com.ducks.demys.command.SearchCriteria;

@Mapper
public interface ProjectsRepository {

	public List<Projects> getPJList(SearchCriteria cri);
	
	int getPJListCount (SearchCriteria cri);

	public List<Projects> getPJListByMEMBER_NUM(int MEMBER_NUM);
	
	public Projects getPJByPJ_NUM(int PJ_NUM);
	
	public int selectPJSequenceNextValue();
	
	public void registPJ(Projects project);
	
	public void modifyPJ(Projects project);
	
	public void removePJ(int PJ_NUM);
}
