<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加课程页面</title>
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
    <%
            String reslut=(String)session.getAttribute("ReslutOfCourse");
            System.out.print("CourseAction 返回的结果是： "+reslut);
     %>
    <input type="hidden" value=<%= reslut%> id="reslut">
        <div style="margin: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>响应式的表单集合</legend>
            </fieldset>
            <form class="layui-form  layui-form-pane"  action="AddCourse"  method="post">
            
                 <div class="layui-form-item">
                    <label class="layui-form-label">课程名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="kc.kcname" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" id="coursename">
                    </div>
                </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">课程学分</label>
                    <div class="layui-input-inline">
                        <input type="number" min="1" max="6" name="kc.kcxf" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" id="coursexf">
                    </div>
                </div>
                
            <div class="layui-form-item">
                    <label class="layui-form-label">课程性质</label>
                    <div class="layui-input-inline">
                        <select name="kc.kcxz"  lay-filter="" id="kcxz">
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
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
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
                    layer.msg("课程添加成功！");
                }
                else if(reslut=="AddError")
                {
                      layer.msg("出错喽，添加重复了！");
                }
            });
            
        </script>
  </body>
</html>
