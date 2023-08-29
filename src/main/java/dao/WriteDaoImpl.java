package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Bbs;
import model.FromTo;
@Repository
public class WriteDaoImpl implements WriteDao {
	private static final String MAPPER = "mapper.myMapper";
	@Autowired
	private SqlSession session;
	
	public void updateBBS(Bbs bbs) {
		this.session.update(this.MAPPER+".updateBBS", bbs);
	}

	public void deleteBBS(Integer seqno) {
		this.session.delete(this.MAPPER+".deleteBBS", seqno);
	}

	public Bbs readDetail(Integer seqno) {
		return this.session.selectOne(this.MAPPER+".getBBS",seqno);
	}

	public List<Bbs> readBBS(FromTo ft) {
		List<Bbs> bbsList = this.session.selectList(this.MAPPER+".getAllBBS", ft);
		return bbsList;
	}

	public Integer getBBSCount() {
		return this.session.selectOne(this.MAPPER+".getBBSCount");
	}

	public Integer getMaxSeqno() {
		Integer max = this.session.selectOne(this.MAPPER+".maxBBS");
		if(max == null) return 0;
		return max;
	}

	public void putBBS(Bbs bbs) {
		this.session.insert(this.MAPPER+".putBBS",bbs);
	}

}





