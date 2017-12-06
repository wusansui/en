package com.oa.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.oa.pojo.Forum;
import com.oa.service.ForumManageService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ForumManageAction extends ActionSupport implements
		ModelDriven<Forum> {

	private ForumManageService forumManageService;
	private Forum forum = new Forum();
	// 文件
	private File image;
	// 文件名
	private String imageFileName;
	// 文件类型
	private String imageContentType;

	public String list() {
		List<Forum> forumList = forumManageService.findAll();
		ActionContext.getContext().put("forumList", forumList);
		return "forumManageList";
	}

	public String addUI() {
		return "add";
	}

	public String add() {

		System.out.println("文件名：" + imageFileName);
		System.out.println("文件类型：" + imageContentType);

		String filePath = "d:/oarun/image/forum/" + forum.getName()+"_"+imageFileName;
		File saveFile = new File(filePath);
		try {
			FileUtils.copyFile(image, saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		forum.setImageName(filePath);
		forumManageService.save(forum);
		ActionContext.getContext().put("msg_add", "添加论坛版块成功");

		return list();
	}

	public String editUI() {
		Forum f = forumManageService.getById(forum.getId());
		ActionContext.getContext().getValueStack().push(f);
		return "edit";
	}

	public String edit() {

		String filePath = "d:/oarun/image/forum/" + forum.getName()+"_"+imageFileName;
		File saveFile = new File(filePath);
		try {
			FileUtils.copyFile(image, saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		forum.setImageName(filePath);

		forumManageService.update(forum);
		ActionContext.getContext().put("msg_edit", "编辑论坛版块成功");

		return list();
	}

	public String delete() {
		forumManageService.delete(forum.getId());
		ActionContext.getContext().put("msg_delete", "删除论坛版块成功");

		return list();
	}

	// 版块上移
	public String moveUp() {
		forumManageService.moveUp(forum.getId());
		return list();
	}

	// 版块下移
	public String moveDown() {
		forumManageService.moveDown(forum.getId());
		return list();
	}

	// 显示版块图片
	public void showImage() {
		Forum f=forumManageService.getById(forum.getId());
		String filePath = f.getImageName();
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

	public void setForumManageService(ForumManageService forumManageService) {
		this.forumManageService = forumManageService;
	}

	@Override
	public Forum getModel() {
		return forum;
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


}
