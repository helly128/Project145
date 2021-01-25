package com.pj.vegi.restaurant.service.impl;

import java.sql.SQLException;
import java.util.List;

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
	public int restaurantInsert(RestaurantVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return dao.restaurantInsert(vo);
	}

	@Override
	public List<RestaurantVo> bizCheckList(String restName) throws SQLException {
		
		return dao.bizCheckList(restName);
	}

	@Override
	public int bizInfoUpdate(RestaurantVo vo) {
		
		return dao.bizInfoUpdate(vo);
		
	}
	

	@Override
	public int restInsertNull(RestaurantVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return dao.restInsertNull(vo);
	}

	

	@Override
	public List<RestaurantVo> getRestaurantList(RestaurantVo vo) {
		// TODO Auto-generated method stub
		return dao.getRestaurantList(vo);
	}




	
}
