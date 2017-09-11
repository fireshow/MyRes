<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <meta name="renderer" content="webkit">
     <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
     <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
      <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
  </head>
  
  <body>

     <div style="margin: 30px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend><s:property value="student2.sname"/>的信息</legend>
            </fieldset>

            <form class="layui-form layui-form-pane"  >
            
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input type="text"  class="layui-input" readonly  value='<s:property value="student2.sname"/>' >
                    </div>
                </div>
                        <div class="layui-form-item">
                  <div class="layui-inline">
                               <label class="layui-form-label">学号</label>
                                <div class="layui-input-inline">
                                   <input type="text"  readonly value='<s:property value="student2.sids"/>'  class="layui-input">
                          </div>
                    </div>
                </div>  
                  <div class="layui-form-item">
                    <label class="layui-form-label">住址</label>
                    <div class="layui-input-inline">
                        <input type="text" readonly  value='<s:property value="student2.sadress"/>' class="layui-input">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-inline">
                        <input type="tel" readonly  value='<s:property value="student2.sphon"/>'  class="layui-input">
                    </div>
                </div>

      
                    
                <div class="layui-form-item">
                
                    <div class="layui-inline">
                        <label class="layui-form-label">出生日期</label>
                        <div class="layui-input-inline">
                         <input type="text" readonly  value='<s:property value="student2.sbri"/>' class="layui-input">
                        </div>
                    </div>
                    
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">班  &nbsp; &nbsp;级</label>
                    <div class="layui-input-inline">
                        <input type="text" readonly  value='<s:property value="student2.classes.bjname"/>' class="layui-input">
                    </div>
                </div>

                 <div class="layui-form-item">
                    <label class="layui-form-label">性  &nbsp; &nbsp;别</label>
                    <div class="layui-input-inline">
                        <input type="text" readonly  value='<s:property value="student2.ssex"/>' class="layui-input">
                    </div>
                </div>
                
            </form>
        </div>
  </body>
</html>
