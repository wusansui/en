package com.oa.action;

import java.util.HashSet;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.oa.pojo.Privilege;
import com.oa.pojo.Role;
import com.oa.service.PrivilegeService;
import com.oa.service.RoleService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RoleAction extends ActionSupport implements ModelDriven<Role> {

	private RoleService roleService;
	private PrivilegeService privilegeService;
	private Long[] privilegeIds;
	private Role role = new Role();

	// 获得岗位集合
	public String list() {
		List<Role> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);
		return "list";
	}

	// 根据id删除岗位
	public String delete() {
		roleService.delete(role.getId());
		ActionContext.getContext().put("msg_delete", "删除岗位成功");

		return list();
	}

	public String addUI() {
		return "add";
	}

	public String add() {
		roleService.save(role);
		ActionContext.getContext().put("msg_add", "添加岗位成功");
		return list();
	}

	public String editUI() {
		Role r = roleService.getById(role.getId());
		ActionContext.getContext().getValueStack().push(r);;
		//ServletActionContext.getRequest().setAttribute("r",r);
		return "edit";
	}

	public String edit() {
		
		roleService.update(role);
		ActionContext.getContext().put("msg_edit", "编辑岗位成功");
		return list();
	}

	public String setPrivilegeUI() {
		Role r = roleService.getById(role.getId());
		ActionContext.getContext().put("role", r);

		List<Privilege> topPrivilegeList = privilegeService.findTopList();
		ActionContext.getContext().put("topPrivilegeList", topPrivilegeList);

		// 准备回显的数据
		//没有任何权限时返回空数组,不影响
		privilegeIds = new Long[r.getPrivileges().size()];
		int index = 0;
		for (Privilege privilege : r.getPrivileges()) {
			privilegeIds[index++] = privilege.getId();
		}

		return "setPrivilege";
	}

	public String setPrivilege() {
		Role r = roleService.getById(role.getId());
		// 设置要修改的属性
		List<Privilege> privilegeList = privilegeService.getByIds(privilegeIds);
		r.setPrivileges(new HashSet<Privilege>(privilegeList));

		// 更新到数据库中
		roleService.update(r);

		return list();

	}

	@Override
	public Role getModel() {
		return role;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public void setPrivilegeService(PrivilegeService privilegeService) {
		this.privilegeService = privilegeService;
	}

	public Long[] getPrivilegeIds() {
		return privilegeIds;
	}

	public void setPrivilegeIds(Long[] privilegeIds) {
		this.privilegeIds = privilegeIds;
	}

}
