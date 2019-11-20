package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.exam.vo.AttachVO;

public class AttachDao {
	private static AttachDao instance = new AttachDao();
	
	public static AttachDao getInstance() {
		return instance;
	}
	private AttachDao() {}
	
	// ÷���������� �Է��ϱ� �޼ҵ�
	public void insertAttach(AttachVO attachVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBManager.getConnection();
			String sql = "INSERT INTO jspdb.attach (uuid,uploadpath, filename, filetype, BNO) ";
			sql += "VALUES (?, ?, ?, ?, ?) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, attachVO.getUuid());
			pstmt.setString(2, attachVO.getUploadpath());
			pstmt.setString(3, attachVO.getFilename());
			pstmt.setString(4, attachVO.getFiletype());
			pstmt.setInt(5, attachVO.getBno());
			// ����
			pstmt.executeUpdate();
		} catch (Exception e) {                    
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	} // insertAttch method
	
	// �۹�ȣ�� �ش��ϴ� ÷���������� ��������
	public List<AttachVO> getAttaches(int bno) {
		List<AttachVO> list = new ArrayList<AttachVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBManager.getConnection();
			String sql = "SELECT * FROM jspdb.attach WHERE bno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			// ����
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AttachVO attachVO = new AttachVO();
				attachVO.setBno(rs.getInt("bno"));
				attachVO.setUuid(rs.getString("uuid"));
				attachVO.setFilename(rs.getString("filename"));
				attachVO.setFiletype(rs.getString("filetype"));
				list.add(attachVO);
			} // while
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return list;
	} // getAttaches method
	
	// �Խ��� �۹�ȣ�� �ش��ϴ� ÷���������� �����ϴ� �޼ҵ�
	public void deleteAttach(int bno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBManager.getConnection();
			String sql = "DELETE FROM jspdb.attach WHERE bno = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			// ����
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	} // deleteAttach method
	
	
	
	
	
	
	
	
	
}
