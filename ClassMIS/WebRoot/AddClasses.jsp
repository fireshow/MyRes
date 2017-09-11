<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>班级信息添加页面</title>
    
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
	
        <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
        <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
            <script type="text/javascript" src="plugins/layui/layui.js"></script>
        <script type="text/javascript"src="plugins/layui/lay/lib/jquery.js"></script>
  </head>
  
  <body>
  <%String  jieguo=(String)session.getAttribute("addc"); 
  System.out.println("返回的结果jieguo:"+jieguo);
  
  %>
  <input type="hidden" value=<%=jieguo %> id="jieguo">
  <%session.setAttribute("addc", null); %>
 <div style="margin: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>添加班级信息</legend>
            </fieldset>

            <form class="layui-form layui-form-pane" action="inclas" method="post">
            
                <div class="layui-form-item">
                    <label class="layui-form-label">班级名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="classes.bjname" lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="classname">
                    </div>
                </div>
                   <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1" align="left"  id="subnow">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary"  >重置</button>
                    </div>
                </div>
            </form>
 <script type="text/javascript">
        layui.use('layer', function() {
                      var $ = layui.jquery,
                        layer = layui.layer;
                      var marks=document.getElementById("jieguo").value;
                    if("成功"==marks)
                    {
                          layer.msg('班级信息添加成功！'); 
                          marks=null;
                    }
                    else if(marks=="失败")
                    {
                          layer.msg('班级信息添加失败！'); 
                          marks=null;
                    }
                     $('#subnow').on('click', function() {
                     var cname=document.getElementById("classname").value;
                        if(cname=="")
                        {
                             layer.msg('班级名不能为空');
                            return false;
                        }
                    });
        });
</script>
  </body>
</html>
