package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Member;
import com.ducks.demys.command.SearchCriteria;

@Mapper
public interface MemberRepository {
	// JH
	public List<Member> getMemberList();
	public List<Member> getMemberListSearch(String searchType, String keyword);
	
	public Member getMemberByMEMBER_NUM(int MEMBER_NUM);
	
	public Member getMemberByMEMBER_ID(String MEMBER_ID);
	
	public int selectMemberSequenceNextValue();
	
	public void registMember(Member member);
	
	public void modifyMember(Member member);

	public void modifyForQuitMember(Member member);
	
	public void removeMember(int MEMBER_NUM);

}
