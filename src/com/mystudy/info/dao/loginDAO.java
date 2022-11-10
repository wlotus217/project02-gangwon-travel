package com.mystudy.info.dao;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.info.mybatis.DBService;
import com.mystudy.info.vo.MasterVO;
import com.mystudy.info.vo.MemberVO;

public class loginDAO {
	
	public static MemberVO loginId(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("Member.loginID", id);
		ss.close();
		return vo;
	}
	
	public static MasterVO MasterId(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MasterVO vo = ss.selectOne("Member.MasterID", id);
		System.out.println(vo.toString());
		ss.close();
		return vo;
	}
}
