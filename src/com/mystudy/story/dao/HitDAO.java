package com.mystudy.story.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.story.mybatis.DBService;
import com.mystudy.story.vo.HitVO;

public class HitDAO {
	//인기게시글 조회
		public static List<HitVO> hitTravel() {
			SqlSession ss = DBService.getFactory().openSession();
			List<HitVO> list= ss.selectList("story.hitTravel");
			ss.close();
			return list;
		}
}