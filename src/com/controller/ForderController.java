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

import com.entity.Forder;
import com.entity.Fshop;
import com.entity.Goods;
import com.entity.Sysuser;
import com.server.ForderServer;
import com.server.FshopServer;
import com.server.FtypeServer;
import com.server.GoodsServer;
import com.server.SysuserServier;
import com.util.Info;

@Controller
public class ForderController {
    @Resource
    private ForderServer orderService;
    @Resource
    private SysuserServier userService;
    @Resource
    private GoodsServer goodsService;
    @Resource
    private FshopServer shopService;
    @Resource
    private FtypeServer typeService;

    // 退货 tuiHuo.do
    @RequestMapping("tuiHuo.do")
    public String tuiHuo(HttpServletRequest request, Forder order, HttpSession session, int id) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            order = orderService.getById(id);
            order.setStatus("待确认退货");
            order.setId(id);
            orderService.update(order);
            return "redirect:shopList.do";
        }
    }

    @RequestMapping("deleteShop.do")
    public String deleteShop(int id) {
        shopService.delete(id);
        return "redirect:showShop.do";
    }

    // 订单
    @RequestMapping("addOrder.do")
    public String addOrder(HttpServletRequest request, Forder order, HttpSession session) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        Timestamp time = new Timestamp(System.currentTimeMillis());
        if (u == null) {
            return "login";
        } else {
            u = userService.getById(u.getId());
            if (order.getZprice() > u.getMoney()) {
                return "redirect:doAddMoney.do";
            } else {
                String ono = Info.getID();
                System.out.println("订单号rr===" + ono);
                Map<String, Object> smap = new HashMap<String, Object>();
                smap.put("uid", u.getId());
                smap.put("status", "购物车");
                List<Fshop> slist = shopService.getAll(smap);
                Forder fo = new Forder();
                fo.setIsdel("1");
                fo.setOno(ono);
                fo.setStime(time.toString().substring(0, 19));
                fo.setPubtime(time.toString().substring(0, 10));
                fo.setUid(u.getId());
                fo.setStatus("已支付");
                fo.setZprice(order.getZprice());
                fo.setFid(order.getFid());
                for (Fshop fs : slist) {
                    Fshop ff = shopService.getById(fs.getId());
                    if (ff.getBtype().equals("1")) {
                        Goods gg = goodsService.getById(ff.getFid());
                        gg.setXnum(gg.getXnum() + ff.getNum());
                        gg.setId(ff.getFid());
                        fo.setFid(gg.getId());
                        fo.setAmount(ff.getNum());
                        fo.setJid(Integer.parseInt(gg.getUid()));
                        fo.setZprice(gg.getPrice() * ff.getNum());
                        fo.setBtype("1");
                        orderService.add(fo);
                        goodsService.update(gg);
                    }

                    ff.setStatus("已支付");
                    ff.setId(fs.getId());
                    ff.setOid(ono);
                    shopService.update(ff);
                }
                Double dd = u.getMoney();
                Double snum = dd - order.getZprice();
                u.setMoney(snum);
                userService.update(u);
                return "success";
            }
        }
    }

    // 订单详情查看showOrderDetail.do
    @RequestMapping("admin/showOrderDetail.do")
    public String showOrderDetail(int id, ModelMap map, HttpSession session) {
        Forder order = orderService.getById(id);
        Map<String, Object> gmap = new HashMap<String, Object>();
        gmap.put("oid", order.getOno());
        map.put("list", shopService.getAll(gmap));
        map.put("order", order);
        map.put("glist", goodsService.getAll(null));
        map.put("ulist", userService.getAll(null));
        return "admin/order_detail";
    }

    // 前台订单详情查看showOrderDetail.do
    @RequestMapping("showOrderDetail.do")
    public String fshowOrderDetail(int id, ModelMap map, HttpSession session) {
        Forder order = orderService.getById(id);
        Map<String, Object> gmap = new HashMap<String, Object>();
        gmap.put("oid", order.getOno());
        map.put("list", shopService.getAll(gmap));
        map.put("order", order);
        map.put("glist", goodsService.getAll(null));
        map.put("ulist", userService.getAll(null));
        return "order_detail";
    }

    // 购物车
    @RequestMapping("addshop.do")
    public String addForder(HttpServletRequest request, Fshop shop, HttpSession session, int fid, int bid) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        Timestamp time = new Timestamp(System.currentTimeMillis());
        if (u == null) {
            return "login";
        } else {

            Map<String, Object> smap = new HashMap<>();
            smap.put("uid", u.getId());
            smap.put("fid", fid);
            smap.put("btype", bid);
            smap.put("fid", fid);
            smap.put("status", "购物车");
            int count = shopService.getCount(smap);
            if (count > 0) {
                Fshop shop1 = shopService.getAll(smap).get(0);
                shop1.setNum(shop1.getNum() + 1);
                shopService.update(shop1);
            } else {
                shop.setUid(u.getId());
                shop.setFid(fid);
                shop.setStatus("购物车");
                shop.setPubtime(time.toString().substring(0, 19));
                shop.setNum(1);
                shop.setBtype(bid + "");
                shopService.add(shop);
            }
            return "redirect:showShop.do";
        }

    }

    // 显示购物车
    @RequestMapping("showShop.do")
    public String showShop(HttpServletRequest request, Fshop shop, HttpSession session, ModelMap map) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            Map<String, Object> smap = new HashMap<String, Object>();
            Map<String, Object> spacemap = new HashMap<String, Object>();
            smap.put("uid", u.getId());
            smap.put("status", "购物车");
            spacemap.put("status", "可预订");
            map.put("list", shopService.getAll(smap));
            map.put("glist", goodsService.getAll(null));
            map.put("user", userService.getById(u.getId()));
            return "cart_list";
        }

    }

    // 修改购物车的数量
    @RequestMapping("updateShopNum.do")
    public String updateShopNum(HttpServletRequest request, Fshop shop) {
        shopService.update(shop);
        return "redirect:showShop.do";
    }

    // 分页查询
    @RequestMapping("shopList.do")
    public String jianList(ModelMap map, HttpSession session, String bid) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            Map<String, Object> pmap = new HashMap<String, Object>();
            pmap.put("btype", bid);
            pmap.put("uid", u.getId());
            List<Forder> list = orderService.getAll(pmap);
            map.put("list", list);
            map.put("glist", goodsService.getAll(null));
            map.put("tlist", typeService.getAll(null));
            map.put("ulist", userService.getAll(null));
            session.setAttribute("p", 1);
            if (bid.equals("1")) {
                return "myorderlist";
            }
            return "myorderlist";
        }
    }

    // 收藏

    @RequestMapping("addKeep.do")
    public String addKeep(ModelMap map, int fid, HttpSession session) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            Map<String, Object> gmap = new HashMap<>();
            gmap.put("uid", u.getId());
            gmap.put("fid", fid);
            gmap.put("btype", "收藏");
            int count = orderService.getCount(gmap);
            if (count > 0) {
                return "redirect:myKeepList.do";
            } else {
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                Forder forder = new Forder();
                forder.setFid(fid);
                forder.setBtype("收藏");
                forder.setUid(u.getId());
                forder.setStatus("收藏中");
                forder.setIsdel("1");
                forder.setPubtime(timestamp.toString().substring(0, 19));
                orderService.add(forder);
                return "redirect:myKeepList.do";

            }
        }
    }

    @RequestMapping("myKeepList.do")
    public String myKeepList(ModelMap map, HttpSession session) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            Map<String, Object> pmap = new HashMap<String, Object>();
            pmap.put("btype", "收藏");
            pmap.put("uid", u.getId());
            List<Forder> list = orderService.getAll(pmap);
            map.put("list", list);
            map.put("glist", goodsService.getAll(null));
            map.put("tlist", typeService.getAll(null));
            map.put("ulist", userService.getAll(null));
            session.setAttribute("p", 1);
            return "myKeeplist";
        }
    }


    @RequestMapping("deleteKeep.do")
    public String deleteKeep(int id) {
        orderService.delete(id);
        return "redirect:myKeepList.do";
    }


    @RequestMapping("doAddpj.do")
    public String doAddpj(int id, ModelMap map, Fshop shop, HttpSession session) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            Forder order = orderService.getById(id);
            Map<String, Object> gmap = new HashMap<String, Object>();
            gmap.put("oid", order.getOno());
            map.put("list", shopService.getAll(gmap));
            map.put("order", order);
            if (order.getBtype().equals("1")) {
                map.put("goods", goodsService.getById(order.getFid()));
            }
            map.put("ulist", userService.getAll(null));
            return "orderx";
        }
    }

    @RequestMapping("doAddpj2_1.do")
    public String doAddpj2_1(int id, ModelMap map, Fshop shop, HttpSession session) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            Forder order = orderService.getById(id);
            Map<String, Object> gmap = new HashMap<String, Object>();
            gmap.put("oid", order.getOno());
            map.put("list", shopService.getAll(gmap));
            map.put("order", order);
            map.put("user", userService.getById(order.getJid()));
            map.put("goods", goodsService.getById(order.getFid()));
            return "pingJia2";
        }
    }

    @RequestMapping("pingJia.do")
    public String pingJia(Forder order) {
        Forder o = orderService.getById(order.getId());
        Timestamp time = new Timestamp(System.currentTimeMillis());
        order.setStatus("已评价");
        order.setStime(time.toString().substring(0, 19));
        orderService.update(order);
        Map<String, Object> umap = new HashMap<>();
        umap.put("jid", o.getJid());
        umap.put("status", "已评价");
        int count = orderService.getCount(umap);
        List<Forder> flist = orderService.getAll(umap);
        double max = 0.0;
        for (Forder order1 : flist) {
            max += order1.getScope();
        }
        Sysuser user = userService.getById(o.getJid());
        max = max / count;
        user.setScope((double) Math.round(max * 100) / 100);
        userService.update(user);
        return "redirect:shopList.do?bid=" + 3;
    }

    @RequestMapping("pingJia2.do")
    public String pingJia2(Forder order) {
        Forder o = orderService.getById(order.getId());
        Timestamp time = new Timestamp(System.currentTimeMillis());
        order.setStatus("已评价");
        order.setStime(time.toString().substring(0, 19));
        orderService.update(order);
        Map<String, Object> umap = new HashMap<>();
        umap.put("jid", o.getJid());
        umap.put("status", "已评价");
        int count = orderService.getCount(umap);
        List<Forder> flist = orderService.getAll(umap);
        double max = 0.0;
        for (Forder order1 : flist) {
            max += order1.getScope();
        }
        Sysuser user = userService.getById(o.getJid());
        max = max / count;
        user.setScope((double) Math.round(max * 100) / 100);
        userService.update(user);
        return "redirect:shopList.do?bid=" + 1;
    }


    // 完成
    @RequestMapping("wancheng.do")
    public String wancheng(int id, Forder yp) {
        Timestamp time = new Timestamp(System.currentTimeMillis());
        yp.setStatus("已确认");
        yp.setId(id);
        yp.setStime(time.toString().substring(0, 19));
        orderService.update(yp);
        return "success";
    }


    @RequestMapping("admin/deleteForder.do")
    public String deleteForder(int id) {
        orderService.delete(id);
        return "redirect:forderList.do";
    }

    // 分页查询
    @RequestMapping("admin/forderList.do")
    public String ForderList(@RequestParam(value = "page", required = false) String page, ModelMap map,
                             HttpSession session, Forder order) {
        Sysuser u = (Sysuser) session.getAttribute("auser");
        if (u == null || u.equals("")) {
            return "admin/login";
        } else {
            Map<String, Object> pmap = new HashMap<>();
            pmap.put("btype", "1");
            if (u.getUtype().equals("设计师")) {
                pmap.put("jid", u.getId());
            }
            List<Forder> list = orderService.getAll(pmap);
            List<Sysuser> ulist = userService.getAll(null);
            List<Goods> jzlist = goodsService.getAll(null);
            map.put("list", list);
            map.put("ulist", ulist);
            map.put("glist", jzlist);
            return "admin/order_list";
        }
    }

    // 分页查询
    @RequestMapping("admin/searchForderList.do")
    public String searchForderList(ModelMap map, HttpSession session, Forder order) {
        Sysuser u = (Sysuser) session.getAttribute("auser");
        if (u == null || u.equals("")) {
            return "admin/login";
        } else {
            Map<String, Object> pmap = new HashMap<>();
            pmap.put("btype", "1");
            if (order.getFid() != null && !order.getFid().equals("")) {
                pmap.put("fid", order.getFid());
            }
            if (order.getStatus() != null && !order.getStatus().equals("")) {
                pmap.put("status", order.getStatus());
            }
            if (order.getOno() != null && !order.getOno().equals("")) {
                pmap.put("ono", order.getOno());
            }
            if (u.getUtype().equals("设计师")) {
                pmap.put("jid", u.getId());
            }
            List<Forder> list = orderService.getAll(pmap);
            List<Sysuser> ulist = userService.getAll(null);
            List<Goods> jzlist = goodsService.getAll(null);
            map.put("list", list);
            map.put("ulist", ulist);
            map.put("glist", jzlist);
            return "admin/order_list";
        }
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
