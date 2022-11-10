package com.mystudy.trip.dao;

import java.util.HashMap;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.trip.vo.CultureVO;
import com.mystudy.trip.vo.EducationVO;
import com.mystudy.trip.vo.ExperienceVO;
import com.mystudy.trip.vo.FestivalVO;
import com.mystudy.trip.vo.HiddenCommentVO;
import com.mystudy.trip.vo.HiddenVO;
import com.mystudy.trip.vo.MemberVO;
import com.mystudy.trip.vo.NatureVO;


public class DAO {
	
	//자연관광
		public static int natureTotalCount() {
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("TRIP.natureTotalCount");
			ss.close();
			return totalCount;
		}
		
		public static int natureInsert(NatureVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("TRIP.natureInsert", vo);
			ss.close();
			return result;
		}
		
		public static List<NatureVO> natureList(int begin, int end) {
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			SqlSession ss = DBService.getFactory().openSession();
			List<NatureVO> list = ss.selectList("TRIP.natureList", map);
			ss.close();
			return list;
		}
		
		public static List<NatureVO> natureSearch(String search, String searchKeyword) {
			Map<String, String> map = new HashMap<>();
			map.put("search", search);
			map.put("searchKeyword", searchKeyword);
			SqlSession ss = DBService.getFactory().openSession();
			List<NatureVO> searchList = ss.selectList("TRIP.natureSearch", map);
			ss.close();
			return searchList;
		}
		
		public static int natureSearchTotalCount(String search, String searchKeyword) {
			Map<String, String> map = new HashMap<>();
			map.put("search", search);
			map.put("searchKeyword", searchKeyword);
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("TRIP.natureSearchTotalCount", map);
			ss.close();
			return totalCount;
		}
		
		public static List<NatureVO> natureSearchList(String begin, String end, String search, String searchKeyword) {
			Map<String, String> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			map.put("search", search);
			map.put("searchKeyword", searchKeyword);
			SqlSession ss = DBService.getFactory().openSession();
			List<NatureVO> searchList = ss.selectList("TRIP.natureSearchList", map);
			ss.close();
			return searchList;
		}
		
		public static NatureVO natureOne(String boardNum) {
			SqlSession ss = DBService.getFactory().openSession();
			NatureVO vo = ss.selectOne("TRIP.natureOne", boardNum);
			ss.close();
			
			return vo;
		}
		
