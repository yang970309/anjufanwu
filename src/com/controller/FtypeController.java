package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Ftype;
import com.server.FtypeServer;

import net.sf.json.JSONObject;

@Controller
public class FtypeController {
    @Resource
    private FtypeServer typeService;

    @RequestMapping("admin/addFtype.do")
    public void addFtype(Ftype Ftype, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", Ftype.getName());
        System.out.println("uname===" + typeService.checkUname(map));
        JSONObject obj = new JSONObject();
        if (typeService.checkUname(map) != null) {
            obj.put("info", "ok");
        } else {
            Ftype type = new Ftype();
            type.setName(Ftype.getName());
            type.setIsdel("1");
            typeService.add(type);
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

    @RequestMapping("admin/doUpdateFtype.do")
    public String doUpdateFtype(ModelMap map, int id) {
        map.put("ftype", typeService.getById(id));
        return "admin/type_update";
    }

    // 保存修改
    @RequestMapping("admin/updateFtype.do")
    public void updateFtype(Ftype ftype, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", ftype.getName());
        System.out.println("uname===" + typeService.checkUname(map));
        JSONObject obj = new JSONObject();
        if (typeService.checkUname(map) != null && !typeService.checkUname(map).getName().equals(ftype.getName())) {
            obj.put("info", "ok");
        } else {
            Ftype ftype1 = typeService.getById(ftype.getId());
            ftype1.setName(ftype.getName());
            typeService.update(ftype1);
            obj.put("info", "可以用！");
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

    // 分页查询
    @RequestMapping("admin/ftypeList.do")
    public String goodList(ModelMap map) {
        List<Ftype> list = typeService.getAll(null);
        map.put("list", list);
        return "admin/type_list";
    }

    // 分页模糊查询
    @RequestMapping("admin/searchFtypeList.do")
    public String searchFtypeList(ModelMap map, Ftype ftype) {
        Map<String, Object> pmap = new HashMap<String, Object>();
        if (ftype.getName() != null && !ftype.getName().equals("")) {
            pmap.put("name", ftype.getName());
        }
        List<Ftype> list = typeService.getAll(pmap);
        map.put("list", list);
        return "admin/type_list";
    }

    @RequestMapping("admin/deleteFtype.do")
    public String deleteFtype(int id) {
        typeService.delete(id);
        return "redirect:ftypeList.do";
    }
}
