package spring.model.member;

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
public class MemberDAO {
	public String getGrade(String id) {
		String grade =null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select grade  ");
		sql.append(" from member  ");
		sql.append(" where id = ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				grade = rs.getString("grade");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBclose.close(con, pstmt, rs);
		}
		
		return grade;
	}
	
	public String passwd_find(Map map) {
		String flag = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String id = (String) map.get("id");
		String email = (String) map.get("email");

		StringBuffer sql = new StringBuffer();
		sql.append("  select passwd from member  ");
		sql.append("  where id = ? and email = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, email);

			rs = pstmt.executeQuery();
				if (rs.next()) {
					flag = rs.getString("passwd");
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}
		return flag;
	}

	public String id_find(Map map) {
		String flag = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String mname = (String) map.get("mname");
		String email = (String) map.get("email");

		StringBuffer sql = new StringBuffer();
		sql.append("  select id from member  ");
		sql.append("  where mname = ? and email = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mname);
			pstmt.setString(2, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				flag = rs.getString("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}
		return flag;
	}

	public boolean delete(String id) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" delete from member   ");
		sql.append(" where id = ?   ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

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

	public boolean loginCheck(Map<String,String> map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = map.get("id");
		String pw = map.get("passwd");

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) as cnt  ");
		sql.append(" from member  ");
		sql.append(" where id = ?  ");
		sql.append(" and passwd = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();

			rs.next();

			int cnt = rs.getInt("cnt");
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}

		return flag;
	}

	public boolean update(MemberDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" update member ");
		sql.append(" set  ");
		sql.append(" 	tel = ?, ");
		sql.append(" 	email = ?,  ");
		sql.append(" 	zipcode = ?,  ");
		sql.append(" 	address1 = ?,  ");
		sql.append(" 	address2 = ?,  ");
		sql.append(" 	job = ?  ");
		sql.append(" where id=?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTel());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getJob());
			pstmt.setString(7, dto.getId());

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

	public boolean updatePw(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		String id = (String) map.get("id");
		String pw = (String) map.get("pw");

		StringBuffer sql = new StringBuffer();

		sql.append(" update member  ");
		sql.append(" set passwd = ?  ");
		sql.append(" where id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, pw);
			pstmt.setString(2, id);

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

	public boolean updateFile(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		String id = (String) map.get("id");
		String fname = (String) map.get("fname");

		StringBuffer sql = new StringBuffer();

		sql.append(" update member  ");
		sql.append(" set fname = ?  ");
		sql.append(" where id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	public MemberDTO read(String id) {
		MemberDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT id, mname, tel, email, zipcode, address1, address2,  ");
		sql.append("     job, mdate, fname, grade  ");
		sql.append(" FROM member   ");
		sql.append(" WHERE id=?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJob(rs.getString("job"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
				dto.setTel(rs.getString("tel"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}

		return dto;
	}

	public int total(Map map) {
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from member ");

		if (word.trim().length() > 0) { // trim() = 빈공간 제거
			sql.append(" 		where " + col + " like '%'||?||'%' ");
		}
		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0) {
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

	public List<MemberDTO> list(Map map) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT id, mname, tel, email, zipcode, address1, address2, ");
		sql.append(" fname,  r ");
		sql.append(" 		from( ");
		sql.append("     SELECT id, mname, tel, email, zipcode, address1, address2,  ");
		sql.append(" 		fname, rownum r ");
		sql.append(" 		from( ");
		sql.append("      SELECT id, mname, tel, email, zipcode, address1, ");
		sql.append(" 			address2, fname ");
		sql.append(" 			FROM member ");
		if (word.trim().length() > 0) { // trim() = 빈공간 제거
			sql.append(" 		where " + col + " like '%'||?||'%' ");
		}

		sql.append(" 			ORDER BY mdate DESC  ");
		sql.append(" 			) ");
		sql.append(" 		) where r >= ? and r <= ? ");

		try {
			int i = 1;
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0) {
				pstmt.setString(i++, word);
			}
			pstmt.setInt(i++, sno);
			pstmt.setInt(i++, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setFname(rs.getString("fname"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt, rs);
		}

		return list;
	}

	public boolean create(MemberDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" insert into member(id, passwd, mname, tel, email,  ");
		sql.append(" zipcode, address1, address2, job, mdate, fname, grade)  ");
		sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?,sysdate,?,'H')  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
			pstmt.setString(10, dto.getFname());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose.close(con, pstmt);
		}

		return flag;

	}

	public boolean duplicateEmail(String email) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(email) ");
		sql.append(" from member  ");
		sql.append(" where email = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);

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

	public boolean duplicateID(String id) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) ");
		sql.append(" from member  ");
		sql.append(" where id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

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
}
