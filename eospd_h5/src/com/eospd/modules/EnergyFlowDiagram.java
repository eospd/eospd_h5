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

import com.eospd.bean.CircuitInfo;
import com.eospd.bean.Dc;
import com.eospd.bean.DevOnline;

public class EnergyFlowDiagram {
	
	@At("/efd")
	@Ok("jsp:jsp.energy_flow_diagram")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String index() {
        return "";
    }
	
	@At("/efd_chart")
	@Ok("jsp:jsp.efd_chart")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public void efd_chart() {
    }
	
	@At("/efd_his")
	@Ok("jsp:jsp.efd_his")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public void efd_his() {
    }
	

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@At("/efd/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
	public Map list() {
		Dao dao = Mvcs.getIoc().get(Dao.class);
		List<CircuitInfo> items = dao.query(CircuitInfo.class, null);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("draw", 1);
		map.put("recordsTotal", items.size());
		map.put("recordsFiltered", items.size());

		List<Object> data = new ArrayList();
		for (int i = 0; i < items.size(); i++) {
			CircuitInfo d = items.get(i);

			Map<Object, Object> map1 = new HashMap<Object, Object>();

			map1.put("circuitUrl", d.getCircuitUrl());
			map1.put("circuitName", d.getCircuitName());
			map1.put("location", "location:" + d.getLocation());
			map1.put("switchRatedC", d.getSwitchRatedC());
			map1.put("levelV", d.getLevelV());
			map1.put("designPower", d.getDesignPower());
			map1.put("powerPhase", d.getPowerPhase());
			map1.put("parentId", d.getParentId());
			data.add(map1);
		}
		map.put("data", data);
		return map;

	}
}
