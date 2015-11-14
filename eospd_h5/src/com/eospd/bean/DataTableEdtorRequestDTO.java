package com.eospd.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

/*
 * support database paraemters
 * action:create
data[0][dcUrl]:1
data[0][dcName]:1
data[0][location]:1
data[0][desc]:1
data[0][channelCount]:1
data[0][dcIP]:1
data[0][installTime]:2015-11-25

 */
public class DataTableEdtorRequestDTO {
	public DataTableEdtorRequestDTO(HttpServletRequest req){
		this.action = req.getParameter("action");
		this.data = new HashMap<String, Map<String, String>>();
		
		Map<String, String[]> parameters = req.getParameterMap();
		for (Entry<String, String[]> entry : parameters.entrySet()) {
		    //System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue()[0]);
		    if (entry.getKey().startsWith("data[")) {
			    String[] fsplit = entry.getKey().split("\\[");
			    String rowNum = fsplit[1].split("\\]")[0];
			    String Kvk = fsplit[2].split("\\]")[0];
			    if (this.data.containsKey(rowNum)) {
			    	this.data.get(rowNum).put(Kvk, entry.getValue()[0]);
			    } else {
			    	HashMap<String, String> gg = new HashMap<String, String>();
			    	gg.put(Kvk, entry.getValue()[0]);
				    this.data.put(rowNum, gg);
			    }
			    //System.out.println("rowNum：" +rowNum);
			   // System.out.println("Kvk：" + Kvk);
		    }
		}
	}
	
	private String action;
    private HashMap<String, Map<String, String>> data;
    
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public HashMap<String, Map<String, String>> getData() {
		return data;
	}
	public void setData(HashMap<String, Map<String, String>> data) {
		this.data = data;
	}
}
