package model;

import org.hibernate.validator.constraints.NotEmpty;

public class Bbs {
	private int seqno;
	@NotEmpty(message="제목을 입력하세요.")
	private String title;
	private String id;
	private String bbs_date;
	@NotEmpty(message="내용을 입력하세요.")
	private String content;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSeqno() {
		return seqno;
	}
	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBbs_date() {
		return bbs_date;
	}
	public void setBbs_date(String bbs_date) {
		this.bbs_date = bbs_date;
	}
}
