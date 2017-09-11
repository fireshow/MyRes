<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
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
    
    <title>显示班级信息</title>
    
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
    <%String  mark=(String)session.getAttribute("delclassmark"); 
    System.out.print("从删除后台传到Classshow界面的值是"+mark);
    %>
   <input type="hidden" id="mark" value=<%=mark%>>
  
   <fieldset class="layui-elem-field">
                <legend>班级信息列表</legend>
                <div class="layui-field-box">
                       <div class="beg-table-box">
                            <div class="beg-table-body">
                            <table class="layui-table">
                             <thead>
                             <tr>
                              <th>班级编号</th>
                              <th>班级名称</th>
                              <th>操 &nbsp;&nbsp;作</th>
                             </tr>
                            </thead>
                            
                            <tbody>
                            <s:iterator  value="listclasses">
                             <tr>
                                     <td><s:property value="bjid"></s:property></td>
                                     <td><s:property value="bjname"></s:property></td>
                                      <td><a class="layui-btn layui-btn-danger  layui-btn-small" href="javscript:;" onclick="del(this,<s:property value="bjid"/>);" >
                                      删&nbsp;&nbsp;除</a></td>
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
            layui.use('layer', function()
      {
              var $ = layui.jquery,
              form=layui.form,
              layer = layui.layer;
             window.del=function(obj,id)
             {
                    
                 layer.confirm("删除班级后，班级学生也会被删除?" ,function(index)
                 {
                     $.ajax({ 
                                         type:"POST",
                                         url: "delclass?mark="+id+"",
                                         async:false,
                                          contentType: "application/json; charset=utf-8",
                                         scriptCharset:'UTF-8',
                                        error : function(XMLHttpRequest, textStatus, errorThrown)
                                        {
                                             alert("error"+errorThrown);
                                         },
                                         success: function()
                                         {
                                            layer.closeAll();
                                            layer.msg(' 删除成功！' , {icon: 1} );
                                            $(obj).parents("tr").remove();
                                         }
                                   });
                 });
             }

                        var  returnmark=document.getElementById("mark");
                        if(returnmark=="success")
                        {
                            layer.msg('删除成功');
                        }
                        else if(returnmark=="failed")
                        {
                            layer.msg('出了点小错，重启一下试试');
                        }
             });
            </script>
  </body>
</html>
