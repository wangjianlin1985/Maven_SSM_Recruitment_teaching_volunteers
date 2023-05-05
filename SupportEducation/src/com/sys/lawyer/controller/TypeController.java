package com.sys.lawyer.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sys.lawyer.base.BaseController;
import com.sys.lawyer.po.Type;
import com.sys.lawyer.service.TypeService;
import com.sys.lawyer.utils.Pager;
import com.sys.lawyer.utils.SystemContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @ClassName:  
 * @Description: 
 * @author  - - admin
 * @date - 2018年12月18日 16时17分49秒
 */


@Controller
@RequestMapping("type")
public class TypeController extends BaseController {
	
	
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private TypeService typeService;

	/**
	 * 【不分页 => 查询列表 => 无条件】
	 * @Title: listAll
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 设定文件 
	 * @author
	 * @return String 返回类型 
	 * @throws
	 */
	@RequestMapping(value = "listAll.json")
	@ResponseBody
	public String listAll(Type bean, Integer pageIndex, Integer pageSiz){
		PageHelper.startPage(notEmpty(pageIndex) ? pageIndex : 0, 15);
		PageInfo<Type> pagers = new PageInfo<>(typeService.listAllByEntity(bean));
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("page", pagers);
		return jsonObject.toJSONString();
	}

	@RequestMapping(value = "getList.json")
	@ResponseBody
	public String getList(Type bean){
		List<Type> list = typeService.listAll();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", list);
		return jsonObject.toJSONString();
	}

	@RequestMapping(value = "edit.json")
	@ResponseBody
	public String edit(Type bean){
		Type bean1 = typeService.getByEntity(bean);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("bean", bean1);
		return jsonObject.toJSONString();
	}

	/**
	 * 跳至添加页面
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String add() {
		return "type/add";
	}

	@RequestMapping(value = "list.do")
	public String list() {
		return "type/list";
	}

	@RequestMapping(value = "save.json")
	@ResponseBody
	public String save(Type bean, HttpServletRequest request) {
		System.out.println("================================");
		System.out.println("================================");
		System.out.println("================================");
		System.out.println("提交的参数是"+JSON.toJSONString(bean));
		System.out.println("================================");
		System.out.println("================================");
		System.out.println("================================");
		JSONObject jsonObject = new JSONObject();
		if (notEmpty(bean)){
			Type bean1 = new Type();
			bean1.setName(bean.getName());
			bean1 = typeService.getByEntity(bean);
			if (notEmpty(bean1)){
				jsonObject.put("message", "类型名称重复");
				jsonObject.put("flag", false);
			} else {
				typeService.insert(bean);
				request.getSession().setAttribute("user", bean);
				jsonObject.put("message", "提交成功");
				jsonObject.put("flag", true);
			}
		}
		return jsonObject.toJSONString();
	}

	/**
	 * ajax 添加
	 * @param
	 * @return
	 */
	@RequestMapping(value = "save.json", method = RequestMethod.POST)
	@ResponseBody
	public String save(Type bean) {
		typeService.insert(bean);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", "添加成功");
		return jsonObject.toString();
	}


	/**
	 * ajax 修改
	 * @param
	 * @return
	 */
	@RequestMapping(value = "update.json", method = RequestMethod.POST)
	@ResponseBody
	public String update(Type bean) {
		typeService.updateById(bean);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", "修改成功");
		return jsonObject.toString();
	}

	/**
	 * ajax 删除
	 * @return
	 */
	@RequestMapping(value = "delete.json", method = RequestMethod.POST)
	@ResponseBody
	public String exDeleteJson(Integer id) {
		typeService.deleteById(id);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("message", "删除成功");
		return jsonObject.toString();
	}
}
