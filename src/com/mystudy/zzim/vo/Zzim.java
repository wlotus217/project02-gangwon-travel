package com.mystudy.zzim.vo;

import java.util.ArrayList;
import java.util.List;

import com.mystudy.zzim.dao.ZzimDAO;

public class Zzim {
	public List<ZzimVO> list; 

	public Zzim() {
		list = new ArrayList<ZzimVO>();
		
	}
	
	public boolean addZzim(String id, String boardName, int boardIdx) {
		boolean hasZzim = true;
		//찜 리스트에 같은 게시물이 있는지 확인
		ZzimVO zvo = new ZzimVO(id, boardName, boardIdx);
		ZzimVO vo = findZzim(zvo);
		if (vo == null) { //리스트에 없음 : 찜 등록
			hasZzim = false;
		} else { //찜 리스트에 있음
			return hasZzim;
		}
		return hasZzim;
	}
	
	//리스트에 제품이 있는지 확인(
	public ZzimVO findZzim(ZzimVO zvo) {
		String id = zvo.getId();
		String boardName = zvo.getBoardName();
		int boardIdx = zvo.getBoardIdx();
		
		ZzimVO vo = null;
		for (ZzimVO listVo : list) {
			if (id.equals(listVo.getId()) && boardName.equals(listVo.getBoardName()) && (boardIdx == listVo.getBoardIdx())) {
				vo = listVo;
				break;
			}
		}
		return vo;
	}
	

}
