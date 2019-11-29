package spring.model.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.utility.webtest.DBOpen;
import spring.utility.webtest.DBclose;

@Repository
public class BbsDAO {
	public boolean checkRefnum(int bbsno) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		ResultSet rs = null;

		sql.append(" select count(refnum) ");
		sql.append(" from bbs ");
		sql.append(" where refnum = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);

			rs = pstmt.executeQuery();

			rs.next();
			int cnt = rs.getInt(1);
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}
		return flag;
	}

	public boolean reply_create(BbsDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" insert into bbs(bbsno, wname, title, content, passwd, wdate, grpno, ");
		sql.append(" indent,ansnum, refnum, filename, filesize)  ");
		sql.append(" values( ");
		sql.append(" (select nvl(max(bbsno),0)+1 from bbs), ");
		sql.append(" ?,?,?,?,sysdate, ");
		sql.append(" ?,?,?,?,?,?) ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getGrpno());
			pstmt.setInt(6, dto.getIndent() + 1);
			pstmt.setInt(7, dto.getAnsnum() + 1);
			pstmt.setInt(8, dto.getBbsno());
			pstmt.setString(9, dto.getFilename());
			pstmt.setInt(10, dto.getFilesize());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt);
		}

		return flag;
	}

	public void reply_ansnum(Map map) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		int grpno = (Integer) map.get("grpno");
		int ansnum = (Integer) map.get("ansnum");

		StringBuffer sql = new StringBuffer();
		sql.append(" update bbs ");
		sql.append(" set ");
		sql.append(" 	ansnum = ansnum+1  ");
		sql.append(" where ");
		sql.append(" 	grpno = ?  ");
		sql.append(" and ");
		sql.append(" 	ansnum > ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt);
		}

	}

	public BbsDTO reply_read(int bbsno) {
		BbsDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select bbsno, grpno, indent, ansnum, title ");
		sql.append(" from bbs ");
		sql.append(" where bbsno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setTitle(rs.getString("title"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}
		return dto;
	}

	public boolean delete(int bbsno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append("  delete from bbs ");
		sql.append(" where bbsno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt);
		}

		return flag;
	}

	public boolean update(BbsDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" update bbs ");
		sql.append(" set wname=?, title=?, content=? ");
		sql.append(" where bbsno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getBbsno());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt);
		}

		return flag;
	}

	public boolean passCheck(Map<String, String> map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 결과

		int bbsno = Integer.parseInt(map.get("bbsno")); // 번호를꺼내옴
		String passwd = map.get("passwd"); // 꺼내옴 비밀번호를 꺼내옴

		StringBuffer sql = new StringBuffer();
		sql.append("  select count(bbsno) as cnt ");
		sql.append("  from bbs ");
		sql.append("  where bbsno=? ");
		sql.append("  and passwd=? ");
		// 둘다 맞춰야하는 것

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno); // 입력한 번호값이 1번째로 가고 맞는지 비교함
			pstmt.setString(2, passwd); // 입력한 패스워드 값이 2번째 물음표에 들어와서 password와 비교함

			rs = pstmt.executeQuery();

			rs.next(); // 데이터를 있는 곳으로 내려오는 작업이 필요함 (결과값이 무조건 있음)
			// if나 while에는 데이터가 있을수도 없을 수도 있음
			// 데이터가 있을때마다 하려는 건데 없어도 0이라는 값을 리턴시킴 rs는 0이든 1이든 있어야함

			int cnt = rs.getInt("cnt");

			if (cnt > 0)
				flag = true; // 가져온 값이 0 보다 크면 맞는 것

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}
		return flag;
	}

	public BbsDTO read(int bbsno) {
		BbsDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT bbsno, wname, title, content, viewcnt, wdate, filename, filesize ");
		sql.append(" 		FROM bbs    ");
		sql.append(" 		where bbsno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new BbsDTO();
				dto.setBbsno(bbsno);
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}
		return dto;
	}

	public void upViewcnt(int bbsno) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" update bbs  ");
		sql.append(" set viewcnt = viewcnt + 1 ");
		sql.append(" where bbsno = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt);
		}

	}

	public boolean create(BbsDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" insert into bbs(bbsno, wname, title, content, passwd, wdate,grpno, filename, filesize) ");
		sql.append(" values( ");
		sql.append(" (select nvl(max(bbsno),0)+1 from bbs), ");
		sql.append(" ?,?,?,?,sysdate, ");
		sql.append(" (select nvl(max(grpno),0)+1 from bbs),?,?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getFilename());
			pstmt.setInt(6, dto.getFilesize());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt);
		}
		return flag;
	}

	public int total(Map map) {
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from bbs  ");
		if (word.length() > 0 && col.equals("title_content")) {
			sql.append(" where title like '%'||?||'%'  ");
			sql.append(" or content like '%'||?||'%'  ");
		} else if (word.length() > 0) {
			sql.append(" where " + col + " like '%'||?||'%'  ");
		}

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.length() > 0 && col.equals("title_content")) {
				pstmt.setString(1, word);
				pstmt.setString(2, word);
			} else if (word.length() > 0) {
				pstmt.setString(1, word);
			}

			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}
		return total;
	}

	public List<BbsDTO> list(Map map) {
		List<BbsDTO> list = new ArrayList<BbsDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT bbsno, wname, title, viewcnt, " + " to_char(wdate,'yyyy-mm-dd') wdate, ");
		sql.append(" grpno, indent, ansnum, filename, r  ");
		sql.append(" FROM(    ");
		sql.append("    SELECT bbsno, wname, title, viewcnt, wdate, ");
		sql.append("    grpno, indent, ansnum, filename, rownum r   ");
		sql.append("    FROM(    ");
		sql.append("       SELECT bbsno, wname, title, viewcnt, wdate ");
		sql.append("      ,grpno,indent,ansnum, filename ");
		sql.append("       FROM bbs   ");
		if (word.length() > 0 && col.equals("title_content")) {
			sql.append(" where title like '%'||?||'%'  ");
			sql.append(" or content like '%'||?||'%'  ");
		} else if (word.length() > 0) {
			sql.append(" where " + col + " like '%'||?||'%'  ");
		}
		sql.append(" 			ORDER BY grpno desc,ansnum   ");
		sql.append("          ) ");
		sql.append("      ) ");
		sql.append("  where r>=? and r<=? ");

		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if (word.length() > 0 && col.equals("title_content")) {
				pstmt.setString(++i, word);
				pstmt.setString(++i, word);
			} else if (word.length() > 0) {
				pstmt.setString(++i, word);
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setFilename(rs.getString("filename"));

				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}
		return list;
	}
}
