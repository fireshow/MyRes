<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示课程信息</title>
    
	    <meta http-equiv="pragma" content="no-cache">
         <meta http-equiv="cache-control" content="no-cache">
        <base href="<%=basePath%>">
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
        <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
  
  </head>
  
  <body>
  <%String mark=(String)session.getAttribute("ReslutOfCourse");
  System.out.println("Courseshow 返回结果"+mark);
   %>
  <input type="hidden" value=<%=mark%> id="mark">
   <fieldset class="layui-elem-field">
              <legend>课程信息列表</legend>
                 <div class="layui-field-box">
                        <div class="beg-table-box">
                              <div class="beg-table-body">
                              <table class="layui-table">
                              <thead>
                             <tr>
                              <th>课程编号</th>
                              <th>课程名称</th>
                               <th>课程性质</th>
                              <th>操 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作</th>
                              </tr>
                             </thead>
                            
                            <tbody>
                            <s:iterator  value="listKcs">
                             <tr>
                                     <td><s:property value="kcid"></s:property></td>
                                     <td><s:property value="kcname"></s:property></td>
                                      <td><s:property value="kcxz"></s:property></td>
                                      <td><a   id="del" href="DelCourse?mark=<s:property value="kcid"/>" >
                                      <font style="color: blue ">删&nbsp;&nbsp;除</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      <a   id="del" href="ChangeCourse?mark=<s:property value="kcid"/>" >
                                      <font style="color: dark ">修&nbsp;&nbsp;改</font></a>
                                      </td>
                             </tr>
                            </s:iterator>
                            </tbody>
                        </table>
                    </div>
                    <div class="beg-table-paged"></div>
                </div>
            </div>
            </fieldset>
            <script type="text/javascript" src="plugins/layui/layui.js"></script>
          <script src="js/index.js"></script>
            <script>
            layui.use('layer', function() {
                    var $ = layui.jquery,
                        layer = layui.layer;
                        var  returnmark=document.getElementById("mark").value;
                        if(returnmark=="UpSuccess")
                        {
                            layer.msg('更新成功');
                        }
                        else if(returnmark=="DelSuccess")
                        {
                            layer.msg('删除成功');
                        }
                         else if(returnmark=="UpError")
                        {
                            layer.msg('出了点小错，小的会及时修复的');
                        }
                         else if(returnmark=="DelError")
                        {
                            layer.msg('删除错误');
                        }
             });
            </script>
  </body>
</html>
