package com.sys.lawyer.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sys.lawyer.base.BaseController;
import com.sys.lawyer.po.*;
import com.sys.lawyer.service.*;
import com.sys.lawyer.utils.Base64Img;
import com.sys.lawyer.utils.CaptchaUtil;
import com.sys.lawyer.utils.Pager;
import com.sys.lawyer.vo.ApplyVo;
import com.sys.lawyer.vo.EvaluateVo;
import com.sys.lawyer.vo.ReleasesVo;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.ibatis.annotations.Param;
import org.joda.time.DateTime;
import org.joda.time.Period;
import org.joda.time.PeriodType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author - - admin
 * @ClassName:
 * @Description:
 * @date - 2018年10月17日 14时41分30秒
 */


@Controller
@RequestMapping("web")
public class HomeController extends BaseController {


    /**
     * 依赖注入 start dao/service/===
     */
    @Autowired
    private UsersService usersService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private PhotoService photoService;
    @Autowired
    private ReleasesService releasesService;
    @Autowired
    private ApplyService applyService;
    @Autowired
    private EvaluateService evaluateService;
    @Autowired
    private MessageService messageService;

    @RequestMapping(value = "getPhoto.json")
    @ResponseBody
    public String getPhoto() {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", photoService.listAll());
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "login.json")
    @ResponseBody
    public String login(Users users, String captcha, HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        users.setRole(null);
        Users user = usersService.getByEntity(users);
        String code = (String) request.getSession().getAttribute("randomString");
        if (empty(captcha) || !code.toLowerCase().equals(captcha.toLowerCase())){
            jsonObject.put("message", "验证码错误");
            jsonObject.put("flag", false);
        } else if (empty(user)){
            jsonObject.put("message", "用户信息错误");
            jsonObject.put("flag", false);
        } else if (user != null && user.getRole() < 2){
            jsonObject.put("message", "管理员不可登录");
            jsonObject.put("flag", false);
        } else if (user.getIsSh() == 0){
            jsonObject.put("message", "账号未通过审核");
            jsonObject.put("flag", false);
        } else {
            request.getSession().setAttribute("user", user);
            jsonObject.put("flag", true);
        }

        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "/listAll.json")
    @ResponseBody
    public String listAll(@Param(value="typeId")Integer typeId, HttpServletRequest request){
        List<Users> list1 = usersService.findByTypeToEntity(typeId);
        
        if (!CollectionUtils.isEmpty(list1)){
    		for (Users p : list1){
    			p.setPhoto(request.getContextPath()+p.getPhoto());
    		}
    		
    	}
        
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", list1);
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "home.do")
    public String home(Model model) {
    	List<Photo> listAll = photoService.listAll();
    	
    	
        model.addAttribute("list",listAll );
        model.addAttribute("user", usersService.getUser());
        model.addAttribute("types", typeService.listAll());
        return "web/home";
    }

    @RequestMapping(value = "/")
    public String homes(Model model) {
        model.addAttribute("list", photoService.listAll());
        model.addAttribute("user", usersService.getUser());
        model.addAttribute("types", typeService.listAll());
        return "web/home";
    }

    @RequestMapping(value = "grkj.do")
    public String grkj() {
        return "web/grkj";
    }

    @RequestMapping(value = "fbzw.do")
    public String fbzw(Model model, HttpServletRequest request) {
        Users users = usersService.getUser();
        if (empty(users)){
            return "redirect:/web/login.do";
        }
        users.setPhoto(request.getContextPath()+users.getPhoto());
        model.addAttribute("user", users);
        return "web/fbzw";
    }

