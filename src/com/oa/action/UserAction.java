package com.oa.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.pojo.Department;
import com.oa.pojo.Role;
import com.oa.pojo.User;
import com.oa.service.DepartmentService;
import com.oa.service.RoleService;
import com.oa.service.UserService;
import com.oa.util.MD5;
import com.oa.util.PageInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>, ServletRequestAware {

	private UserService userService;
	private HttpServletRequest request;
	private User user = new User();
	//性别集合
	private List<String> genderList;
	//学历集合
	private List<String> educationList;
	private DepartmentService departmentService;
	private RoleService roleService;
	// 分页类
	private PageInfo pageInfo;
	// 登录时的验证码
	private String imageCode;
	// 模糊查询真实姓名,年龄范围
	private String name="";
	private int age1;
	private int age2;
	// 文件
    private File image; 
    // 文件名
	private String imageFileName;  
	// 文件类型
	private String imageContentType;  
	// 部门id
	private Long deptId;
	//ajax
	private InputStream inputStream;
	//定义岗位id
	private Long[] roleIds=new Long[10];
	//部门名称  第1个下拉框里的
	private String deptName1;

	public UserAction() {

		pageInfo = new PageInfo();
	}

	public String login() {
		User u = userService.login(user.getLoginName(), user.getPassword());
		if (u == null) {
			addFieldError("userError", "用户名或密码错误!");
			return ERROR;
		} else {
			HttpSession httpSession = request.getSession();

			if (!httpSession.getAttribute("sRand").equals(imageCode)) {
				addFieldError("codeError", "验证码错误!");

				return ERROR;
			}
			httpSession.setAttribute("user", u);
			return SUCCESS;
		}

	}

	//注销 
	public String logout() throws Exception {
		request.getSession().removeAttribute("user");
		return "logout";
	}
	
	public void initData(){
		genderList = new ArrayList<String>();
		genderList.add("男");
		genderList.add("女");
		educationList = new ArrayList<String>();
		educationList.add("高中");
		educationList.add("大专");
		educationList.add("本科");
		educationList.add("硕士");
		educationList.add("博士");
	}
	
	public String addUI() {

		initData();
		List<Department> departmentList1=departmentService.findList();
		// 查询所有岗位
		List<Role> roleList=roleService.findAll();
		ActionContext.getContext().put("departmentList1", departmentList1);
		ActionContext.getContext().put("roleList", roleList);
		return "add";
	}

	/*//根据上级部门查询下级部门
	public String getChildren(){
		List<Department> deptList=departmentService.findChildren(deptId);
		StringBuilder sb=new StringBuilder();
		for(Department d:deptList){
			sb.append(d.getName()+"#");
		}
		String s="";
		if(sb.length()>0){
			
			s=sb.toString().substring(0,sb.length()-1);
		}
		try {
			inputStream= new ByteArrayInputStream(s.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajaxDept";
	}*/
	// 添加员工信息
	public String add() {

		common();
		userService.save(user);
		request.setAttribute("msg_add", "添加员工成功");
		return getUsersByPage();
	}

	// 编辑员工信息
	public String editUI() {
		
		initData();
		List<Department> departmentList1=departmentService.findList();
		// 查询所有岗位
		List<Role> roleList=roleService.findAll();
		ActionContext.getContext().put("departmentList1", departmentList1);
		ActionContext.getContext().put("roleList", roleList);
		User u=userService.getById(user.getId());
		List<Role> list=new ArrayList<Role>(u.getRoles());
		for (int i = 0; i < list.size(); i++) {
			Role r=list.get(i);
			roleIds[i]= list.get(i).getId();
		}
		ActionContext.getContext().getValueStack().push(u);
		return "edit";
	}

	public void common(){
		System.out.println("文件名："+imageFileName);
		System.out.println("文件类型："+imageContentType);
		
		//每个用户上传头像名称不能重复
		String filePath="d:/oarun/image/user/"+user.getLoginName()+"_"+imageFileName;
		File saveFile=new File(filePath);
		try {
			FileUtils.copyFile(image, saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		Department d=departmentService.findByName(deptName1);
		user.setImageAddress(filePath);
		user.setDepartment(d);
		List<Role> roles=roleService.getByIds(roleIds);
		//list中无重复数据，直接转换为set
		user.setRoles(new HashSet<Role>(roles));
	}
	public String edit() {
		common();
		userService.update(user);
		request.setAttribute("msg_edit", "编辑员工成功");
		return getUsersByPage();
	}

	public String delete() {
		userService.delete(user.getId());
		request.setAttribute("msg_delete", "删除员工成功");
		return getUsersByPage();
	}

	public String getUsersByPage(){
		
		//需要判断请求,pageInfo,name,age1,age2都可以不传值
		//若参数无name,age1,age2,则分别为null,0,0
		//若不传,pageInfo参数会在请求到来时构造函数创建,默认查询第一页,name,age1,age2参数判断一下,
		//若传值,则构造,注入新值
		//若请求参数中有name,则name不为null,也不为""
		
		String s1=request.getRemoteAddr();
		String s2=request.getRequestURI();
		String s3=new String(request.getRequestURL())+request.getQueryString();
		String s4=request.getHeader("");
		Enumeration<String> s5=request.getHeaderNames();
		
		System.out.println(name);
		//不执行if,
		if(name==null||name==""){
			name="";
		}else {
			try {
				name=new String(name.getBytes("iso8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		if(age2==0){
			age2=99;
		}
		
	    //分页数据
		List<User> list=userService.getUsersByPage(pageInfo,name,age1,age2);
		//获取总记录数
		int totalRecord=userService.getAllQuery(name,age1,age2);
		pageInfo.setTotalRecord(totalRecord);
		request.setAttribute("userList", list);
		request.setAttribute("page", pageInfo);
		return "pageList";
	}

	//ajax检测用户名是否可用,重复不可用
	public void checkName(){
		User u=userService.findByName(user.getLoginName());
		
		try {
			HttpServletResponse response=ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out=response.getWriter();
			if(u==null){
				out.println("1");
			}else{
				
				out.println("2");
			}
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void showImage(){
		User u=userService.findByName(user.getLoginName());
		String filePath = u.getImageAddress();
		try {
			InputStream in=new FileInputStream(filePath);
			
			byte[] data;
			try {
				data = new byte[in.available()];
				in.read(data);
				in.close();
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setContentType("image/*"); // 设置返回的文件类型
				OutputStream out = response.getOutputStream(); // 得到向客户端输出二进制数据的对象
				out.write(data); // 输出数据
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public User getModel() {
		return user;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}

	public List<String> getGenderList() {
		return genderList;
	}

	public void setGenderList(List<String> genderList) {
		this.genderList = genderList;
	}

	public List<String> getEducationList() {
		return educationList;
	}

	public void setEducationList(List<String> educationList) {
		this.educationList = educationList;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge1() {
		return age1;
	}

	public void setAge1(int age1) {
		this.age1 = age1;
	}

	public int getAge2() {
		return age2;
	}

	public void setAge2(int age2) {
		this.age2 = age2;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public Long[] getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(Long[] roleIds) {
		this.roleIds = roleIds;
	}

	public String getDeptName1() {
		return deptName1;
	}

	public void setDeptName1(String deptName1) {
		this.deptName1 = deptName1;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserService getUserService() {
		return userService;
	}
	
}
