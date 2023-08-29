package dao;

import java.util.List;

import model.Notice;

public interface NoticeDao {
	Notice getDetail(Integer no);//글번호로 공지글 검색
	void deleteNotice(Integer no);//글번호로 공지글 삭제
	void updateNotice(Notice notice);//공지글 변경
	Integer getMaxNoticeNo();//가장 큰 공지글 번호 검색
	void putNotice(Notice notice);//공지글 삽입
	Integer getNoticeCount();//공지글의 갯수 검색
	List<Notice> getAllNotices(Integer pageNo);//페이지 번호로 해당 페이지에 출력할 공지글 목록 검색
}
