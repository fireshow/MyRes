<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- <%@taglib prefix="s" uri="/struts-tags" %> --%>
<%@taglib prefix="s"  uri="/struts-tags"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生添加分数</title>
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
  <%String reslut=(String)session.getAttribute("ReslutOfScor"); 
             System.out.print("addscor页面收到的参数"+reslut);
  %>
  <input type="hidden" value=<%=reslut %> id="reslut">
    <div style="margin: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>学生分数的录入</legend>
            </fieldset>
            <form class="layui-form  layui-form-pane"  action="AddScor"  method="post">
            
                 <div class="layui-form-item">
                    <label class="layui-form-label">学号-姓名</label>
                     <div class="layui-input-inline">
                        <select name="student.sid"  lay-filter="" >
                        <s:iterator  value="studentlist">
                        <option value='<s:property value="sid"/>'><s:property value="sids"/>--<s:property value="sname"/></option>
                        </s:iterator>
                        </select>
                   </div>
                </div>
                
            <div class="layui-form-item">
                    <label class="layui-form-label">课程名称</label>
                    <div class="layui-input-inline">
                        <select name="kc.kcid"  lay-filter="" >
                        <s:iterator value="kclist">
                        <option value='<s:property value="kcid"/>'><s:property value="kcname"/></option>
                        </s:iterator>
                        </select>
                   </div>
            </div>
                
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">输入分数</label>
                        <div class="layui-input-inline">
                            <input type="number"  min="0"  max="100" name="scor.scor" lay-verify="number" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                        <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">提交成绩</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
                var  reslut=document.getElementById("reslut").value;
                if(reslut=="AddSuccess")
                {
                    layer.msg("成绩录入成功!");
                }
                if(reslut=="AddError")
                {
                      layer.msg("录入失败，该项成绩已经存在了！",{iocn:2});
                }
            });
            
        </script>
  </body>
</html>
