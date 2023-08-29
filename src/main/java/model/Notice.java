package model;

import org.hibernate.validator.constraints.NotEmpty;

public class Notice {
	private int no;
	@NotEmpty(message="제목을 입력하세요.")
	private String title;
	private String id;
	@NotEmpty(message="내용을 입력하세요.")
	private String content;
	private String notice_date;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
}
