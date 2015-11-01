package com.eospd;

import org.nutz.mvc.annotation.ChainBy;
import org.nutz.mvc.annotation.Encoding;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Localization;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

@IocBy(type=ComboIocProvider.class, args={"*js", "ioc/",
										   "*anno", "com.eospd",
										   "*tx"})
@Modules(scanPackage=true)
@ChainBy(args="mvc/eospd-mvc-chain.js")
@Ok("json:full")
@Fail("jsp:jsp.500")
@Localization(value="msg/", defaultLocalizationKey="zh-CN")
@Encoding(input="UTF-8",output="UTF-8")
public class MainModule {
}
