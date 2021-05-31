package com.car.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.car.model.dao.CarDao;
import com.car.model.vo.Car;


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
	
}
