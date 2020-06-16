package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Sysuser;
import com.server.FtypeServer;
import com.server.SysuserServier;

import net.sf.json.JSONObject;

@Controller
public class SysuserController {
    @Resource
    private SysuserServier userService;
    @Resource
    private FtypeServer typeService;

    @RequestMapping("flogin.do")
    public String login() {
        return "login";
    }

    // 处理充值
    @RequestMapping("doAddMoney.do")
    public String doAddMoney(ModelMap map, HttpSession session) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            Sysuser user = userService.getById(u.getId());
            map.put("user", user);
            return "updateMoney";
        }
    }

    // 充值
    @RequestMapping("chongZhi.do")
    public String chongZhi(ModelMap map, HttpSession session, Sysuser user) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            Sysuser uu = userService.getById(u.getId());
            if (uu.getMoney() != null) {
                uu.setMoney(user.getMoney() + uu.getMoney());
            } else {
                uu.setMoney(user.getMoney());
            }
            userService.update(uu);
            map.put("user", userService.getById(u.getId()));
            return "redirect:showInfo.do";
        }
    }

    // 前台登录
    @RequestMapping("login.do")
    public String checkAdminLogin(Sysuser user, HttpSession session) {
        Map<String, Object> u = new HashMap<String, Object>();
        System.out.println("name===" + user.getUname());
        u.put("uname", user.getUname());
        u.put("pwd", user.getPwd());
        u.put("utype", "会员");
        user = userService.adminLogin(u);
        if (user != null) {
            session.setAttribute("user", user);
            System.out.println("user=" + user);
            session.removeAttribute("suc");
            return "redirect:index.do";
        } else {
            session.setAttribute("suc", "登录失败！用户名或密码错误！");
            return "login";
        }

    }

    //设计师
    @RequestMapping("genZhuangList.do")
    public String genZhuangList(Sysuser user, ModelMap map) {
        Map<String, Object> umap = new HashMap<String, Object>();
        umap.put("utype", "设计师");
        umap.put("pageno", 0);
        umap.put("pageSize", 100);
        List<Sysuser> ulist = userService.getTop(umap);
        map.put("list", ulist);
        map.put("tlist", typeService.getAll(null));
        return "user_list2";
    }

    @RequestMapping("showUserx_gz.do")
    public String showUserx_gz(int id, ModelMap map) {
        map.put("user", userService.getById(id));
        map.put("tlist", typeService.getAll(null));
        return "userx2";
    }


    // 前台忘记密码
    @RequestMapping("forPwd.do")
    public String forPwd(Sysuser user, ModelMap map) {
        Map<String, Object> umap = new HashMap<String, Object>();
        umap.put("uname", user.getUname());
        Sysuser u = userService.checkUname(umap);
        if (u == null || u.equals("")) {
            return "error_uname";
        } else {
            map.put("user", u);
            return "fore_losspwd";
        }

    }

    // 处理修改个人信息
    @RequestMapping("showInfo.do")
    public String showInfo(HttpSession session, ModelMap map) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            map.put("user", userService.getById(u.getId()));
            return "showUserinfo";
        }
    }


    // 处理修改个人信息
    @RequestMapping("addShowInfo.do")
    public String addShowInfo(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request,
                              Sysuser user, HttpSession session, String img, ModelMap map) {
        img = fileUpload(file, request, img);
        if (img != null) {
            user.setImg(img);
        }
        userService.update(user);
        return "success";
    }


    // 前台注销登录
    @RequestMapping("loginout.do")
    public String loginOut(HttpSession session) {
        session.removeAttribute("user");
        session.removeAttribute("p");
        return "login";
    }

    @RequestMapping("checkmibao.do")
    public void checkMB(Sysuser user, HttpServletResponse response, HttpSession session) {
        JSONObject obj = new JSONObject();
        Sysuser u = userService.getById(user.getId());
        String q = u.getQuestion();
        if (u == null || u.equals("")) {
            obj.put("info", "ng");
        } else {
            if (q.equals(user.getQuestion())) {
                obj.put("info", u.getPwd());
            } else {
                obj.put("info", "ng");
            }
        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }

    }


    // 验证用户名是否存在
    @RequestMapping("checkLossPwd.do")
    public void checkLossPwd(Sysuser user, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        map.put("uname", user.getUname());
        System.out.println("uname===" + user.getUname());
        System.out.println("uname222===" + userService.checkUname(map));
        JSONObject obj = new JSONObject();
        Sysuser user1 = userService.checkUname(map);
        if (userService.checkUname(map) != null) {
            System.out.println("uname233333333333===");
            obj.put("info", "ok");
            obj.put("answer", user1.getMbanswer());
            obj.put("question", user1.getQuestion());
            obj.put("pwd", user1.getPwd());
        } else {
            System.out.println("uname255555555555555===");
            obj.put("info", "ng");

        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    // 验证用户名是否存在
    @RequestMapping("checkUname.do")
    public void checkReg(Sysuser user, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        map.put("uname", user.getUname());
        System.out.println("uname===" + user.getUname());
        System.out.println("uname222===" + userService.checkUname(map));
        JSONObject obj = new JSONObject();
        if (userService.checkUname(map) != null) {
            System.out.println("uname233333333333===");
            obj.put("info", "ng");
        } else {
            System.out.println("uname255555555555555===");
            obj.put("info", "用户名可以用！");

        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    @RequestMapping("checkPass.do")
    public void checkPass(Sysuser user, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();
        map.put("uname", user.getUname());
        System.out.println("uname===" + user.getUname());
        System.out.println("uname222===" + userService.checkUname(map));
        JSONObject obj = new JSONObject();
        if (userService.checkUname(map) != null) {
            obj.put("info", userService.checkUname(map).getPwd());
        } else {
            obj.put("info", "ng");

        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    @RequestMapping("reg.do")
    public String addReg(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request,
                         Sysuser user, HttpSession session, String img, ModelMap map) {
        user.setUtype("会员");
        img = fileUpload(file, request, img);
        user.setImg(img);
        user.setIsdel("1");
        Timestamp time = new Timestamp(System.currentTimeMillis());
        user.setPubtime(time.toString());
        userService.add(user);
        return "login";
    }

    /**
     * ===后台用户管理===
     *
     * @param user
     * @param session
     * @return
     */

    // 后台登录
	/*@RequestMapping("admin/alogin.do")
	public String checkLogin(Sysuser user, HttpSession session) {
		Map<String, Object> u = new HashMap<String, Object>();
		System.out.println("name===" + user.getUname());
		System.out.println("pwd===" + user.getPwd());
		u.put("uname", user.getUname());
		u.put("utype", user.getUtype());
		u.put("pwd", user.getPwd());
		user = userService.adminLogin(u);
		if (user != null) {
			session.setAttribute("auser", user);
			System.out.println("auser=" + user);
			return "admin/index2";
		} else {

			return "admin/login";
		}
	}*/
    @RequestMapping("admin/alogin.do")
    public void checkLogin(Sysuser user, HttpServletResponse response, HttpSession session) {
        Map<String, Object> u = new HashMap<>();
        System.out.println("name===" + user.getUname());
        System.out.println("pwd===" + user.getPwd());
        u.put("uname", user.getUname());
        u.put("utype", user.getUtype());
        u.put("pwd", user.getPwd());
        JSONObject obj = new JSONObject();
        Sysuser auser = userService.adminLogin(u);
        if (auser != null) {
            session.setAttribute("auser", auser);
            obj.put("info", "ok");
        } else {
            obj.put("info", "ng");
        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }


    // 后台注销登录
    @RequestMapping("admin/loginout.do")
    public String adminLoginOut(HttpSession session) {
        session.removeAttribute("auser");
        return "redirect:login.do";
    }

    @RequestMapping("admin/login.do")
    public String aLogin() {
        return "admin/login";
    }

    @RequestMapping("admin/showUserInfo.do")
    public String showUserInfo(ModelMap map, HttpSession session) {
        if (session.getAttribute("auser") == null) {
            return "admin/login";
        }
        Sysuser u = (Sysuser) session.getAttribute("auser");
        map.put("user", userService.getById(u.getId()));
        return "admin/update_user_persion";
    }

    @RequestMapping("admin/updatePersionUser.do")
    public String updateUserInfo(@RequestParam(value = "file", required = false) MultipartFile file,
                                 HttpServletRequest request, Sysuser user, HttpSession session, String img, ModelMap map) {
        img = fileUpload(file, request, img);
        user.setImg(img);
        userService.update(user);
        map.put("user", userService.getById(user.getId()));
        session.setAttribute("suc", "cc");
        return "redirect:showUserInfo.do";
    }

    // 添加用户
    @RequestMapping("admin/addUser.do")
    public String addUser(@RequestParam(value = "file", required = false) MultipartFile file,
                          HttpServletRequest request, Sysuser user, HttpSession session, String img, ModelMap map) {
        img = fileUpload(file, request, img);
        user.setImg(img);
        Timestamp time = new Timestamp(System.currentTimeMillis());
        user.setPubtime(time.toString().substring(0, 19));
        user.setScope(0.0);
        user.setIsdel("1");
        userService.add(user);
        return "redirect:userList.do";
    }

    // 验证用户名是否存在
    @RequestMapping("admin/checkUname.do")
    public void checkUname(Sysuser user, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("uname", user.getUname());
        System.out.println("uname===" + user.getUname());
        System.out.println("uname222===" + userService.checkUname(map));
        JSONObject obj = new JSONObject();
        if (userService.checkUname(map) != null) {

            obj.put("info", "ng");
        } else {
            obj.put("info", "用户名可以用！");

        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    // 处理更新用户的信息
    @RequestMapping("admin/doUpdateUser.do")
    public String doUpdateUser(ModelMap map, int id) {
        System.out.println("id==" + id);
        map.put("user", userService.getById(id));
        return "admin/user_update";
    }

    // 更新用户的信息
    @RequestMapping("admin/updateUser.do")
    public String updateUser(@RequestParam(value = "file", required = false) MultipartFile file,
                             HttpServletRequest request, Sysuser user, HttpSession session, String img, ModelMap map) {
        img = fileUpload(file, request, img);
        if (img != null) {
            user.setImg(img);
        }

        userService.update(user);
        Sysuser auser = (Sysuser) session.getAttribute("auser");
        if (auser.getUtype() == "管理员") {
            return "redirect:userList.do";
        } else {
            return "redirect:doUpdateUser.do?id=" + auser.getId();
        }
    }

    // 查询所有用户的信息
    @RequestMapping("admin/userList.do")
    public String userList(ModelMap map) {
        List<Sysuser> list = userService.getAll(null);
        map.put("list", list);
        return "admin/user_list";
    }

    // 模糊查询并分页
    @RequestMapping("admin/userListQuery.do")
    public String useListQuery(ModelMap map, Sysuser user) {
        Map<String, Object> pmap = new HashMap<String, Object>();
        if (user.getUname() != null && !user.getUname().equals("")) {
            pmap.put("uname", user.getUname());
        }
        if (user.getTname() != null && !user.getTname().equals("")) {
            pmap.put("tname", user.getTname());
        }
        if (user.getUtype() != null && !user.getUtype().equals("")) {
            pmap.put("utype", user.getUtype());
        }
        List<Sysuser> list = userService.getAll(pmap);
        map.put("list", list);
        return "admin/user_list";
    }

    @RequestMapping("admin/deleteUser.do")
    public String deleteUser(int id) {
        userService.delete(id);
        return "redirect:userList.do";
    }

    // 文件上传
    public String fileUpload(@RequestParam(value = "file", required = false) MultipartFile file,
                             HttpServletRequest request, String img) {
        String path = request.getSession().getServletContext().getRealPath("upload");
        System.out.println("path===" + path);
        System.out.println("file===" + file);
        String fileName = file.getOriginalFilename();
        System.out.println("fileName===" + fileName);
        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        try {
            file.transferTo(targetFile);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String pa = request.getContextPath() + "/upload/" + fileName;
        System.out.println("path===" + pa);
        if (fileName != null && !fileName.equals("")) {
            img = fileName;
        } else {
            img = null;
        }

        return img;

    }

}
