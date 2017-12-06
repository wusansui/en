package com.oa.service;

import java.util.List;

import com.oa.pojo.LeaveBill;

public interface LeaveApplyService {
	
	 //保存
	void save(LeaveBill leaveBill);
	//删除
	void delete(Long id);
	//更新
	void update(LeaveBill leaveBill);
	//通过id获取对象
	LeaveBill getById(Long id);
	
	List<LeaveBill> findAll();
}
