package com.oa.action;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.oa.pojo.Department;
import com.oa.pojo.User;
import com.oa.service.DepartmentService;
import com.oa.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DepartmentAction extends ActionSupport implements ModelDriven<Department> {

	private Department department = new Department();
	private DepartmentService departmentService;
	private InputStream inputStream;
	//定义部门经理集合
	private List<String> managerList=new ArrayList<String>();
	private UserService userService;

	public String list() {

		List<Department> list = departmentService.findList();
		ActionContext.getContext().put("list", list);
		return "departmentList";
	}

	//获得经理集合
	public void findManagerAll(){
		List<User> list=departmentService.findManagerAll();
		for(int i=0;i<list.size();i++){
			managerList.add(list.get(i).getLoginName());
		}
		ActionContext.getContext().put("managerList", managerList);
		
	}
	public String addUI1() {
		findManagerAll();
		return "add1";
	}


	//添加上级部门
	public String add1() {
		String name=department.getManager().getLoginName();
		User u=userService.findByName(name);
		department.setManager(u);
		departmentService.save(department);
		ActionContext.getContext().put("msg_add1", "添加部门成功");

		return list();
	}


	public String editUI1() {
		findManagerAll();
		String id = ServletActionContext.getRequest().getParameter("id");
		Department d = departmentService.getById(Long.parseLong(id));
		ActionContext.getContext().getValueStack().push(d);
		return "edit1";
	}


	//2个对象一个id异常,需要从session中取到原来的对象,在进行赋值,
	//merge()虽然可以合并更新,但会update关联的外键
	public String edit1() {
		
		String name=department.getManager().getLoginName();
		User u=userService.findByName(name);
		Department d=departmentService.getById(department.getId());
		
		d.setManager(u);
		d.setName(department.getName());
		d.setNote(department.getNote());
		
		departmentService.update(d);
		ActionContext.getContext().put("msg_edit1", "更新部门成功");
		return list();
	}



	public String delete() {

		departmentService.delete(department.getId());
		ActionContext.getContext().put("msg_delete", "删除部门成功");
		return list();
	}

	/*public String childrenList() {

		try {
			List<Department> childrenList = departmentService.findChildren(department.getId());
			Department parent = departmentService.getById(department.getId());
			ActionContext.getContext().put("childrenList", childrenList);
			ActionContext.getContext().put("parent", parent);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}

			e.printStackTrace();
		}
		return "ajaxSee";
	}*/

	@Override
	public Department getModel() {
		return department;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}


	public List<String> getManagerList() {
		return managerList;
	}

	public void setManagerList(List<String> managerList) {
		this.managerList = managerList;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
