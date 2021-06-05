package com.admin.model.service;
import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;

import static com.common.JDBCTemplate.rollback;


import java.sql.Connection;
import java.util.List;

import com.admin.model.dao.AdminDao;
import com.camp.model.vo.Camp;
import com.car.model.vo.Car;
import com.member.model.vo.Member;
import com.payment.model.vo.Payment;

public class AdminService {
	private static AdminDao dao = AdminDao.getInstance();

	public List<Payment> selectPayments() {
		Connection conn=getConnection();
		List<Payment> list=dao.selectPayments(conn);
		close(conn);
		return list;
		
		
	}
	public int selectMemberCount() {
		Connection conn=getConnection();
		int count=dao.selectMemberCount(conn);
		close(conn);
		return count;
	}
	public int selectCarCount() {
		Connection conn=getConnection();
		int count=dao.selectCarCount(conn);
		close(conn);
		return count;
	}
	public int selectCampingCount() {
		Connection conn=getConnection();
		int count=dao.selectCampingCount(conn);
		close(conn);
		return count;
	}
	public List<Member>selectMemberList(){
		Connection conn=getConnection();
		List<Member>mlist=dao.selectMemberList(conn);
		close(conn);
		return mlist;
	}
	public List<Car>selectCarList(){
		Connection conn=getConnection();
		List<Car>clist=dao.selectCarList(conn);
		close(conn);
		return clist;
	}
	public List<Camp>selectCampList(){
		Connection conn=getConnection();
		List<Camp>camlist=dao.selectCampList(conn);
		close(conn);
		return camlist;
	}

	
	public int rentalEnd(String pm_no) {
		Connection conn=getConnection();
		int a=dao.rentalEnd(conn,pm_no);
		if(a>0)commit(conn);
		else rollback(conn);
		return a;
	}
	
	public int addCar(int pd_nb) {
		Connection conn=getConnection();
		int a=dao.addCar(conn,pd_nb);
		if(a>0)commit(conn);
		else rollback(conn);
		return a;
	}
	
	public String returnCheck(String pm_no) {
		Connection conn=getConnection();
		String a=dao.returnCheck(conn,pm_no);
		close(conn);
		return a;
	}
	
	

	public int DeleteMembersel(String id) {
		Connection conn=getConnection();
		int result=dao.DeleteMembersel(conn,id);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int insertCarsel(Car c) {
		Connection conn=getConnection();
		int result=dao.insertCarsel(conn,c);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int DeleteCarsel(int No) {
		Connection conn=getConnection();
		int result=dao.DeleteCarsel(conn,No);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
