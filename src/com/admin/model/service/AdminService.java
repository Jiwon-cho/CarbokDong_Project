package com.admin.model.service;
import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

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
}
