package com.swz.action;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;
import com.swz.entity.Student;
import com.swz.service.StudentService;

@Controller()
@Scope("prototype")
public class TestPhoneAction extends  ActionSupport
{
	private static final long serialVersionUID = -898069389336447477L;
	@Autowired
	private List<Student> studentlis;
	@Autowired
	private StudentService studentService;

	public List<Student> getStudentlis()
	{
		return studentlis;
	}

	public void setStudentlis(List<Student> studentlis)
	{
		this.studentlis = studentlis;
	}

}
