package edu.gznc.cxcyzx.utils;

import java.sql.Connection;

public class TransactionManager {
	private static ThreadLocal<Connection> t1 = new ThreadLocal<Connection>();
	
	public static Connection getConnection(){
		Connection con = t1.get();
		try {
			if(con == null){
				con = C3P0Utils.getConnection();
				t1.set(con);
			}
			return t1.get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void startTransaction(){
		try {
			Connection con = getConnection();
			con.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(){
		try {
			Connection con = getConnection();
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(){
		try {
			Connection con = getConnection();
			con.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void  release(){
		try {
			  Connection con = getConnection();
			  con.close();
			  t1.remove();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
