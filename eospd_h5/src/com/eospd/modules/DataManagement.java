package com.eospd.modules;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;

public class DataManagement {
	
	@At("/dm")
	@Ok("jsp:jsp.data_management")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public String index() {
        return "";
    }
	
	
	@At("/dm/list")
	@Ok("json")
	@Filters // 覆盖UserModule类的@Filter设置,因为登陆可不能要求是个已经登陆的Session
    public Map list() {
		 Map<Object, Object> map = new HashMap<Object, Object>();  
	        map.put("draw", 1);  
	        map.put("recordsTotal", 2);  
	        map.put("recordsFiltered", 2);  
	        
	        List<Object> rows = new ArrayList();  
	        Map<Object, Object> map1 = new HashMap<Object, Object>();  
	        map1.put("first_name", "Airi");  
	        map1.put("last_name", "Satou");  
	        map1.put("position", "Accountant");  
	        map1.put("office", "Tokyo");  
	        map1.put("start_date", "28th Nov 08");  
	        map1.put("salary", "$162,700");  
	        rows.add(map1);  
	        
	        map = new HashMap<Object, Object>();  
	        map1.put("first_name", "Airi");  
	        map1.put("last_name", "Satou");  
	        map1.put("position", "Accountant");  
	        map1.put("office", "Tokyo");  
	        map1.put("start_date", "28th Nov 08");  
	        map1.put("salary", "$162,700");  
	        
	        rows.add(map1);  
	        map.put("data", rows);  
	        return map;    
	   
	}
        
}