    /**
     * 个人空间参与职位
     * @return
     */
    @RequestMapping(value = "cyzw.json")
    @ResponseBody
    public String cyzw(){
        JSONObject jsonObject = new JSONObject();
        Users users = usersService.getUser();
        if (empty(users)) {
            jsonObject.put("flag", false);
            jsonObject.put("message", "请登录");
        } else {
            Apply apply = new Apply();
            apply.setSqr(users.getId());
            Pager<Apply> pagers = applyService.findByEntity(apply);
            List<ApplyVo> applyVos = new ArrayList<>();
            for (Apply a : pagers.getDatas()){
                ApplyVo applyVo = new ApplyVo();
                Releases releases = releasesService.getById(a.getReleaseId());
                a.setTypeName(typeService.getById(releases.getTypeId()).getName());
                Apply apply1 = a;
                applyVo.setApply(apply1);
                applyVo.setReleases(releases);
                applyVo.setUsers(usersService.getById(releases.getUsersId()));
                Period p = new Period(new DateTime(releases.getZjTime()), new DateTime(releases.getFwTime()), PeriodType.days());
                int days = p.getDays();
                applyVo.setFwsc(days);
                applyVos.add(applyVo);
            }
            jsonObject.put("page", pagers);
            jsonObject.put("list", JSON.toJSONString(applyVos, SerializerFeature.DisableCircularReferenceDetect));
        }
        return jsonObject.toJSONString();
    }


    @RequestMapping(value = "yfblist.json")
    @ResponseBody
    public String yfblist(Releases releases, Integer pageIndex, Integer pageSize){
        JSONObject jsonObject = new JSONObject();
        Users users = usersService.getUser();
        if (empty(users)) {
            jsonObject.put("flag", false);
            jsonObject.put("message", "请登录");
        } else {
            releases.setUsersId(users.getId());
            List<Releases> pagers = releasesService.listAllByEntity(releases);
            jsonObject.put("list", pagers);
        }
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "yfbEdit.do")
    public String yfbEdit(Releases releases, Model model){
        Users users = usersService.getUser();
        if (empty(users)) {
            model.addAttribute("flag", true);
        } else {
            model.addAttribute("bean", releasesService.getByEntity(releases));
            model.addAttribute("types", typeService.listAll());
        }
        return "web/reEdit";
    }

    @RequestMapping(value = "yfbEditUpdate.json")
    @ResponseBody
    public String yfbEditUpdate(Releases releases, String time){
        JSONObject jsonObject = new JSONObject();
        Users users = usersService.getUser();
        if (empty(users)) {
            jsonObject.put("flag", false);
            jsonObject.put("message", "请登录");
        } else {
            Releases byEntity = releasesService.getById(releases.getId());
            if (notEmpty(byEntity)){
                Releases releases1 = new Releases();
                releases1.setTypeId(releases.getTypeId());
                releases1.setUsersId(byEntity.getUsersId());
                releases1 = releasesService.getByEntity(releases1);
                if ((notEmpty(releases1) && releases1.getTypeId() == releases.getTypeId()) || empty(releases1)){
                    if (notEmpty(time)){
                        String[] times = time.split(" - ");
                        releases.setZjTime(new DateTime(times[0]).toDate());
                        releases.setFwTime(new DateTime(times[1]).toDate());
                    }
                    releasesService.updateById(releases);
                    jsonObject.put("flag", true);
                    jsonObject.put("message", "提交成功");
                } else {
                    jsonObject.put("flag", false);
                    jsonObject.put("message", "招聘类型重复");
                }
            }
        }
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "isFb.json")
    @ResponseBody
    public String isFb(Releases releases){
        JSONObject jsonObject = new JSONObject();
        Users users = usersService.getUser();
        if (empty(users)) {
            jsonObject.put("flag", false);
            jsonObject.put("message", "请登录");
        } else {
            releases.setIsFb(1);
            releasesService.updateById(releases);
            jsonObject.put("flag", true);
            jsonObject.put("message", "提交成功");
        }
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "isPl.do")
    public String isPl(Integer id, Integer userId, Integer sqr, Model model){
        Users users = usersService.getUser();
        if (empty(users)){
            return "redirect:/web/login.do";
        }
        model.addAttribute("id", id);
        model.addAttribute("userId", userId);
        model.addAttribute("sqr", sqr);
        return "web/pl";
    }

