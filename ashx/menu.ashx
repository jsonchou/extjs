﻿<%@ WebHandler Language="C#" Class="menu" %>

using System;
using System.Web;

public class menu : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string jsonData = "{\"text\":\"系统管理\",\"expanded\":\"true\",\"children\":[{\"text\":\"产品管理\",\"id\":\"c1\",\"expanded\":\"true\",\"children\":[{\"text\":\"机票产品\",\"id\":\"c11\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"},{\"text\":\"签证产品\",\"id\":\"c12\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"},{\"text\":\"签证模板\",\"id\":\"c13\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"},{\"text\":\"跟团产品\",\"id\":\"c14\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"},{\"text\":\"酒店产品\",\"id\":\"c15\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"},{\"text\":\"附加产品\",\"id\":\"c16\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"}]},{\"text\":\"订单管理\",\"id\":\"c2\",\"expanded\":\"true\",\"children\":[{\"text\":\"订单1\",\"id\":\"c21\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"},{\"text\":\"订单2\",\"id\":\"c22\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"}]},{\"text\":\"网站管理\",\"expanded\":\"true\",\"id\":\"c3\",\"children\":[{\"text\":\"网站1\",\"id\":\"c31\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"},{\"text\":\"网站2\",\"id\":\"c32\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"}]},{\"text\":\"系统管理\",\"expanded\":\"true\",\"id\":\"c4\",\"children\":[{\"text\":\"系统1\",\"id\":\"c41\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"},{\"text\":\"系统2\",\"id\":\"c42\",\"dataUrl\":\"/pages/test.html\",\"leaf\":\"true\"}]}]}";
        
        context.Response.Write(jsonData);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}