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
import com.eospd.bean.DevOnline;

public class CommunicationManagement {
	
	@At("/cm")
	@Ok("jsp:jsp.communication_management")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String index() {
        return "";
    }
	
	@At("/cm_chart")
	@Ok("jsp:jsp.cm_chart")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String chart() {
        return "";
    }
	
	@At("/cm_his")
	@Ok("jsp:jsp.cm_his")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String his() {
        return "";
    }
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@At("/cm/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map list() {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		List<DevOnline> items = dao.query(DevOnline.class, null);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("draw", 1);
		map.put("recordsTotal", items.size());
		map.put("recordsFiltered", items.size());

		List<Object> data = new ArrayList();
		for (int i = 0; i < items.size(); i++) {
			DevOnline d = items.get(i);

			Map<Object, Object> map1 = new HashMap<Object, Object>();

			map1.put("currentTime", d.getCurrentTime());
			map1.put("meterId", d.getDevolId());
			map1.put("meterName", "aa");
			map1.put("dcId", d.getDcId());
			map1.put("dcUrl", "345345");
			map1.put("onlineStatus", 1);
			data.add(map1);
		}
		map.put("data", data);
		return map;
	}
}
