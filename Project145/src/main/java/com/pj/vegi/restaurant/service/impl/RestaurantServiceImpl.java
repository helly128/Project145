package com.pj.vegi.restaurant.service.impl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pj.vegi.restaurant.mapper.RestaurantMapper;
import com.pj.vegi.restaurant.service.RestaurantService;
 
import com.pj.vegi.vo.RestaurantVo;

@Service("restaurantService")
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private RestaurantMapper dao;	

	
	@Override
	public boolean restaurantCheck(RestaurantVo vo) throws SQLException {
			RestaurantVo restVo = dao.restaurantSelect(vo);
			if(restVo != null) { 
				return true;			
			} else {
				return false;
			}
			
	}

	@Override
	public int restaurantInsert(RestaurantVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return dao.restaurantInsert(vo);
	}

}
