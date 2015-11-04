package com.eospd.modules;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;

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
}
