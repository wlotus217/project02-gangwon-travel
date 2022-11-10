package com.mystudy.zzim.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.story.mybatis.DBService;
import com.mystudy.zzim.vo.ZzimVO;

public class ZzimDAO {

	//중복 체크 id + boardName + boardIdx 로 찜 찾기
	public static ZzimVO getZzim(ZzimVO zvo) {
		SqlSession ss = DBService.getFactory().openSession();
		ZzimVO vo = ss.selectOne("story.selectOneZzim", zvo);
		ss.close();
		return vo;
	}
	
	
	//id로 찜 추가
	public static int addZzim(ZzimVO zvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result= ss.update("story.addZzim", zvo);
		ss.close();
		return result;
	}
	
	//id로 찜 리스트 조회
	public static List<ZzimVO> getListZzim(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ZzimVO> list= ss.selectList("story.selectListZzim", id);
		ss.close();
		return list;
	}
	

	//찜 리스트 삭제 - idx 파라미터
	public static int deleteZzim(int idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("story.deleteZzim", idx);
		ss.close();
		return result;
	}
	
	//게시글의 검색리스트 전체 건수 조회
	public static int getTotalCount(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("story.zzimTotalCount", id);
		ss.close();
		return totalCount;
	}
	
	//검색결과리스트 페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<ZzimVO> getPageListZzim(String begin, String end, String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin);
		map.put("end",end);
		map.put("id", id);
			
		SqlSession ss = DBService.getFactory().openSession();
		List<ZzimVO> list = ss.selectList("story.selectPageListZzim", map);
		ss.close();
		return list;

	}
	//게시물 찜 개수 boardname, boardidx
	public static int zzimCountPost(String boardName, String boardIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("boardName", boardName);
		map.put("boardIdx",boardIdx);
		int zzimCount = ss.selectOne("story.zzimCountPost", map);
		ss.close();
		return zzimCount;
	}
	
	
}