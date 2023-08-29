package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.FromTo;
import model.Notice;
@Repository
public class NoticeDaoImpl implements NoticeDao {
	private static final String MAPPER = "mapper.myMapper";

	@Autowired
	private SqlSession session;
	
	public Notice getDetail(Integer no) {
		return this.session.selectOne(MAPPER+".getNoticeDetail",no);
	}

	public void deleteNotice(Integer no) {
		this.session.delete(MAPPER+".deleteNotice",no);
	}

	public void updateNotice(Notice notice) {
		this.session.update(MAPPER+".updateNotice",notice);
	}

	public Integer getNoticeCount() {
		return this.session.selectOne(MAPPER+".getNoticeCount");
	}

	public List<Notice> getAllNotices(Integer pageNo) {
		if(pageNo == null) pageNo = 1;
		int from = (pageNo - 1) * 5;
		int to = ((pageNo - 1) * 5) + 6;
		FromTo ft = new FromTo();
		ft.setFrom(from); ft.setTo(to);
		List<Notice> noticeList = this.session.selectList(MAPPER+".getAllNotices",ft);
		return noticeList;
	}

	public Integer getMaxNoticeNo() {
		Integer max = this.session.selectOne(MAPPER+".getMaxNoticeNo");
		if(max == null) max = 0;
		return max;
	}

	public void putNotice(Notice notice) {
		this.session.insert(MAPPER+".putNotice",notice);
	}

}




