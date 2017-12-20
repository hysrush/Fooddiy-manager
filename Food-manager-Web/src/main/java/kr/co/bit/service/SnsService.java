package kr.co.bit.service;

import java.util.List;

import kr.co.bit.vo.PagingVO;
import kr.co.bit.vo.SnsBoardVO;

public interface SnsService {
	List<SnsBoardVO> selectSns(PagingVO paging);

}
