package com.controller;

import java.io.File;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Goods;
import com.entity.Sysuser;
import com.server.FtypeServer;
import com.server.GoodsServer;
import com.server.SysuserServier;
import com.server.ForderServer;
import com.util.PageBean;

@Controller
public class GoodsController {
    @Resource
    private GoodsServer goodsService;
    @Resource
    private FtypeServer typeService;
    @Resource
    private ForderServer orderService;
    @Resource
    private SysuserServier userService;


    // 作品详情
    @RequestMapping("showGoodsx.do")
    public String showGoods(ModelMap map, int id) {
        Goods goods = goodsService.getById(id);
        map.put("goods", goods);
        Map<String, Object> omap = new HashMap<String, Object>();
        omap.put("fid", id);
        map.put("ulist", userService.getAll(null));
        map.put("u2list", userService.getAll(null));
        map.put("olist", orderService.getAll(omap));
        map.put("tlist", typeService.getAll(null));
        map.put("user", userService.getById(Integer.parseInt(goods.getUid())));
        return "goodsx";
    }


    @RequestMapping("goodsListf.do")
    public String goodsListf(@RequestParam(value = "page", required = false) String page, ModelMap map,
                             HttpSession session) {
        Sysuser uu = (Sysuser) session.getAttribute("user");
        if (uu == null || uu.equals("")) {
            return "login";
        } else {
            if (page == null || page.equals("")) {
                page = "1";
            }
            PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
            Map<String, Object> pmap = new HashMap<String, Object>();
            pmap.put("pageno", pageBean.getStart());
            pmap.put("pageSize", pageBean.getPageSize());
            Map<String, Object> cmap = new HashMap<String, Object>();
            cmap.put("uid", uu.getId());
            pmap.put("uid", uu.getId());
            int total = goodsService.getCount(cmap);
            pageBean.setTotal(total);
            List<Goods> list = goodsService.getByPage(pmap);
            map.put("page", pageBean);
            map.put("list", list);
            session.setAttribute("p", 1);
            map.put("tlist", typeService.getAll(null));
            map.put("ulist", userService.getAll(null));
            return "shoplist";
        }
    }

