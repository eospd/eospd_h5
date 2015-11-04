package com.eospd.modules;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;

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
}
