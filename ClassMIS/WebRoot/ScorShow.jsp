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
      <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
        <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">    
    <title>显示分数</title>
  </head>
  <body>
  <%String re=(String)session.getAttribute("ReslutOfScor"); %>
    <input type="hidden" value=<%=re%> id="re">
     <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"> 
       <legend>统计学生个人成绩</legend>
              <div class="layui-form layui-form-pane">
                   <div class="layui-form-item">
                    <label class="layui-form-label">学号-姓名</label>
                      <div class="layui-input-inline">
                           <select name="student.sid"  lay-filter="" lay-search=""  id="sid">
                           <s:iterator  value="studentlist">
                           <option value='<s:property value="sid"/>'><s:property value="sids"/>--<s:property value="sname"/></option>
                          </s:iterator>
                          </select>
                   </div>
                             <button class="layui-btn" lay-submit="" lay-filter="demo1" onclick="tj(this);" >统计</button>
                </div>
          </div>
     </fieldset>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">   
              <legend>学生成绩列表</legend>
                     <div class="layui-field-box">
                        <div class="beg-table-box">
                            <div class="beg-table-body">
                            <table class="layui-table">
                              <thead>
                               <tr>
                               <th>序&nbsp;&nbsp;号</th>
                               <th>学僧姓名</th>
                               <th>学僧学号</th>
                               <th>所选课程</th>
                               <th>课程分数</th>
                              <th>操 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作</th>
                              </tr>
                             </thead>
                            <tbody>
                            <%int i=1; %>
                            <s:iterator  value="scorlist">
                             <tr>
                                   <td><%=i%></td>
                                     <td><s:property value="student.sname"></s:property></td>
                                     <td><s:property value="student.sids"></s:property></td>
                                      <td><s:property value="kc.kcname"></s:property></td>
                                      <td><s:if  test="scor<60"><font color="red"><s:property value="scor"></s:property></font></s:if>
                                      <s:else><font color="green"><s:property value="scor"></s:property></font></s:else></td>
                                       <td><a class=" layui-btn layui-btn-small" href="javascript:;"onclick="change(this,<s:property value=" id.sid"/>,<s:property value=" id.kcid"/>);" >修改</a> 
                                    <a  class="layui-btn layui-btn-danger  layui-btn-small" href="javascript:;"onclick="del(this,<s:property value=" id.sid"/>,<s:property value=" id.kcid"/>);">删除</a></td>
                             </tr>
                                <%i++; %>
                            </s:iterator>
                            </tbody>
                        </table>
                    </div>
                    </div>
                    <div class="beg-table-paged"></div>
                </div>
            </fieldset>
            <script type="text/javascript" src="plugins/layui/layui.js"></script>
            <script>
            layui.use('layer', function()
      {
              var $ = layui.jquery,
              form=layui.form,
              layer = layui.layer;
             window.del=function(obj,sid,kcid)
             {
                    
                 layer.confirm("真的要删除么?" ,function(index)
                 {
                     $.ajax({ 
                                         type:"POST",
                                         url: "delScor?sid="+sid+"&kcid="+kcid+"",
                                         async:false,
                                          contentType: "application/json; charset=utf-8",
                                         scriptCharset:'UTF-8',
                                        error : function(XMLHttpRequest, textStatus, errorThrown)
                                        {
                                             alert("error"+errorThrown);
                                         },
                                         success: function()
                                         {
                                            $(obj).parents("tr").remove();
                                            layer.closeAll();
                                            layer.msg('删除成功' );
                                           
                                         }
                                   });
                 });
             };
             
                   window.change=function(obj,sid,kcid)
             {
                    
						              layer.prompt({
										  formType:0,
										  value: '60',
										  title: '请输入新的分数',
										
										}, function(value, index, elem)
										{
									         	 $.ajax({ 
		                                         type:"POST",
		                                          url: "ChangeScor?sids="+sid+"&kcids="+kcid+"&scorss="+value+"",
		                                          async:false,
		                                          contentType: "application/json; charset=utf-8",
		                                           scriptCharset:'UTF-8',
		                                         beforeSend:function()
		                                         {
					                                       if(isNaN(value)) 
			                                                {
			                                                     layer.msg('请输入数字!',{icon:2});
			                                                      return false;
			                                                }
			                                                else if(parseFloat(value)<0||parseFloat(value)>100)
			                                                {
			                                                  layer.msg('分数应该在0~100之间！',{icon:2});
			                                                  return false;
			                                                }
		                                         },
		                                        error : function(XMLHttpRequest, textStatus, errorThrown)
		                                        {
		                                             alert("error"+errorThrown);
		                                         },
		                                         success: function()
		                                         {
		                                             window.location.reload();
		                                             layer.colseAll();
		                                             layer.msg('分数更新成功');
		                                         }
		                                   });
				});
             };
               window.tj=function(obj)
               {
                    var id= document.getElementById("sid").value;
                     layer.open({
                            title: '成绩统计',
                            maxmin: true,
                            skin: 'layui-layer-molv',
                            type:2,
                            content: 'TjScorBySid?id='+id,
                            area: ['550px', '400px']
                        });
               };
             var re=document.getElementById("re").value;
             if(re=="NotInteger")
             {
                     layer.msg("更新失败，用户输入数据格式不正确");
                     document.getElementById("re").value=null;
             }
           else  if(re=="ScorError")
             {
                     layer.msg("更新失败，分数必须在0~100之间");
                     document.getElementById("re").value=null;
             }
             else
             {
                     layer.msg("数据更新成功");
                     document.getElementById("re").value=null;
             }
     }) ;
            
            </script>
            <script type="text/javascript">
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
      });
            </script>
  </body>
</html>
