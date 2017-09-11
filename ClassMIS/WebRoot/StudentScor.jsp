<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>学生个人分数统计</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
</head>

<body>
	<% Double avg=(Double)session.getAttribute("avg");
		System.out.print("返回值"+(Double)session.getAttribute("allxf"));
		   Double all =(Double)session.getAttribute("allxf");
	 %>
	<div style="margin: 30px;">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>个人成绩详细信息</legend>
		</fieldset>

		<form class="layui-form layui-form-pane">
			<div class="layui-form-item">
				<label class="layui-form-label">学号--姓名</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input" readonly
						value='<s:property value="student.sids"/>--<s:property value="student.sname"/>'>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">最高分</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input" readonly
						value='<s:property  value="scorlist.{scor}[scorlist.size()-1]"/>--<s:property  value="scorlist.{kc.kcname}[scorlist.size()-1]"/>'>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">最低分</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input" readonly
						value='<s:property  value="scorlist.{scor}[0]"/>--<s:property  value="scorlist.{kc.kcname}[0]"/>'>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">平均分</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input" readonly value=<%=avg%>>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">总学分</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input" readonly value='<%=all%>'>
				</div>
			</div>
		</form>
	</div>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>
			<s:property value="student.sname" />
			的成绩
		</legend>
		<div class="layui-field-box">
			<div class="beg-table-box">
				<div class="beg-table-body">
					<table class="layui-table">
						<thead>
							<tr>
								<th>序&nbsp;&nbsp;号</th>
								<th>所选课程</th>
								<th>课程分数</th>
							</tr>
						</thead>
						<tbody>
							<%int i=1; %>
							<s:iterator value="scorlist">
								<tr>
									<td><%=i%></td>
									<td><s:property value="kc.kcname"></s:property>
									</td>
									<td><s:if test="scor<60">
											<font color="red"><s:property value="scor"></s:property>
											</font>
										</s:if> <s:else>
											<font color="green"><s:property value="scor"></s:property>
											</font>
										</s:else>
									</td>
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
</body>
</html>