    // 分页模糊查询
    @RequestMapping("showGoodsList.do")
    public String showGoodsList(@RequestParam(value = "page", required = false) String page, ModelMap map,
                                HttpSession session, Goods goods) {
        if (page == null || page.equals("")) {
            page = "1";
        }
        PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
        Map<String, Object> pmap = new HashMap<String, Object>();
        pmap.put("pageno", pageBean.getStart());
        pmap.put("pageSize", pageBean.getPageSize());

        Map<String, Object> cmap = new HashMap<String, Object>();
        System.out.println("name===" + goods.getName());
        if (goods.getName() != null && !goods.getName().equals("")) {
            cmap.put("name", goods.getName());
            pmap.put("name", goods.getName());
        }
        if (goods.getFid() != null && !goods.getFid().equals("")) {
            cmap.put("fid", goods.getFid());
            pmap.put("fid", goods.getFid());
        }
        int total = goodsService.getCount(cmap);
        pageBean.setTotal(total);
        List<Goods> list = goodsService.getByPage(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        session.setAttribute("p", 1);
        map.put("tlist", typeService.getAll(null));
        return "goodsList";
    }

    // 分页模糊查询
    @RequestMapping("selectGoodsList.do")
    public String selectGoodsList(@RequestParam(value = "page", required = false) String page, ModelMap map,
                                  HttpSession session, Goods goods) {
        if (page == null || page.equals("")) {
            page = "1";
        }
        PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
        Map<String, Object> pmap = new HashMap<String, Object>();
        pmap.put("pageno", pageBean.getStart());
        pmap.put("pageSize", pageBean.getPageSize());

        Map<String, Object> cmap = new HashMap<String, Object>();
        System.out.println("name===" + goods.getName());
        if (goods.getName() != null && !goods.getName().equals("")) {
            cmap.put("name", goods.getName());
            pmap.put("name", goods.getName());
        }
        if (goods.getFid() != null && !goods.getFid().equals("")) {
            cmap.put("fid", goods.getFid());
            pmap.put("fid", goods.getFid());
        }
        if (goods.getUid() != null && !goods.getUid().equals("")) {
            cmap.put("uid", goods.getUid());
            pmap.put("uid", goods.getUid());
        }
        if (goods.getMark() != null && !goods.getMark().equals("")) {
            cmap.put("mark", goods.getMark());
            pmap.put("mark", goods.getMark());
        }
        int total = goodsService.getCount(cmap);
        pageBean.setTotal(total);
        List<Goods> list = goodsService.getAll(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        session.setAttribute("p", 2);
        map.put("tlist", typeService.getAll(null));
        return "goodsList";
    }

    // 分页模糊查询
    @RequestMapping("showGoodsType.do")
    public String showGoodsType(ModelMap map, Goods goods) {
        Map<String, Object> pmap = new HashMap<String, Object>();
        if (goods.getName() != null && !goods.getName().equals("")) {
            pmap.put("name", goods.getName());
        }
        if (goods.getFid() != null && !goods.getFid().equals("")) {
            pmap.put("fid", goods.getFid());
        }
        if (goods.getMark() != null && !goods.getMark().equals("")) {
            pmap.put("mark", goods.getMark());
        }
        List<Goods> list = goodsService.getAll(pmap);
        map.put("list", list);
        map.put("tlist", typeService.getAll(null));
        return "goodsList";
    }

    /**
     * ===设计案例后台管理===
     *
     * @param map
     * @return
     */
    public void commonMethod(ModelMap map) {
        map.put("tlist", typeService.getAll(null));
        Map<String, Object> umap = new HashMap<>();
        umap.put("utype", "设计师");
        map.put("ulist", userService.getAll(umap));
    }


    @RequestMapping("admin/doAddGoods.do")
    public String doAddGoods(ModelMap map) {
        commonMethod(map);
        return "admin/goods_add";
    }

    @RequestMapping("admin/addGoods.do")
    public String addGoods(@RequestParam(value = "file", required = false) MultipartFile file,
                           HttpServletRequest request, Goods goods, String img, HttpSession session) {
        Sysuser u = (Sysuser) session.getAttribute("auser");
        if (u == null || u.equals("")) {
            return "admin/login";
        } else {
            img = fileUpload(file, request, img);
            goods.setImg(img);
            java.sql.Timestamp time = new Timestamp(System.currentTimeMillis());
            goods.setPubtime(time.toString().substring(0, 19));
            goods.setIsdel("1");
            goods.setUid(u.getId() + "");
            goods.setXnum(0);
            goods.setKcnum(99);
            goodsService.add(goods);
            return "redirect:goodsList.do";
        }
    }

    @RequestMapping("admin/doUpdateGoods.do")
    public String doUpdateGoods(ModelMap map, int id) {
        map.put("goods", goodsService.getById(id));
        commonMethod(map);
        return "admin/goods_update";
    }

    @RequestMapping("admin/updateGoods.do")
    public String updateGoods(@RequestParam(value = "file", required = false) MultipartFile file,
                              HttpServletRequest request, Goods goods, String img) {
        img = fileUpload(file, request, img);
        if (img != "zanwu.jpg") {
            goods.setImg(img);
        }
        goodsService.update(goods);
        return "redirect:goodsList.do";
    }

    // 分页查询
    @RequestMapping("admin/goodsList.do")
    public String jianList(ModelMap map, HttpSession session) {
        Sysuser u = (Sysuser) session.getAttribute("auser");
        if (u == null || u.equals("")) {
            return "admin/login";
        } else {
            Map<String, Object> gMap = new HashMap<>();
            if (u.getUtype().equals("设计师")) {
                gMap.put("uid", u.getId());
            }
            List<Goods> list = goodsService.getAll(gMap);
            map.put("list", list);
            commonMethod(map);
            return "admin/goods_list";
        }
    }


    // 分页模糊查询
    @RequestMapping("admin/searchGoodsList.do")
    public String searchGoodsList(ModelMap map, Goods goods, HttpSession session) {
        Sysuser u = (Sysuser) session.getAttribute("auser");
        if (u == null || u.equals("")) {
            return "admin/login";
        } else {
            Map<String, Object> pmap = new HashMap<>();
            if (goods.getName() != null && !goods.getName().equals("")) {
                pmap.put("name", goods.getName());
            }
            if (goods.getFid() != null && !goods.getFid().equals("")) {
                pmap.put("fid", goods.getFid());
            }
            if (u.getUtype().equals("设计师")) {
                pmap.put("uid", u.getId());
            }
            List<Goods> list = goodsService.getAll(pmap);
            map.put("list", list);
            commonMethod(map);
            return "admin/goods_list";
        }
    }

    @RequestMapping("admin/deleteGoods.do")
    public String deleteGoods(int id) {
        goodsService.delete(id);
        return "redirect:goodsList.do";
    }

    // 文件上传
    public String fileUpload(@RequestParam(value = "file", required = false) MultipartFile file,
                             HttpServletRequest request, String img) {
        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();
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
            img = "zanwu.jpg";
        }
        return img;

    }
}
