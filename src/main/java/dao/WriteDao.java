package dao;

import java.util.List;

import model.Bbs;
import model.FromTo;

public interface WriteDao {
	void updateBBS(Bbs bbs);//게시글 수정
	void deleteBBS(Integer seqno);//글번호로 게시글 삭제
	Bbs readDetail(Integer seqno);//글번호로 게시글 조회
	Integer getMaxSeqno();//가장 큰 게시글 번호 검색
	void putBBS(Bbs bbs);//게시글 삽입
	List<Bbs> readBBS(FromTo ft);//게시글의 목록을 검색
	Integer getBBSCount();//게시글의 갯수를 검색
}
