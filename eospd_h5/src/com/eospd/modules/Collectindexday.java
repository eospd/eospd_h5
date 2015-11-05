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

import com.eospd.bean.CollectIndexDay;
import com.eospd.bean.DevOnline;

public class Collectindexday {
	
	@At("/")
	@Ok("jsp:jsp.index")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String index() {
        return "Hello Meter";
    }
	
	@At("/col_his")
    @Ok("jsp:jsp.col_his")
    @Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String his() {
        return "";
    }
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@At("/cid/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map list() {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		List<CollectIndexDay> items = dao.query(CollectIndexDay.class, null);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("draw", 1);
		map.put("recordsTotal", items.size());
		map.put("recordsFiltered", items.size());

		List<Object> data = new ArrayList();
		for (int i = 0; i < items.size(); i++) {
			CollectIndexDay d = items.get(i);

			Map<Object, Object> map1 = new HashMap<Object, Object>();

			map1.put("currentTime", d.getIndexTime());
			map1.put("deviceId", d.getDeviceId());
			map1.put("dataEffRate", d.getDataEffRate());
			map1.put("meterOnlineRate", d.getMeterOnlineRate());
			map1.put("realCollectRate", d.getRealCollectRate());
			data.add(map1);
		}
		map.put("data", data);
		return map;
	}
}
