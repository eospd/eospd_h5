package com.eospd.modules;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.nutz.dao.Dao;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;

import com.eospd.bean.DataOnTime;

public class DataManagement {

	@At("/dm")
	@Ok("jsp:jsp.data_management")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public String index() {
		return "";
	}

	@At("/test")
	@Ok("jsp:jsp.test")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public String test() {
		return "";
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@At("/dm/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map list() {
		/*
		 * Map<Object, Object> map = new HashMap<Object, Object>();
		 * 
		 * map.put("draw", 1); map.put("recordsTotal", 2);
		 * map.put("recordsFiltered", 2);
		 * 
		 * List<Object> rows = new ArrayList(); Map<Object, Object> map1 = new
		 * HashMap<Object, Object>(); map1.put("currentTime", "28th Nov 08");
		 * map1.put("dataId", 1); map1.put("meterName", "Accountant");
		 * map1.put("dcId", "Tokyo"); map1.put("dcUrl", "234234");
		 * map1.put("dcLocation", "234234"); map1.put("dcIP", "$162,700");
		 * map1.put("venderName", "$162,700"); map1.put("p1Pv", "$162,700");
		 * map1.put("p1Err", "$162,700"); rows.add(map1);
		 * 
		 * map1 = new HashMap<Object, Object>(); map1.put("currentTime",
		 * "29th Nov 08"); map1.put("dataId", 2); map1.put("meterName", "aa");
		 * map1.put("dcId", "dd"); map1.put("dcUrl", "345345");
		 * map1.put("dcLocation", "234234"); map1.put("dcIP", "111");
		 * map1.put("venderName", "3333"); map1.put("p1Pv", "44");
		 * map1.put("p1Err", "55");
		 * 
		 * rows.add(map1); map.put("data", rows);
		 */

		Dao dao = Mvcs.getIoc().get(Dao.class);
		List<DataOnTime> dataontimes = dao.query(DataOnTime.class, null);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("draw", 1);
		map.put("recordsTotal", dataontimes.size());
		map.put("recordsFiltered", dataontimes.size());

		List<Object> data = new ArrayList();
		for (int i = 0; i < dataontimes.size(); i++) {
			DataOnTime d = dataontimes.get(i);

			Map<Object, Object> map1 = new HashMap<Object, Object>();

			map1.put("currentTime", d.getCurrentTime());
			map1.put("dataId", d.getDataId());
			map1.put("meterName", "aa");
			map1.put("dcId", d.getDcId());
			map1.put("dcUrl", "345345");
			map1.put("dcLocation", "234234");
			map1.put("dcIP", "111");
			map1.put("venderName", "3333");
			map1.put("p1Pv", d.getP1Pv());
			map1.put("p1Err", d.getP1Err());
			data.add(map1);

			// System.out.println(list.get(i));
		}
		map.put("data", data);
		return map;

	}

}
