<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- <%@ taglib prefix="s" uri="/struts-tags"%> --%>
 <%@taglib prefix="s"  uri="/struts-tags"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta charset="utf-8">
        <title>表单</title>
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
                <legend>注册学生信息</legend>
            </fieldset>

            <form class="layui-form layui-form-pane" action="instu" method="post">
            
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="student.sname" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>
                        <div class="layui-form-item">
                  <div class="layui-inline">
                               <label class="layui-form-label">学号</label>
                                <div class="layui-input-inline">
                                   <input type="text" name="student.sids" id="student.sids"  lay-verify="number" autocomplete="off" class="layui-input">
                          </div>
                    </div>
                </div>  
                  <div class="layui-form-item">
                    <label class="layui-form-label">住址</label>
                    <div class="layui-input-inline">
                        <input type="text" name="student.sadress" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="student.sphon" lay-verify="phone" autocomplete="off" class="layui-input">
                    </div>
                </div>

      
                    
                <div class="layui-form-item">
                
                    <div class="layui-inline">
                        <label class="layui-form-label">出生日期</label>
                        <div class="layui-input-block">
                            <input type="text" name="student.sbri" id="Student.sbri" lay-verify="date" placeholder="请选择出生日期" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
                        </div>
                    </div>
                    
                </div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="student.spass"   id="password1"  lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
                </div>
                 <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password2"   id="password2"  lay-verify="pass" placeholder="再次输入密码" autocomplete="off" class="layui-input" >
                    </div>
                    <div class="layui-form-mid layui-word-aux">再次输入密码</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">选择班级</label>
                    <div class="layui-input-inline">
               
                        <select name="cid"  lay-verify=""   lay-search=""   id="cla">
                             <s:iterator value="listclasses">
                            <option value='<s:property  value="bjid"/>'>  <s:property value="bjname"/>  </option>
                            </s:iterator>
                        </select>
                     
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="student.ssex" value="男" title="男" checked="">
                        <input type="radio" name="student.ssex" value="女" title="女">
                    </div>
                </div>
                
                
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1" id="subnow" >立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary"  >重置</button>
                    </div>
                </div>
            </form>
        </div>
        <script type="text/javascript" src="plugins/layui/layui.js"></script>
        <script>
            layui.use(['form', 'layedit', 'laydate'], function() {
                   var form = layui.form();
                   var layer = layui.layer,
                          layedit = layui.layedit,
                          laydate = layui.laydate;

                //创建一个编辑器
                var editIndex = layedit.build('LAY_demo_editor');
                //自定义验证规则
                form.verify({
                    title: function(value)
                     {
	                        if(value.length < 5) 
	                        {
	                            return '标题至少得5个字符';
	                        }
                    },
                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                    content: function(value) {
                        layedit.sync(editIndex);
                    }
                });

                //监听提交
//                 form.on('submit(demo1)', function(data) {
//                     layer.alert(JSON.stringify(data.field), {
//                         title: '最终的提交信息'
//                     });
//                     return false;
//                 });

               
                        
        });
        </script>
        <script type="text/javascript">
      
        layui.use('layer', function() {
                   
                      var $ = layui.jquery,
                       layer = layui.layer;
                        var form = layui.form();
                     $('#password2').on('blur', function() 
                     {
                         var   p1=  document.getElementById("password1").value;
                         var   p2=  document.getElementById("password2").value;
                            if(p1==p2)
                            {
                            }
                            else
                            {
                                layer.alert('密码不相同!'); 
                                return false;
                            }
                     });
                     
                   
//                             $.ajax({ 
//                          type:"POST",
//                          url: "AjaxShowCls",
//                          async:false,
//                           contentType: "application/json; charset=utf-8",
//                           dataType:"json",
//                          scriptCharset:'UTF-8',
//                          success:function(data)
//                              { 
//                                  var names = data["classname"];
//                                  var ids = data["classid"];
//                                   $("#cla").empty();
//                                    $("#cla").append("<option value=''>选择班级</option>");
//                                     for(var i = 0; i < names.length; i++){
//                                                   if(names[i] != null)
//                                                   {
//                                                       $("#cla").append("<option value="+ids[i]+">"+data[i]+"</option>");
//                                                   }
//                 }
//                                   form.render();
//                              } ,
//                         error : function(XMLHttpRequest, textStatus, errorThrown)
//                         {
//                              alert("error"+errorThrown);
//                          }
//                     });
                   
        });
        </script>
    </body>
</html>
