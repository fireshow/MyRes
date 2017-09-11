<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	  <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
        <link rel="stylesheet" href="css/login.css" />
        <link href="css/details.css" rel="stylesheet" type="text/css" />
  </head>
  <%
     String reslut=(String)session.getAttribute("loginreslut"); 
    System.out.println("返回的登陆结果:"+reslut);
  %>
 <body class="beg-login-bg">
        <div class="beg-login-box">
            <header>
                <h1>欢迎登陆</h1>
            </header>
            <div class="beg-login-main">
                <form  action ="logins"  method="post">
                    <div class="layui-form-item">
                        <label class="beg-login-icon">
                        <i class="layui-icon">&#xe612;</i>
                    </label>
                        <input type="text" name="userName" id="userName" lay-verify="userName" autocomplete="off"    required title="用户名不能为空哦" placeholder="用户名" class="layui-input">
                    </div>
                    <div class="layui-form-item">
                        <label class="beg-login-icon">
                        <i class="layui-icon">&#xe642;</i>
                    </label>
                        <input type="password" name="password" id="password" lay-verify="password" autocomplete="off"  required title="密码不能为空哦" placeholder="密码" class="layui-input">
                    </div>
<!--             <div class="layui-form-item" > -->
               
<!--                   <label class="beg-login-icon"> -->
<!--                         <i class="layui-icon">&#xe600;</i> -->
<!--                     </label> -->
<!--                     <div class="checkcode"> -->
<!--                  <input type="text" id="J_codetext" placeholder="请输入验证码"  autocomplete="off"   maxlength="4"> -->
<!--                  <canvas class="J_codeimg" id="myCanvas" onclick="createCode()"> -->
<!--                        Your browser does not support the canvas element. -->
<!--                   </canvas> -->
<!--               </div> -->
<!--          </div> -->
                    <div class="layui-form-item">
                          <div class="beg-pull-right">
                            <button class="layui-btn layui-btn-primary" lay-filter="login" id="input" >
                            <i class="layui-icon">&#xe609;</i> 注册
                        </button>
                      </div>
                        
                        <div class="beg-pull-left">
                           <button class="layui-btn layui-btn-primary" lay-submit lay-filter="login" id="login">
                            <i class="layui-icon">&#xe650;</i> 登录
                        </button>
                        </div>
                         </div>
               </form>
                        <div class="beg-clear"></div>
                        <div class="layui-form-item">
                       
            </div>
               
                 <input  type="hidden"  id="marks"   value=<%=reslut %>  >
                 <input  type="hidden"  id="yanzhengma"    >
                </div>
                <footer>
                <p><a href="http://www.stdu.edu.cn" target="#">©石家庄铁道大学信息科学与技术学院 </a></p>
             </footer>
        </div>
        <script type="text/javascript" src="plugins/layui/layui.js"></script>
        <script type="text/javascript"src="plugins/layui/lay/lib/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-1.7.js"></script>
        <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
      <script type="text/javascript" src="js/indexs.js"></script>
       
<script type="text/javascript">
    layui.use('layer', function() {
                     var $ = layui.jquery,
                        layer = layui.layer;
                    var marks=document.getElementById("marks").value;
                    if(marks=="1")
                    {
                          layer.msg('账号/密码有误！',{icon: 4}); 
                    }
                    $('#input').on('click', function() {
                        layer.open({
                            title: '学生注册',
                            maxmin: true,
                            type:2,
                            content: 'instuOfCla',
                            area: ['700px', '600px']
                        });
                        return false;
                    });
                });
                  $('#login').on('click', function() {
                  var yzm=document.getElementById("yanzhengma").value;
                  var inyzm=document.getElementById("J_codetext").value;
                        if(inyzm=="")
                        {
                             layer.msg('验证码不能为空');
                            return false;
                        }
                       if(inyzm!=yzm)
                        { 
                            layer.msg('验证码错误');
                            yzm="";
                            inyzm="";
                            return false;
                        }
                    });
</script>
    </body>

</html>
