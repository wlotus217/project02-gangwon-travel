package com.mystudy.info.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.info.mybatis.DBService;
import com.mystudy.info.vo.contestVO;
import com.mystudy.info.vo.infoVO;
import com.mystudy.info.vo.planVO;

public class planDAO {
	
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("PLAN.totalCount");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<planVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<planVO> list = ss.selectList("PLAN.list", map);
		ss.close();
		return list;
	}
	
	public static planVO selectOne(int tripnum) {
		SqlSession ss = DBService.getFactory().openSession();
		planVO vo = ss.selectOne("PLAN.one", tripnum);
		ss.close();
		return vo;
	}
	
	public static int insert(planVO pvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("PLAN.planinsert", pvo);
		ss.close();
		return result;
	}

	public static List<planVO> getPlanList(String info) {
		SqlSession ss = DBService.getFactory().openSession();
		List<planVO> list = ss.selectList("PLAN.plansearch", info);
		ss.close();
		return list;
	}
	
	public static int planDelete(int tripnum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("PLAN.plandelete", tripnum);
		ss.close();
		return result;
	}
	
	public static int planModify(planVO pvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("PLAN.planmodify", pvo);
		ss.close();
		return result;
	}
	
	public static int getsearchTotalCount(String triptitle) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("PLAN.searchtotalCount", triptitle);
		ss.close();
		return totalCount;
	}
	
	public static List<planVO> getPlanList(int begin, int end, String triptitle) {
		Map<String, Object> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("triptitle", triptitle);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<planVO> list = ss.selectList("PLAN.titlesearch", map);
		ss.close();
		return list;
	}
	
}

















