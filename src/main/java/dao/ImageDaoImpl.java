package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.FromTo;
import model.ImageBBS;
@Repository
public class ImageDaoImpl implements ImageDao {
	@Autowired
	private SqlSession session;
	
	private static final String MAPPER = "mapper.imageMapper";

	public void updateImageBBS(ImageBBS bbs) {
		this.session.update(MAPPER+".updateImageBBS", bbs);
	}

	public void deleteImageBBS(Integer id) {
		this.session.delete(MAPPER+".deleteImageBBS", id);
	}

	public ImageBBS getImageDetail(Integer id) {
		return this.session.selectOne(MAPPER+".getImageDetail",id);
	}

	public List<ImageBBS> getImages(FromTo ft) {
		return this.session.selectList(MAPPER+".getImages", ft);
	}

	public Integer getImageCount() {
		return this.session.selectOne(MAPPER+".getImageCount");
	}

	public void updateOrderNo(ImageBBS bbs) {
		this.session.update(MAPPER+".updateOrderNo",bbs);
	}

	public Integer getMaxId() {
		Integer max = this.session.selectOne(MAPPER+".getMaxImageBBS");
		if(max == null) max = 0;
		return max;
	}

	public void create(ImageBBS bbs) {
		this.session.insert(MAPPER+".putImageBBS",bbs);
	}

}
