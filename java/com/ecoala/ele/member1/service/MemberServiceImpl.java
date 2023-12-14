package com.ecoala.ele.member1.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.ecoala.ele.member1.dao.IMemberDAO;
import com.ecoala.ele.member1.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	IMemberDAO memberDao;
	
	public List<MemberVO> getMemInfo(){
		return memberDao.getMemInfo();
	}

}
