package dao;

import java.util.List;

import model.FromTo;
import model.ImageBBS;

public interface ImageDao {
	void deleteImageBBS(Integer id);//글번호로 게시글 삭제
	void updateImageBBS(ImageBBS bbs);//이미지 게시글 변경
	ImageBBS getImageDetail(Integer id);//글번호로 게시글 검색
	List<ImageBBS> getImages(FromTo ft);//이미지 게시글 검색
	Integer getImageCount();//게시글 갯수 검색
	Integer getMaxId();//가장 큰 글번호 검색
	void create(ImageBBS bbs);//이미지 게시글 삽입
	void updateOrderNo(ImageBBS bbs);//답글 순서 변경
}
