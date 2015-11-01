package com.eospd.modules;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;

@At("/meter")
@Ok("jsp:jsp.hello")
public class Meter {
	
	@At
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String doHello() {
        return "Hello Meter";
    }
	
	@At
	@Ok("raw")
	public String static_mm() {
		return "";
	}
}
