package com.car.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.car.model.dao.CarDao;
import com.car.model.vo.Car;
import com.car.model.vo.Cart;
import com.car.model.vo.Reviews;


public class CarService {
	private static CarDao dao = CarDao.getInstance();
	
	public List<Car> selectCarList() {
		Connection conn=getConnection();
		List<Car> list=dao.selectCarList(conn);
		close(conn);
		return list;
		
		
	}
	
	public List<Car> searchCar(String carType) {
		Connection conn=getConnection();
		List<Car> list=dao.searchCar(conn,carType);
		close(conn);
		return list;
		
		
	}
	
	public Car selectCar(int carNB) {
		Connection conn=getConnection();
		Car c=dao.selectCar(conn,carNB);
		close(conn);
		return c;
	}
	public int insertReviews(Reviews r) {
		Connection conn=getConnection();
		int result=dao.insertReviews(conn,r);
		if(result>0) commit(conn);
		else  rollback(conn);
		return result;
	}
	public List<Reviews>selectReviewList(int carNB){
		Connection conn=getConnection();
		List<Reviews>rlist=dao.selectReviewList(conn,carNB);
		close(conn);
		return rlist;
	}
	
	public int updateCarPsb(int carNB) {
		Connection conn=getConnection();
		int result=dao.updateCarPsb(conn,carNB);
		if(result>0) commit(conn);
		else  rollback(conn);
		return result;
	}
	
	public int insertCart(Cart c) {
		Connection conn=getConnection();
		int result=dao.insertCart(conn,c);
		if(result>0) commit(conn);
		else  rollback(conn);
		return result;
	}
	
	
	
}
