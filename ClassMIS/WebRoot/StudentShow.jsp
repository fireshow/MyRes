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
    
    <title>显示所有学生信息</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
        <link rel="stylesheet" href="css/begtable.css" />
         <script type="text/javascript" src="plugins/layui/layui.js"></script>
  </head>
  
  <body>
  <%String reslut=(String)session.getAttribute("findreslut"); 
           System.out.println("StudentShow返回值："+reslut);
   %>
           <input   id="hiddens" type="hidden" value=<%= reslut%>>
       
           <fieldset class="layui-elem-field">
                <legend>学生信息列表</legend>
                <div class="layui-field-box">
                       <div class="beg-table-box">
                            <div class="beg-table-body">
                            <table class="layui-table lay-even">
                             <thead>
                             <tr>
                              <th>姓名</th>
                              <th>学号</th>
                              <th>性别</th>
                              <th>生日</th>
                              <th>班级</th>
                              <th>住址</th>
                              <th>手机号</th>
                              <th>操作</th>
                             </tr>
                            </thead>
                            <tbody>
                            <s:iterator  value="list">
                             <tr>
                                     <td><s:property value="sname"></s:property></td>
                                     <td><s:property value="sids"></s:property></td>
                                     <td><s:property value="ssex"></s:property></td>
                                     <td><s:property value="sbri"></s:property></td>
                                     <td><s:property value="classes.bjname"></s:property></td>
                                     <td><s:property value="sadress"></s:property></td>
                                    <td><s:property value="sphon"></s:property></td>
                                    <td><a class=" layui-btn layui-btn-small" href="showpers.action?id=<s:property value="sid"/>" >查看</a> 
                                    <a  class="layui-btn layui-btn-danger  layui-btn-small" href="javascript:;"onclick="del(this,<s:property value="sid"/>);" >删除</a></td>
                                </tr>
                            </s:iterator>
                            </tbody>
                        </table>
                        </div>
                        
                    </div>
                    <div class="beg-table-paged"></div>
                </div>
            </fieldset>
           
            <script type="text/javascript">
             layui.use('layer', function()
              {
                    var $ = layui.jquery,
                        layer = layui.layer;
                           var marks=document.getElementById("hiddens").value;
		                    if(marks=="无信息")
		                    {
		                            layer.msg('暂时没有学生信息！',{icon: 7}); 

		                    }
              });
            </script>
            <script type="text/javascript">
            
            layui.config({
                base: 'js/'
            });

            layui.use('begtable', function() {
                var begtable = layui.begtable(),
                    layer = layui.layer,
                    $ = layui.jquery,
                    laypage = layui.laypage;

                laypage({
                    cont: $('.beg-table-paged'),
                    pages: 25 //总页数
                        ,
                    groups: 5 //连续显示分页数
                        ,
                    jump: function(obj, first) {
                        //得到了当前页，用于向服务端请求对应数据
                        var curr = obj.curr;
                        if(!first) {
                            //layer.msg('第 '+ obj.curr +' 页');
                        }
                    }
                });
                });
            </script>
            
 <script type="text/javascript">
  layui.use('layer', function()
      {
              var $ = layui.jquery,
              form=layui.form,
              layer = layui.layer;
			 window.del=function(obj,id)
			 {
			        
			     layer.confirm("真的要删除么?" ,function(index)
			     {
			         $.ajax({ 
                                         type:"POST",
                                         url: "delStudent?mark="+id+"",
                                         async:false,
                                          contentType: "application/json; charset=utf-8",
                                         scriptCharset:'UTF-8',
                                        error : function(XMLHttpRequest, textStatus, errorThrown)
                                        {
                                             alert("error"+errorThrown);
                                         },
                                         success: function(data)
                                         {
                                            layer.closeAll();
                                            layer.msg('删除成功');
                                            $(obj).parents("tr").remove();
                                         }
                                   });
			     });
			 }
	 });
 </script>
  </body>
</html>
