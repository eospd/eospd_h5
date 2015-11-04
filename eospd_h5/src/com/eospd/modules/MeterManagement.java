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

import com.eospd.bean.Dc;

public class MeterManagement {
	
	@At("/mm")
	@Ok("jsp:jsp.meter_management")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String index() {
        return "";
    }
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@At("/mm/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map list() {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		List<Dc> items = dao.query(Dc.class, null);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("draw", 1);
		map.put("recordsTotal", items.size());
		map.put("recordsFiltered", items.size());

		List<Object> data = new ArrayList();
		for (int i = 0; i < items.size(); i++) {
			Dc d = items.get(i);

			Map<Object, Object> map1 = new HashMap<Object, Object>();

			map1.put("currentTime", d.getInsertTime());
			map1.put("meterId", d.getDcId());
			map1.put("meterName", d.getDcUrl());
			map1.put("dcId", d.getDcId());
			map1.put("dcName", d.getDcId());
			map1.put("venderName", d.getDcId());
			map1.put("circuitName", d.getDcId());
			data.add(map1);
		}
		map.put("data", data);
		return map;

	}
}
