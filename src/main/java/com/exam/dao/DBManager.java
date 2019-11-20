package com.exam.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {
	public static Connection getConnection() throws Exception {
		Connection con = null;
			/*
			//DB��������
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "scott";
			String password = "tiger";
			//1�ܰ�: DB ����̹� �ε�
			Class.forName("oracle.jdbc.OracleDriver");
			//2�ܰ�: DB ����
			con = DriverManager.getConnection(url, user, password);
			*/
			// DBCP ������ �ڵ�
			// DataSource�� Ŀ�ؼ��� �̸� �������� �����ϰ� ����
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:/comp/env/jdbc/mysqldb");
			con = ds.getConnection(); // Ŀ�ؼ� �Ѱ� ��������			
			return con;
	}

	
	
	
	
	// SELECT���� ������ �� ���ҽ� ������ ���� method
	public static void close(Connection con, Statement stmt, ResultSet rs) { // 3�� ���� ���
		if (rs != null) {
			try {
				rs.close();
			} catch(Exception e) {
			e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch(Exception e) {
			e.printStackTrace(); 
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch(Exception e) {
			e.printStackTrace();
			}
		}
	} // close method
	// INSERT, UPDATE, DELETE���� ������ �� ���ҽ� ������ ���� �޼ҵ�
	public static void close(Connection con, Statement stmt) { // 2�� ���� ���
		if (stmt != null) {
			try {
				stmt.close();
			} catch(Exception e) {
			e.printStackTrace(); 
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch(Exception e) {
			e.printStackTrace();
			}
		}
	} // close method	
} // class
