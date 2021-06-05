package com.admin.model.service;
import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.admin.model.dao.AdminDao;
import com.payment.model.vo.Payment;

public class AdminService {
	private static AdminDao dao = AdminDao.getInstance();

	public List<Payment> selectPayments() {
		Connection conn=getConnection();
		List<Payment> list=dao.selectPayments(conn);
		close(conn);
		return list;
		
		
	}
}