    @RequestMapping(value = "plsave.json")
    @ResponseBody
    public String plsave(Evaluate evaluate){
        Users users = usersService.getUser();
        evaluate.setPjr(users.getId());
        evaluate.setPjTime(new Date());
        if (users.getRole() == 3){
            evaluate.setBpj(releasesService.getById(evaluate.getReleaseId()).getUsersId());
        }
        evaluateService.insert(evaluate);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("message", "提交成功");
        jsonObject.put("flag", true);
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "adminSave.json")
    @ResponseBody
    public String adminSave(Message message){
        Users users = usersService.getUser();
        message.setTime(new Date());
        message.setUserId(users.getId());
        messageService.insert(message);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("message", "提交成功");
        jsonObject.put("flag", true);
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "ybmlist.json")
    @ResponseBody
    public String ybmlist(Apply apply, Integer pageIndex, Integer pageSize){
        JSONObject jsonObject = new JSONObject();
        Users users = usersService.getUser();
        if (empty(users)) {
            jsonObject.put("flag", false);
            jsonObject.put("message", "请登录");
        } else {
            List<Apply> list = applyService.listAllByEntity(apply);
            Releases releases = new Releases();
            releases.setUsersId(users.getId());
            List<Releases> releases1 = releasesService.listAllByEntity(releases);
            List<Apply> list2 = new ArrayList<>();
            for(Apply app : list){
                for (Releases releases2 : releases1){
                    if (releases2.getId() == app.getReleaseId()){
                        String name = typeService.getById(releases2.getTypeId()).getName();
                        app.setTypeName(name);
                        app.setSbrName(usersService.getById(app.getSqr()).getRealName());
                        app.setReleases(releases2);
                        list2.add(app);
                    }
                }
            }
            jsonObject.put("list", list2);
        }
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "reDetail.do")
    public String reDetail(Releases releases, Model model){
        model.addAttribute("bean", releasesService.getByEntity(releases));
        model.addAttribute("types", typeService.listAll());
        return "web/redetail";
    }

    @RequestMapping(value = "fbzwsave.json")
    @ResponseBody
    public String fbzwsave(Releases releases, String time) {
        JSONObject jsonObject = new JSONObject();
        Users users = usersService.getUser();
        if (notEmpty(time)){
            String[] times = time.split(" - ");
            releases.setZjTime(new DateTime(times[0]).toDate());
            releases.setFwTime(new DateTime(times[1]).toDate());
        }
        releases.setIsFb(0);
        if (empty(users)){
            jsonObject.put("flag", false);
            jsonObject.put("message", "请登录");
        } else {
            Releases releases1 = new Releases();
            releases1.setTypeId(releases.getTypeId());
            releases1.setUsersId(users.getId());
            releases1 = releasesService.getByEntity(releases1);
            if (notEmpty(releases1)){
                jsonObject.put("flag", false);
                jsonObject.put("message", "已发布过该职位");
            } else {
                releases.setUsersId(users.getId());
                jsonObject.put("flag", true);
                jsonObject.put("message", "提交成功");
                releases.setSyrs(releases.getRs());
                releasesService.insert(releases);
            }
        }
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "bmsave.json")
    @ResponseBody
    public String bmsave(Apply apply, Integer typeId) {
        JSONObject jsonObject = new JSONObject();
        Users users = usersService.getUser();
        if (empty(users)){
            jsonObject.put("flag", false);
            jsonObject.put("message", "请登录");
        } else if (empty(typeId)){
            jsonObject.put("flag", false);
            jsonObject.put("message", "请选选择职位");
        } else{
            Releases releases = new Releases();
            releases.setTypeId(typeId);
            List<Releases> list = releasesService.listAllByEntity(releases);
            releases.setUsersId(apply.getReleaseId());
            releases = releasesService.getByEntity(releases);
            if (empty(releases)){
                jsonObject.put("flag", false);
                jsonObject.put("message", "未发布该职位");
                return jsonObject.toJSONString();
            } else if (releases.getIsFb() == 1){
                jsonObject.put("flag", false);
                jsonObject.put("message", "报名已截止");
                return jsonObject.toJSONString();
            }
            Apply apply1 = new Apply();
            apply1.setSqr(users.getId());
            apply1.setIsDelete(0);
            apply1.setReleaseId(releases.getId());
            Apply apply2 = applyService.getByEntity(apply1);
            if (notEmpty(apply2)){
                jsonObject.put("flag", false);
                jsonObject.put("message", "请勿重复申请");
            } else if (notEmpty(list) && list.size() > 0){
                Releases releases1 = releases;
                if (releases1.getSyrs() >= 1){
//                    releases1.setSyrs(releases1.getSyrs() - 1);
                    apply.setIsDelete(0);
                    apply.setSqr(users.getId());
                    apply.setSqTime(new Date());
                    apply.setReleaseId(releases1.getId());
                    applyService.insert(apply);
                    jsonObject.put("flag", true);
                    jsonObject.put("message", "已报名");
                    releasesService.updateById(releases1);
                } else {
                    jsonObject.put("flag", false);
                    jsonObject.put("message", "申请人数已满");
                }
            } else {
                jsonObject.put("flag", false);
                jsonObject.put("message", "未发布该职位");
            }
        }
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "detail.do")
    public String detail(Integer id, Model model) {
        model.addAttribute("bean", usersService.getById(id));
        Releases releases = new Releases();
        releases.setUsersId(id);
        List<Releases> list = releasesService.listAllByEntity(releases);
        List<ReleasesVo> list1 = new ArrayList<>();
        for (Releases r : list){
            ReleasesVo releasesVo = new ReleasesVo();
            releasesVo.setReleases(r);
            releasesVo.setZw(typeService.getById(r.getTypeId()).getName());
            releasesVo.setZwId(r.getTypeId());
            list1.add(releasesVo);
        }
        Evaluate evaluate = new Evaluate();
        evaluate.setUsersId(id);
        List<Evaluate> list2 = evaluateService.listAllByEntity(evaluate);
        List<EvaluateVo> evaluateVos = new ArrayList<>();
        for (Evaluate e : list2){
            EvaluateVo evaluateVo = new EvaluateVo();
            evaluateVo.setEvaluate(e);
            evaluateVo.setPlr(usersService.getById(e.getPjr()));
            evaluateVos.add(evaluateVo);
        }
        model.addAttribute("res", list1);
        model.addAttribute("user", usersService.getUser());
        model.addAttribute("list2", evaluateVos);
        return "web/detail";
    }

