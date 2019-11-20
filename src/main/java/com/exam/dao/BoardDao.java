package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.exam.vo.BoardVO;


public class BoardDao {
	private static BoardDao instance = new BoardDao();
	
	public static BoardDao getInstance() {
		return instance;
	}
	private BoardDao() {		
	}
	
	// insert�� ���ڵ��� ��ȣ ���� �޼ҵ�
	public int nextBoardNum() {
		int num = 0;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DBManager.getConnection();
			// num �÷��߿� �ִ밪 ���ϱ�. ���ڵ� ������ null
			String sql = "SELECT MAX(num) FROM jspdb.board";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			// rs ���ڵ尪 ������ num= �ִ밪 + 1
			//			 ������ num = 1
			if (rs.next()) {
				num = rs.getInt(1)+1;
			} else {
				num = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, stmt, rs);
		}
		
		return num;
	}
	
	// �Խñ� �Ѱ� ����ϴ� �޼ҵ�
	public void insertBoard(BoardVO boardVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		try {
			con = DBManager.getConnection();
			sb.append("INSERT INTO jspdb.board (num, username, passwd, subject, content, readcount, ip, reg_date, re_ref, re_lev, re_seq) ");
			sb.append(" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, boardVO.getNum());
			pstmt.setString(2, boardVO.getUsername());
			pstmt.setString(3, boardVO.getPasswd());
			pstmt.setString(4, boardVO.getSubject());
			pstmt.setString(5, boardVO.getContent());
			pstmt.setInt(6, boardVO.getReadcount());
			pstmt.setString(7, boardVO.getIp());
			pstmt.setTimestamp(8, boardVO.getRegDate());
			pstmt.setInt(9, boardVO.getReRef());
			pstmt.setInt(10, boardVO.getReLev());
			pstmt.setInt(11, boardVO.getReSeq());
			// ����
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		
	} // insertBoard method
	
	/*public List<BoardVO> getBoards(int startRow, int pageSize) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		int endRow = startRow + pageSize - 1; // ����Ŭ���� �����ȣ
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT aa.* ");
		sb.append("FROM ");
		sb.append("   (SELECT ROWNUM AS rnum, a.* ");
		sb.append("    FROM ");
		sb.append("        (SELECT * ");
		sb.append("        FROM jspdb.board ");
		sb.append("        ORDER BY num DESC) a ");
		sb.append("    WHERE ROWNUM <= ?) aa ");
		sb.append("WHERE rnum >= ? ");
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			// ����
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setNum(rs.getInt("num"));
				boardVO.setUsername(rs.getString("username"));
				boardVO.setPasswd(rs.getString("passwd"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setReadcount(rs.getInt("readcount"));
				boardVO.setRegDate(rs.getTimestamp("reg_date"));
				boardVO.setReRef(rs.getInt("re_ref"));
				boardVO.setReLev(rs.getInt("re_lev"));
				boardVO.setReSeq(rs.getInt("re_seq"));
				// ����Ʈ�� vo��ü �Ѱ� �߰�
				list.add(boardVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return list;		
	} *///getBoards method
	
	public List<BoardVO> getBoards(int startRow, int pageSize, String search) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		int endRow = startRow + pageSize - 1; // 오라클전용 끝행번호
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
	/*
	 * MySQL용 글목록 가져오기 SQL문. 시작행번호 0부터 시작
	 */
	sb.append("SELECT * ");
	sb.append("FROM jspdb.board ");
	// 검색어 search가 있을때는 검색조건절 where를 추가함
	if (!(search == null || search.equals(""))) {
		sb.append("WHERE subject LIKE ? ");
	}
	sb.append("ORDER BY re_ref DESC, re_seq ASC ");
	sb.append("LIMIT ? OFFSET ? ");
	
	try {
		con = DBManager.getConnection();
		pstmt = con.prepareStatement(sb.toString());
		
		if (!(search == null || search.equals(""))) {
			// 검색어가 있을때
			pstmt.setString(1, "%" + search + "%");
			
			//pstmt.setInt(2, endRow);   // 오라클 기준
			//pstmt.setInt(3, startRow); // 오라클 기준
			pstmt.setInt(2, pageSize);   // MySQL 기준
			pstmt.setInt(3, startRow-1); // MySQL 기준
		} else {
			// 검색어가 없을때
			//pstmt.setInt(1, endRow);   // 오라클 기준
			//pstmt.setInt(2, startRow); // 오라클 기준
			pstmt.setInt(1, pageSize);   // MySQL 기준
			pstmt.setInt(2, startRow-1); // MySQL 기준
		}
		
		// 실행
		rs = pstmt.executeQuery();
	while (rs.next()) {
		BoardVO boardVO = new BoardVO();
		boardVO.setNum(rs.getInt("num"));
		boardVO.setUsername(rs.getString("username"));
		boardVO.setPasswd(rs.getString("passwd"));
		boardVO.setSubject(rs.getString("subject"));
		boardVO.setContent(rs.getString("content"));
		boardVO.setReadcount(rs.getInt("readcount"));
		boardVO.setRegDate(rs.getTimestamp("reg_date"));
		boardVO.setReRef(rs.getInt("re_ref"));
		boardVO.setReLev(rs.getInt("re_lev"));
		boardVO.setReSeq(rs.getInt("re_seq"));
		// ����Ʈ�� vo��ü �Ѱ� �߰�
		list.add(boardVO);
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	DBManager.close(con, pstmt, rs);
}
return list;		
}
	
	
	
	
	// �Խ���(jspdb.board) ���̺� ���ڵ� ���� �������� �޼ҵ�
	public int getBoardCount() {
		int count = 0;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DBManager.getConnection();
			String sql = "SELECT COUNT(*) FROM jspdb.board";
			stmt = con.createStatement();
			// ����
			rs = stmt.executeQuery(sql);
			rs.next(); // Ŀ�� �Űܼ� �� �������� true/false ����
			count = rs.getInt(1);	 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, stmt, rs);
		}
		return count;
	}
	
	// Ư�� ���ڵ��� ��ȸ���� 1 ������Ű�� �޼ҵ�
	public void updateReadcount(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			StringBuilder sb = new StringBuilder();
			try {
				con = DBManager.getConnection();
				sb.append("UPDATE jspdb.board ");
				sb.append("SET readcount = readcount+1 ");
				sb.append("WHERE num = ? "); // ����Ŭ�� ����
				pstmt =con.prepareStatement(sb.toString());
				pstmt.setInt(1, num);
				// ����
				pstmt.executeUpdate();	
			} catch (Exception e) {		
				e.printStackTrace();
			} finally {
				DBManager.close(con, pstmt);
			}
	} // updateReadcount method
	
	// �� �Ѱ��� �������� �޼ҵ�
	public BoardVO getBoard(int num) {
		BoardVO boardVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con =DBManager.getConnection();
			String sql="SELECT * FROM jspdb.board WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// ����
			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardVO = new BoardVO();
				boardVO.setNum(rs.getInt("num"));
				boardVO.setUsername(rs.getString("username"));
				boardVO.setPasswd(rs.getString("passwd"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setReadcount(rs.getInt("readcount"));
				boardVO.setRegDate(rs.getTimestamp("reg_date"));
				boardVO.setReRef(rs.getInt("re_ref"));
				boardVO.setReLev(rs.getInt("re_lev"));
				boardVO.setReSeq(rs.getInt("re_seq"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return boardVO;
	}// getBoard method
	
	// �Խñ� �н������(�α��� ���� ����ڰ� ������)
	public boolean isPasswdEqual(int num, String passwd) {
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) ");
		sb.append("FROM jspdb.board ");
		sb.append("WHERE num = ? ");
		sb.append("AND passwd = ? ");
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, num);
			pstmt.setString(2, passwd);
			// ����
			rs = pstmt.executeQuery();
			rs.next(); // Ŀ�� ������
			int count = rs.getInt(1); // ī��Ʈ�� ������
			if (count == 1) {
				result = true; // �Խñ� �н����� ����
			} else { // count == 0
				result = false; // �Խñ� �н����� �ٸ�
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return result;
	} // isPasswdEqual method
	
	public void updateBoard(BoardVO boardVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		sql = "UPDATE jspdb.board ";
		sql += "SET subject=?, content=? ";
		sql += "WHERE num = ? ";	
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardVO.getSubject());
			pstmt.setString(2, boardVO.getContent());
			pstmt.setInt(3, boardVO.getNum());
			// ����
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	} // updateBoard method
	
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBManager.getConnection();
			String sql = "DELETE FROM jspdb.board WHERE num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// ����
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	} // deleteBoard method
	
	
	// �˻���� �˻��� ���� �������ȣ���� ������ŭ ��������(����¡)
	/*public List<BoardVO> getBoards(int startRow, int pageSize, String search) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		int endRow = startRow + pageSize - 1; // ����Ŭ���� �����ȣ
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT aa.* ");
		sb.append("FROM ");
		sb.append("   (SELECT ROWNUM AS rnum, a.* ");
		sb.append("    FROM ");
		sb.append("        (SELECT * ");
		sb.append("        FROM jspdb.board ");
		// �˻��� search�� �������� �˻������� where�� �߰���
		if (!(search == null || search.equals(""))) {
			sb.append("        WHERE subject LIKE ? ");			
		}
		sb.append("        ORDER BY re_ref DESC, re_seq ASC) a ");
		sb.append("    WHERE ROWNUM <= ?) aa ");
		sb.append("WHERE rnum >= ? ");
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			if (!(search == null || search.equals(""))) {
				// �˻�� ������
			pstmt.setString(1, "%" + search + "%");
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			} else {
				// �˻�� ������
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);	
			}
			// ����
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setNum(rs.getInt("num"));
				boardVO.setUsername(rs.getString("username"));
				boardVO.setPasswd(rs.getString("passwd"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setReadcount(rs.getInt("readcount"));
				boardVO.setRegDate(rs.getTimestamp("reg_date"));
				boardVO.setReRef(rs.getInt("re_ref"));
				boardVO.setReLev(rs.getInt("re_lev"));
				boardVO.setReSeq(rs.getInt("re_seq"));
				// ����Ʈ�� vo��ü �Ѱ� �߰�
				list.add(boardVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return list;		
	} *///getBoards method
	
	public int getBoardCount(String search) {
		int count=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con =DBManager.getConnection();
			String sql="SELECT COUNT(*) FROM jspdb.board ";
			// ����(Dynamic) SQL
			if (!(search == null || search.equals(""))) {
				sql += "WHERE subject LIKE ?";
			}
				pstmt = con.prepareStatement(sql);
			if (!(search == null || search.equals(""))) {
				pstmt.setString(1, "%"+search+"%");
			}
			// ����
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return count;
	}// getBoard method
	
	
	
	
/*
num     subject                reRef      reLev       [reSeq]
================================================================
 6        �ֱ�3                   6          0           0
 4        �ֱ�2                   4          0           0
 5         �����2                 4          1           1
 1               �ֱ�1	                 1          0           0
[7]         �����2                1          1           1 
 2         �����1                 1          1          1+1=2     
 3          �� ���1_1              1          2          2+1=3
*/
	// ��۾��� �޼ҵ� (update ���� insert)
	// Ʈ����� ó���� �䱸��(�����ϰ� ó���Ϸ��� ����)
	public void reInsertBoard(BoardVO boardVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = DBManager.getConnection();
			con.setAutoCommit(false); // �⺻�� true
		// ���� �۱׷쿡���� ��ۼ���(re_seq) ���ġ
		//  ���� re_ref �����׷� re_seq ū���� re_seq+1
		sql = "UPDATE jspdb.board ";
		sql += "SET re_seq = re_seq + 1 "; 
		sql += "WHERE re_ref = ? "; 
		sql += "AND re_seq > ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardVO.getReRef());
			pstmt.setInt(2, boardVO.getReSeq());
			// ����
			pstmt.executeUpdate();
			// ���� update�� ���� pstmt �ݱ�
			pstmt.close();
			// ��� insert
			sql = "INSERT INTO jspdb.board (num, username, passwd, subject, content, readcount, ip, reg_date, re_ref, re_lev, re_seq)";
			sql += "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardVO.getNum());
			pstmt.setString(2, boardVO.getUsername());
			pstmt.setString(3, boardVO.getPasswd());
			pstmt.setString(4, boardVO.getSubject());
			pstmt.setString(5, boardVO.getContent());
			pstmt.setInt(6, boardVO.getReadcount()); // ��ȸ��
			pstmt.setString(7, boardVO.getIp());
			pstmt.setTimestamp(8, boardVO.getRegDate());
			pstmt.setInt(9, boardVO.getReRef()); // �״��
			pstmt.setInt(10, boardVO.getReLev() +1); // re_lev+1
			pstmt.setInt(11, boardVO.getReSeq() +1); // re_seq+1
			// ����
			pstmt.executeUpdate(); // insert�� ����
			// commit ����
			con.commit();
			// �⺻������ auto commit���� ���� �ǵ�����
			con.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				con.rollback(); // ������ ���ܹ߻� �� �ѹ�ó��
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			DBManager.close(con, pstmt);
		}
	}// reInsertBoard method
	
	// 관리자 권한으로 다중 아이디 삭제 배열을 활용해야한다.
    public void MdeleteBoards(String[] boardid) {
       // JDBC 참조변수 준비
       Connection con = null;
       PreparedStatement pstmt = null;
       String sql = "";
       
          for(int i=0; i<boardid.length; i++) {
          System.out.println(boardid[i]);
          System.out.println(boardid.length);
       //   }  
       // 이런식으로 확인하는 습관을 가져야한다.
          }
       try {
          con = DBManager.getConnection();
          sql = "DELETE FROM jspdb.board WHERE num = ? ";
          pstmt = con.prepareStatement(sql);
          
          for(int i=0; i<boardid.length; i++) {
             
             pstmt.setString(1, boardid[i]);
             pstmt.executeUpdate();
             // 실행을 for문안에 넣어야 계속 돌릴 수 있다.
          }
          
          
       } catch (Exception e) {
          e.printStackTrace();
       } finally {
          DBManager.close(con,pstmt);
       }
       
    } // deleteboards method
    
	
}	
	
	
	
	
	
	