		public static int natureDelete(int boardNum) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("TRIP.natureDelete", boardNum);
			ss.close();
			return result;
		}
		
		public static int natureUpdate(NatureVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("TRIP.natureUpdate", vo);
			ss.close();
			return result;
		}
		
		//문화관광
		
		public static int cultureTotalCount() {
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("TRIP.cultureTotalCount");
			ss.close();
			return totalCount;
		}
		
		public static int cultureInsert(CultureVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("TRIP.cultureInsert", vo);
			ss.close();
			return result;
		}
		
		public static List<CultureVO> cultureList(int begin, int end) {
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			SqlSession ss = DBService.getFactory().openSession();
			List<CultureVO> list = ss.selectList("TRIP.cultureList", map);
			ss.close();
			return list;
		}
		
		public static List<CultureVO> cultureSearch(String search, String searchKeyword) {
			Map<String, String> map = new HashMap<>();
			map.put("search", search);
			map.put("searchKeyword", searchKeyword);
			SqlSession ss = DBService.getFactory().openSession();
			List<CultureVO> searchList = ss.selectList("TRIP.cultureSearch", map);
			ss.close();
			return searchList;
		}
		
		public static int cultureSearchTotalCount(String search, String searchKeyword) {
			Map<String, String> map = new HashMap<>();
			map.put("search", search);
			map.put("searchKeyword", searchKeyword);
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("TRIP.cultureSearchTotalCount", map);
			ss.close();
			return totalCount;
		}
		
		public static List<CultureVO> cultureSearchList(String begin, String end, String search, String searchKeyword) {
			Map<String, String> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			map.put("search", search);
			map.put("searchKeyword", searchKeyword);
			SqlSession ss = DBService.getFactory().openSession();
			List<CultureVO> searchList = ss.selectList("TRIP.cultureSearchList", map);
			ss.close();
			return searchList;
		}
		
		public static CultureVO cultureOne(String boardNum) {
			SqlSession ss = DBService.getFactory().openSession();
			CultureVO vo = ss.selectOne("TRIP.cultureOne", boardNum);
			ss.close();
			
			return vo;
		}
		
		public static int cultureDelete(int boardNum) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("TRIP.cultureDelete", boardNum);
			ss.close();
			return result;
		}
		
		public static int cultureUpdate(CultureVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("TRIP.cultureUpdate", vo);
			ss.close();
			return result;
		}
		
		//체험관광
		public static int experienceTotalCount() {
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("TRIP.experienceTotalCount");
			ss.close();
			return totalCount;
		}
		
		public static int experienceInsert(ExperienceVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("TRIP.experienceInsert", vo);
			ss.close();
			return result;
		}
		
		public static List<ExperienceVO> experienceList(int begin, int end) {
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			SqlSession ss = DBService.getFactory().openSession();
			List<ExperienceVO> list = ss.selectList("TRIP.experienceList", map);
			ss.close();
			return list;
		}
		
		public static List<ExperienceVO> experienceSearch(String search, String searchKeyword) {
			Map<String, String> map = new HashMap<>();
			map.put("search", search);
			map.put("searchKeyword", searchKeyword);
			SqlSession ss = DBService.getFactory().openSession();
			List<ExperienceVO> searchList = ss.selectList("TRIP.experienceSearch", map);
			ss.close();
			return searchList;
		}
		
		public static int experienceSearchTotalCount(String search, String searchKeyword) {
			Map<String, String> map = new HashMap<>();
			map.put("search", search);
			map.put("searchKeyword", searchKeyword);
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("TRIP.experienceSearchTotalCount", map);
			ss.close();
			return totalCount;
		}
		
		public static List<ExperienceVO> experienceSearchList(String begin, String end, String search, String searchKeyword) {
			Map<String, String> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			map.put("search", search);
			map.put("searchKeyword", searchKeyword);
			SqlSession ss = DBService.getFactory().openSession();
			List<ExperienceVO> searchList = ss.selectList("TRIP.experienceSearchList", map);
			ss.close();
			return searchList;
		}
		
		public static ExperienceVO experienceOne(String boardNum) {
			SqlSession ss = DBService.getFactory().openSession();
			ExperienceVO vo = ss.selectOne("TRIP.experienceOne", boardNum);
			ss.close();
			
			return vo;
		}
		
		public static int experienceDelete(int boardNum) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("TRIP.experienceDelete", boardNum);
			ss.close();
			return result;
		}
		
		public static int experienceUpdate(ExperienceVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("TRIP.experienceUpdate", vo);
			ss.close();
			return result;
		}
		
		//축제 및 행사
		public static int festivalTotalCount() {
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("TRIP.festivalTotalCount");
			ss.close();
			return totalCount;
		}
		
		public static int festivalInsert(FestivalVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("TRIP.festivalInsert", vo);
			ss.close();
			return result;
		}
		
		public static List<FestivalVO> festivalList(int begin, int end) {
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			SqlSession ss = DBService.getFactory().openSession();
			List<FestivalVO> list = ss.selectList("TRIP.festivalList", map);
			ss.close();
			return list;
		}
		
		public static FestivalVO festivalOne(String boardNum) {
			SqlSession ss = DBService.getFactory().openSession();
			FestivalVO vo = ss.selectOne("TRIP.festivalOne", boardNum);
			ss.close();
			
			return vo;
		}
		
		public static int festivalDelete(int boardNum) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("TRIP.festivalDelete", boardNum);
			ss.close();
			return result;
		}
		
		public static int festivalUpdate(FestivalVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("TRIP.festivalUpdate", vo);
			ss.close();
			return result;
		}
		
		//교육여행
		public static int educationInsert(EducationVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("TRIP.educationInsert", vo);
			ss.close();
			return result;
		}
		
		public static EducationVO educationOne(String boardNum) {
			SqlSession ss = DBService.getFactory().openSession();
			EducationVO vo = ss.selectOne("TRIP.educationOne", boardNum);
			ss.close();
			
			return vo;
		}
		
		public static List<EducationVO> educationList() {
			SqlSession ss = DBService.getFactory().openSession();
			List<EducationVO> list = ss.selectList("TRIP.educationList");
			ss.close();
			return list;
		}
		
		public static int educationDelete(int boardNum) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("TRIP.educationDelete", boardNum);
			ss.close();
			return result;
		}
		
		//숨은명소
		public static int hiddenTotalCount() {
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("TRIP.hiddenTotalCount");
			ss.close();
			return totalCount;
		}
		
		public static int hiddenSearchTotalCount(String search, String searchKeyword) {
			Map<String, String> map = new HashMap<>();
			map.put("search", search);
			map.put("searchKeyword", searchKeyword);
			SqlSession ss = DBService.getFactory().openSession();
			int totalCount = ss.selectOne("TRIP.hiddenSearchTotalCount", map);
			ss.close();
			return totalCount;
		}
		
		public static List<HiddenVO> hiddenList(int begin, int end) {
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			SqlSession ss = DBService.getFactory().openSession();
			List<HiddenVO> list = ss.selectList("TRIP.hiddenList", map);
			ss.close();
			return list;
		}
		
		public static List<HiddenVO> hiddenSearchList(String begin, String end, String search, String searchKeyword) {
			Map<String, String> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			map.put("search", search);
			map.put("searchKeyword", searchKeyword);
			SqlSession ss = DBService.getFactory().openSession();
			List<HiddenVO> searchList = ss.selectList("TRIP.hiddenSearchList", map);
			ss.close();
			return searchList;
		}
		
		public static HiddenVO hiddenOne(String boardNum) {
			SqlSession ss = DBService.getFactory().openSession();
			HiddenVO vo = ss.selectOne("TRIP.hiddenOne", boardNum);
			ss.close();
			
			return vo;
		}
		
		public static int hiddenInsert(HiddenVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("TRIP.hiddenInsert", vo);
			ss.close();
			return result;
		}
		
		public static int hiddenDelete(int boardNum) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("TRIP.hiddenDelete", boardNum);
			ss.close();
			return result;
		}
		
		public static int hiddenUpdate(HiddenVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("TRIP.hiddenUpdate", vo);
			ss.close();
			return result;
		}
		
		public static int hiddenhitUpdate(HiddenVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("TRIP.hiddenhitUpdate", vo);
			ss.close();
			return result;
		}
		
		//멤버
		public static List<MemberVO> memberList() {
			SqlSession ss = DBService.getFactory().openSession();
			List<MemberVO> list = ss.selectList("TRIP.memberList");
			ss.close();
			return list;
		}
		
		//히든댓글
		public static int hiddenCommentInsert(HiddenCommentVO vo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("TRIP.hiddenCommentInsert", vo);
			ss.close();
			return result;
		}
		
		public static List<HiddenCommentVO> hiddenCommentList() {
			SqlSession ss = DBService.getFactory().openSession();
			List<HiddenCommentVO> list = ss.selectList("TRIP.hiddenCommentList");
			ss.close();
			return list;
		}
		
		public static int hiddenCommentDelete(int boardNum) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("TRIP.hiddenCommentDelete", boardNum);
			ss.close();
			return result;
		}
}