    @RequestMapping(value = "login.do")
    public String zhuc(Model model) {
        model.addAttribute("list", photoService.listAll());
        return "web/login";
    }

    @RequestMapping(value = "pllb.json")
    @ResponseBody
    public String pllb() {
        Users users = usersService.getUser();
        Evaluate evaluate = new Evaluate();
        evaluate.setUsersId(users.getId());
        List<Evaluate> list2 = evaluateService.listAllByEntity(evaluate);
        List<EvaluateVo> evaluateVos = new ArrayList<>();
        for (Evaluate e : list2){
            EvaluateVo evaluateVo = new EvaluateVo();
            evaluateVo.setEvaluate(e);
            evaluateVo.setPlr(usersService.getById(e.getPjr()));
            evaluateVos.add(evaluateVo);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", evaluateVos);
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "grpj.json")
    @ResponseBody
    public String grpj() {
        Users users = usersService.getUser();
        Evaluate evaluate = new Evaluate();
        evaluate.setBpj(users.getId());
        List<Evaluate> list2 = evaluateService.listAllByEntity(evaluate);
        List<EvaluateVo> evaluateVos = new ArrayList<>();
        for (Evaluate e : list2){
            EvaluateVo evaluateVo = new EvaluateVo();
            evaluateVo.setEvaluate(e);
            evaluateVo.setPlr(usersService.getById(e.getPjr()));
            evaluateVos.add(evaluateVo);
        }
        evaluate = new Evaluate();
        evaluate.setPjr(users.getId());
        List<Evaluate> list3 = evaluateService.listAllByEntity(evaluate);
        for (Evaluate e : list3){
            EvaluateVo evaluateVo = new EvaluateVo();
            evaluateVo.setEvaluate(e);
            evaluateVo.setPlr(usersService.getById(e.getPjr()));
            evaluateVos.add(evaluateVo);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", evaluateVos);
        return jsonObject.toJSONString();
    }

    /**
     * 跳至添加页面
     *
     * @return
     */
    @RequestMapping(value = "/add")
    public String add(Integer role, Model model) {
        model.addAttribute("role", role);
        return "web/add";
    }


    @RequestMapping(value = "update.json")
    @ResponseBody
    public String update(Users users, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        if (notEmpty(users)) {
            if (notEmpty(users.getId())) {
                users.setPhoto("/resource/upload/" + saveFile(file, request));
                users.setIsDelete(0);
                usersService.updateById(users);
            }
            request.getSession().setAttribute("user", users);
            jsonObject.put("message", "提交成功");
            jsonObject.put("flag", true);
        }
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "save.json")
    @ResponseBody
    public String save(Users users, @RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        Users users1 = new Users();
        if (notEmpty(users)) {
            users1.setName(users.getName());
            users1 = usersService.getByEntity(users1);
            if (notEmpty(users1)) {
                jsonObject.put("message", "登录名重复");
                jsonObject.put("flag", false);
            } else {
                users.setPhoto("/resource/upload/" + saveFile(file, request));
                users.setIsDelete(0);
                if (notEmpty(users.getId())) {
                    usersService.update(users);
                } else {
                    users.setIsSh(0);
                    usersService.insert(users);
                }
                request.getSession().setAttribute("user", users);
                jsonObject.put("message", "提交成功");
                jsonObject.put("flag", true);
            }
        }
        return jsonObject.toJSONString();
    }


    /**
     * 删除通过主键
     *
     * @return
     */
    @RequestMapping(value = "delete.json")
    @ResponseBody
    public String delete(Integer id) {
        Users users = usersService.getUser();
        Users users2 = usersService.getById(id);
        JSONObject jsonObject = new JSONObject();
        if (users.getRole() == 0 || users.getRole() == 1) {
            if (users.getId() == id) {
                jsonObject.put("flag", false);
                jsonObject.put("message", "不能删除自己");
            } else if (users.getRole() == 1 && users2.getRole() == 0) {
                jsonObject.put("flag", false);
                jsonObject.put("message", "不能删除超级管理员");
            } else {
                usersService.deleteById(id);
                jsonObject.put("flag", true);
                jsonObject.put("message", "删除成功");
            }
        } else {
            jsonObject.put("flag", false);
            jsonObject.put("message", "本账号无权限删除用户");
        }
        return jsonObject.toJSONString();
    }

    /**
     * 【不分页 => 查询列表 => 无条件】
     *
     * @param @return 设定文件
     * @return String 返回类型
     * @throws
     * @Title: listAll
     * @Description: TODO(这里用一句话描述这个方法的作用)
     * @author
     */
    @RequestMapping(value = "/listAllJson", method = RequestMethod.POST)
    @ResponseBody
    public String listAllJson(Users users, HttpServletRequest request, HttpServletResponse response) {
        List<Users> listAll = usersService.listAll();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("list", listAll);
        jsonObject.put("obj", users);
        return jsonObject.toString();
    }

    /**
     * ajax 添加
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/exAddJson", method = RequestMethod.POST)
    @ResponseBody
    public String exAddJson(Users users, HttpServletRequest request, HttpServletResponse response) {
        usersService.insert(users);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("message", "添加成功");
        return jsonObject.toString();
    }


    /**
     * ajax 修改
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/exUpdate.json", method = RequestMethod.POST)
    @ResponseBody
    public String exUpdateJson(Users users, Model model, HttpServletRequest request, HttpServletResponse response) {
        //1.通过实体类修改，可以多传修改条件
        usersService.update(users);
        //2.通过主键id修改
        //usersService.updateById(users);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("message", "修改成功");
        return jsonObject.toString();
    }

    @RequestMapping(value = "loginOut.do")
    public String loginOut(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
        return "redirect:/web/home.do";
    }

    @RequestMapping(value = "/captcha", method = RequestMethod.GET)
    @ResponseBody
    public void captcha(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CaptchaUtil.outputCaptcha(request, response);
    }

    public String saveFile(@RequestParam(value = "file", required = false) MultipartFile files, HttpServletRequest request) {
        String filePath = "";
        String fileNmae = "";
        if (!files.isEmpty()) {
            int pre = (int) System.currentTimeMillis();
            try {
                filePath = request.getRealPath("/resource/upload/");
                File f = new File(filePath);
                if (!f.exists()) {
                    f.mkdirs();
                }
                fileNmae = pre + files.getOriginalFilename().replaceAll(" ", "").replace("(", "").replace(")", "");
                File file = new File(filePath + fileNmae);
                if (!file.exists()) {
                    file.createNewFile();
                }
                files.transferTo(file);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("上传出错");
            }
        }
        return fileNmae;
    }
}
