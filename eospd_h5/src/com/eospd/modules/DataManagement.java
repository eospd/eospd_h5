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
import com.eospd.bean.Dc;

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
		Dao dao = Mvcs.getIoc().get(Dao.class);
		List<DataOnTime> dataontimes = dao.query(DataOnTime.class, null);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("draw", 1);
		map.put("recordsTotal", dataontimes.size());
		map.put("recordsFiltered", dataontimes.size());

		List<Object> data = new ArrayList();
		for (int i = 0; i < dataontimes.size(); i++) {
			DataOnTime d = dataontimes.get(i);
			Dc dc = dao.fetch(Dc.class, d.getDcId());

			Map<Object, Object> map1 = new HashMap<Object, Object>();

			map1.put("currentTime", d.getCurrentTime());
			map1.put("dataId", d.getDataId());
			map1.put("meterName", dc.getDcId());
			map1.put("dcId", d.getDcId());
			map1.put("dcUrl", dc.getDcUrl());
			map1.put("dcLocation", "" + dc.getLocation());
			map1.put("dcIP", dc.getDcIP());
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
