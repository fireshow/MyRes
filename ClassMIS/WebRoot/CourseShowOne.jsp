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
    <title>课程信息修改页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
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
     <div style="margin: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>修改课程信息</legend>
            </fieldset>
            <form class="layui-form  layui-form-pane"  action="UpdateCourse"  method="post">
                <input type="hidden" value='<s:property value="kc.kcid"/>' name="kc.kcid">
                 <div class="layui-form-item">
                    <label class="layui-form-label">课程名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="kc.kcname" lay-verify="required"  autocomplete="off" class="layui-input" value='<s:property value="kc.kcname"/>' id="coursename">
                    </div>
                </div>
                
            <div class="layui-form-item">
                    <label class="layui-form-label">课程性质</label>
                    <div class="layui-input-inline">
                        <select name="kc.kcxz"  lay-filter="" id="kcxz">
                        <option value='<s:property  value="kc.kcxz"/>'><s:property  value="kc.kcxz"/></option>
                        <option value="必修课">必修课</option>
                        <option value="学位课">学位课</option>
                        <option value="选修课">选修课</option>
                        <option value="限选课">限选课</option>
                        <option value="网络课">网络课</option>
                        <option value="可逃课">可逃课</option>
                        </select>
                   </div>
                </div>

                
                        <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">修改</button>
                    </div>
            </form>
         </div>
       
   <script type="text/javascript" src="plugins/layui/layui.js"></script>
        <script>
            layui.use(['form', 'layedit', 'laydate'], function() {
                var form = layui.form(),
                    layer = layui.layer,
                    layedit = layui.layedit,
                    laydate = layui.laydate;

                //创建一个编辑器
                var editIndex = layedit.build('LAY_demo_editor');
                //自定义验证规则
                form.verify({
                    title: function(value) {
                        if(value.length < 5) {
                            return '标题至少得5个字符啊';
                        }
                    },
                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                    content: function(value) {
                        layedit.sync(editIndex);
                    }
                });
           });
        </script>
  </body>
</html>
