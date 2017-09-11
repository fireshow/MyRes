var navs = [{
	"title": "班级信息管理",
	"icon": "fa-cubes",
	"href":"",
	"spread": false,
	"children": [
	             {
		"title": "新建班级",
		"icon": "&#xe641;",
		"href": "AddClasses.jsp"
	},  {
		"title": "班级信息",
		"icon": "&#xe609;",
		"href": "showCls.action"
	}]
}, {
	"title": "学生信息管理",
	"icon": "&#xe612;",
	"spread": false,
	"children": [{
		"title": "新加学生",
		"icon": "fa-table",
		"href": "instuOfCla"
	}, {
		"title": "查询学生信息",
		"icon": "&#xe62a;",
		"href": " showstudents "
	}]
}, {
	"title": "课程信息管理",
	"icon": "&#x1002;",
	"spread": false,
	"children": [{
		"title": "添加课程",
		"icon": "&#xe654;",
		"href": "AddCourse.jsp"
	},
	{
		"title": "查看全部课程",
		"icon": "&#xe621;",
		"href": "FindAllCourse"
	}]
}, {
	"title": "成绩管理",
	"icon": "&#xe62a;",
	"href": "",
	"spread": false,
	"children": [ {
		"title": "统计成绩信息",
		"icon": "&#xe60a;",
		"href": "FindStudentAndClassesAndScor"
	}, {
		"title": "成绩录入",
		"icon": "&#xe609;",
		"href": "FindStudentAndKc"
	}]
}];