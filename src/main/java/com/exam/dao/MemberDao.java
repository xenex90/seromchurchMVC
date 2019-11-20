package com.exam.dao;

import java.sql.*;
import java.util.*;

import com.exam.vo.MemberVO;

public  class MemberDao {
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	private MemberDao() {	
	}
	
	public boolean isIdDuplicated(String id) {
		boolean isIdDuplicated = false;
		int count = 0; 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql= "";
		try {
			con = DBManager.getConnection();
			sql = "SELECT COUNT(*) AS cnt FROM jspdb.member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next(); 
			count = rs.getInt(1);
			if (count == 1) {
				isIdDuplicated = true; 
			} else { 
				isIdDuplicated = false; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return isIdDuplicated;
	}
	
	
	
	
	
	
	public int insertMember(MemberVO vo) {
		Connection con = null; // 占쏙옙占썩서 con占쏙옙 pstmt占쏙옙 占십드에 占싸게되몌옙 占쏙옙占시울옙 占실드릴 占쏙옙 占쌍게되억옙 占쏙옙占쏙옙占쏙옙 占쌩삼옙占쏙옙.
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			con = DBManager.getConnection();
			//3占쌤곤옙: sql占쏙옙 占쌔븝옙占쌔쇽옙 占쏙옙占쏙옙
			String sql = "INSERT INTO jspdb.member (id,passwd,name,reg_date,email,tel,mtel,address)";
			sql += " VALUES (?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getName());
			pstmt.setTimestamp(4, vo.getRegDate());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getTel());
			pstmt.setString(7, vo.getMtel());
			pstmt.setString(8, vo.getAddress());
			// 4占쌤곤옙: sql占쏙옙 占쏙옙占쏙옙
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		return rowCount;
	} // insertMember method

	
	
	public int userCheck(String id, String passwd) {
		int check = -1; // -1 占쏙옙占싱듸옙 占쏙옙占쏙옙치. 0 占싻쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙치. 1 占쏙옙치占쏙옙
		Connection con= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBManager.getConnection();
			// 3占쌤곤옙: sql占쏙옙 占쌔븝옙占쌔쇽옙 占쏙옙占쏙옙
			String sql = "SELECT passwd FROM jspdb.member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4占쌤곤옙: sql占쏙옙 占쏙옙占쏙옙
			rs = pstmt.executeQuery();
			// 5占쌤곤옙: rs 占쏙옙占쏙옙占쏙옙 占쏙옙占�			  
			if (rs.next()) {
				// 占쏙옙占싱듸옙 占쏙옙占쏙옙
				if (passwd.equals(rs.getString("passwd"))) {
					check = 1;
				} else {
					check = 0;
				}
			} else { // 占쏙옙占싱듸옙 占쏙옙占쏙옙
				check = -1;
			}
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return check;
	} // userCheck method
	
static	public int userCheck2(String id, String email) {
		int check = -1; // -1 占쏙옙占싱듸옙 占쏙옙占쏙옙치. 0 占싻쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙치. 1 占쏙옙치占쏙옙
		Connection con= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBManager.getConnection();
			// 3占쌤곤옙: sql占쏙옙 占쌔븝옙占쌔쇽옙 占쏙옙占쏙옙
			String sql = "SELECT email FROM jspdb.member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4占쌤곤옙: sql占쏙옙 占쏙옙占쏙옙
			rs = pstmt.executeQuery();
			// 5占쌤곤옙: rs 占쏙옙占쏙옙占쏙옙 占쏙옙占�			  
			if (rs.next()) {
				// 占쏙옙占싱듸옙 占쏙옙占쏙옙
				if (email.equals(rs.getString("email"))) {
					check = 1;
				} else {
					check = 0;
				}
			} else { // 占쏙옙占싱듸옙 占쏙옙占쏙옙
				check = -1;
			}
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return check;
	} // userCheck method
	
	
	// 占쏙옙체 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙
	public static List<MemberVO>  getMembers() { // List占쏙옙 占쏙옙체 占쌕깍옙占싹몌옙 占싹놂옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙
		List<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			// 1占쌤곤옙: DB 占쏙옙占쏙옙譴占� 占싸듸옙
			// 2占쌤곤옙: DB占쏙옙占쏙옙
			con = DBManager.getConnection();
			// 3占쌤곤옙: sql占쏙옙 占쌔븝옙
			sql = "SELECT * FROM jspdb.member ORDER BY id ASC";
			stmt = con.createStatement();
			// 4占쌤곤옙: sql占쏙옙 占쏙옙占쏙옙 -> rs占쏙옙占쏙옙
			rs = stmt.executeQuery(sql);
			// 5占쌤곤옙: while占쏙옙 rs.next() 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
			//        占쌘바븝옙체 MemberVO 占쏙옙占쏙옙 <- rs 占쏙옙1占쏙옙 占쏙옙占쏙옙
			//        占쌘바븝옙 占싼곤옙 -> 占썼열占쏙옙占쏙옙트占쏙옙 占쌩곤옙
			while (rs.next()) {
				MemberVO memberVO = new MemberVO();
				memberVO.setId(rs.getString("id"));
				memberVO.setPasswd(rs.getString("passwd"));
				memberVO.setName(rs.getString("name"));
				// rs.getInt("age"); 占쏙옙占쌘곤옙占쏙옙 null占쏙옙 占싣니곤옙 占쌓삼옙 占쏙옙占쏙옙占쏙옙 占쏙옙.
				String strAge = rs.getString("age"); 
				if (strAge != null) { // "33"
				}
				memberVO.setEmail(rs.getString("email"));
				memberVO.setRegDate(rs.getTimestamp("reg_Date"));
				list.add(memberVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, stmt, rs);
		}
		return list;
	} // getMembers method

	
	
	
	
	public static MemberVO getMember(String id) {
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con = DBManager.getConnection();
			sql = "SELECT * FROM jspdb.member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4占쌤곤옙: sql占쏙옙 占쏙옙占쏙옙 
			rs = pstmt.executeQuery();
			// 5占쌤곤옙: rs 占쏙옙占쏙옙占쏙옙 占쏙옙占�
			if (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setId(rs.getString("id"));
				memberVO.setPasswd(rs.getString("passwd"));
				memberVO.setName(rs.getString("name"));
				
				// rs.getInt("age");  占쏙옙占쌘곤옙占쏙옙 null占쏙옙 占싣니곤옙 占쌓삼옙 占쏙옙占쏙옙占쌀띰옙.
				String strAge = rs.getString("age");
				if (strAge != null) { // "33"
				}
				
				memberVO.setEmail(rs.getString("email"));
				memberVO.setRegDate(rs.getTimestamp("reg_date"));
			 } 
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return memberVO;
	} // getMember method
	
	
	
	
	// 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙 method
	// 占신곤옙占쏙옙占쏙옙 memberVO占쏙옙 passwd占십듸옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占싣니띰옙
	// 占쏙옙占쏙옙 확占쏙옙 占쎈도占쏙옙 占쏙옙占�
	public int updateMemberVO(MemberVO memberVO) {
		int rowCount = 0; // 1 占쏙옙占쏙옙占쏙옙占쏙옙, 0占쏙옙占쏙옙占쏙옙占쏙옙
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			// 1占쌤곤옙: DB 占쏙옙占쏙옙譴占� 占싸듸옙
			// 2占쌤곤옙: DB占쏙옙占쏙옙
			con = DBManager.getConnection();
			// 3占쌤곤옙: sql占쏙옙 占쌔븝옙
			sql = "UPDATE jspdb.member SET name=?, passwd=?, reg_date=?, email=?, tel=?, mtel=?, address=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			//pstmt.setString(1, MemberVO.getId());
			pstmt.setString(1, memberVO.getName()); 
			//pstmt.setInt(2, memberVO.getAge()); // age占십드값占쏙옙 占쌓삼옙 占쏙옙占쏙옙 占쏙옙占쏙옙 
			pstmt.setString(2, memberVO.getPasswd());
			pstmt.setTimestamp(3, memberVO.getRegDate());
			pstmt.setString(4, memberVO.getEmail());
			pstmt.setString(5, memberVO.getTel());
			pstmt.setString(6, memberVO.getMtel());
			pstmt.setString(7, memberVO.getAddress());
			pstmt.setString(8, memberVO.getId());
			// 占쏙옙占쏙옙
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		return rowCount;
	} // updateMember method
	
	
	
	
	
	// 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙 method
	// 占신곤옙占쏙옙占쏙옙 memberVO占쏙옙 passwd占십듸옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占싣니띰옙
	// 占쏙옙占쏙옙 확占쏙옙 占쎈도占쏙옙 占쏙옙占�
	public int deleteMember(String id) {
		int rowCount = 0; // 1 占쏙옙占쏙옙占쏙옙占쏙옙, 0占쏙옙占쏙옙占쏙옙占쏙옙
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = DBManager.getConnection();
			sql = "DELETE FROM jspdb.member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);    
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		return rowCount;
	} // updateMember method
	
	public int deleteMember(MemberVO memberVO) {
		int rowCount = 0; // 1 占쏙옙占쏙옙占쏙옙占쏙옙, 0占쏙옙占쏙옙占쏙옙占쏙옙
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			// 1占쌤곤옙: DB 占쏙옙占쏙옙譴占� 占싸듸옙
			// 2占쌤곤옙: DB占쏙옙占쏙옙
			con = DBManager.getConnection();
			// 3占쌤곤옙: sql占쏙옙 占쌔븝옙
			sql = "DELETE FROM jspdb.member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,memberVO.getId());
			// 占쏙옙占쏙옙
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		return rowCount;
	} // updateMember method
	
	public static ArrayList<MemberVO> getMemberAll(){

		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			String sql = "select * from jspdb.member";

			con = DBManager.getConnection();

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while(rs.next()){

				MemberVO dto =  new MemberVO();

				dto.setId(rs.getString("id")); 
				//pstmt.setInt(2, memberVO.getAge()); // age占십드값占쏙옙 占쌓삼옙 占쏙옙占쏙옙 占쏙옙占쏙옙 
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setRegDate(rs.getTimestamp("reg_date"));
				dto.setMtel(rs.getString("Mtel"));
				list.add(dto);

			}

		} catch (Exception e) {

			System.out.println("getMemberAll err : ");

		} finally {

			DBManager.close(con, pstmt, rs);

		}

		return list;

	}
	
	
	
	
} // class
