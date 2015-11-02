package com.eospd.modules;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;

public class MeterManagement {
	
	@At("/mm")
	@Ok("jsp:jsp.meter_management")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String index() {
        return "";
    }
}
