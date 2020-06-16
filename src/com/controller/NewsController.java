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

import com.entity.Ftype;
import com.entity.Goods;
import com.entity.News;
import com.server.ForderServer;
import com.server.FtypeServer;
import com.server.GoodsServer;
import com.server.NewsServer;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class NewsController {
    @Resource
    private NewsServer newsService;
    @Resource
    private ForderServer ForderService;
    @Resource
    private SysuserServier userService;
    @Resource
    private GoodsServer goodsService;
    @Resource
    private FtypeServer typeService;


    //	首页显示内容
    @RequestMapping("index.do")
    public String showIndex(ModelMap map) {
        Map<String, Object> pmap = new HashMap<String, Object>();
        Map<String, Object> nmap = new HashMap<String, Object>();
        Map<String, Object> jmap = new HashMap<String, Object>();
        Map<String, Object> cmap = new HashMap<String, Object>();
        pmap.put("pageno", 0);
        pmap.put("pageSize", 4);
        cmap.put("pageno", 0);
        cmap.put("pageSize", 6);
        jmap.put("pageno", 0);
        jmap.put("pageSize", 6);
        nmap.put("pageno", 0);
        nmap.put("pageSize", 8);
        List<News> list = newsService.getByPage(pmap);
        List<News> nlist = newsService.getByPage(nmap);
        List<Goods> glist = goodsService.getByPage(jmap);
        List<Ftype> alist = typeService.getAll(null);
        map.put("list", list);
        map.put("list2", nlist);
        map.put("tlist", alist);
        map.put("nlist", list);
        map.put("glist", glist);
        return "index2";
    }

    @RequestMapping("showNews.do")
    public String showNews(ModelMap map, int id) {
        map.put("news", newsService.getById(id));
        map.put("tlist", typeService.getAll(null));
        return "newsx";
    }


    //	分页
    @RequestMapping("newsListFore.do")
    public String newsListFore(@RequestParam(value = "page", required = false) String page,
                               ModelMap map, HttpSession session) {
        if (page == null || page.equals("")) {
            page = "1";
        }
        PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
        Map<String, Object> pmap = new HashMap<String, Object>();
        pmap.put("pageno", pageBean.getStart());
        pmap.put("pageSize", pageBean.getPageSize());
        int total = newsService.getCount(null);
        System.out.println("total===" + total);
        pageBean.setTotal(total);
        List<News> list = newsService.getByPage(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        session.setAttribute("p", 1);
        map.put("tlist", typeService.getAll(null));
        return "newlist";
    }


    @RequestMapping("searchNewsFore.do")
    public String searchNewsFore(@RequestParam(value = "page", required = false) String page,
                                 ModelMap map, HttpSession session, News news) {
        Map<String, Object> pmap = new HashMap<String, Object>();
        if (news.getName() != null && !news.getName().equals("")) {
            pmap.put("name", news.getName());
        }
        List<News> list = newsService.getAll(pmap);
        map.put("tlist", typeService.getAll(null));
        map.put("list", list);
        return "newlist";
    }


    /**
     * ===后台新闻公告管理===
     *
     * @param file
     * @param request
     * @param news
     * @param img
     * @return
     */


    @RequestMapping("admin/addNews.do")
    public String addNews(@RequestParam(value = "file", required = false) MultipartFile file,
                          HttpServletRequest request, News news, String img) {
        Timestamp time = new Timestamp(System.currentTimeMillis());
        news.setPubtime(time.toString().substring(0, 19));
        img = fileUpload(file, request, img);
        news.setImg(img);
        newsService.add(news);
        return "redirect:newsList.do";
    }

    @RequestMapping("admin/doUpdateNews.do")
    public String doUpdateNews(ModelMap map, int id) {
        map.put("news", newsService.getById(id));
        return "admin/news_update";
    }

    @RequestMapping("admin/updateNews.do")
    public String updateNews(@RequestParam(value = "file", required = false) MultipartFile file,
                             HttpServletRequest request, News news, String img) {
        img = fileUpload(file, request, img);
        if (img != null) {
            news.setImg(img);
        }
        newsService.update(news);
        return "redirect:newsList.do";
    }

    //	分页查询
    @RequestMapping("admin/newsList.do")
    public String goodList(ModelMap map) {
        List<News> list = newsService.getAll(null);
        map.put("list", list);
        return "admin/news_list";
    }

    //   分页模糊查询
    @RequestMapping("admin/searchNewsList.do")
    public String searchNewsList(ModelMap map, News news) {
        Map<String, Object> pmap = new HashMap<String, Object>();
        if (news.getName() != null && !news.getName().equals("")) {
            pmap.put("name", news.getName());
        }
        List<News> list = newsService.getAll(pmap);
        map.put("list", list);
        return "admin/news_list";
    }

    @RequestMapping("admin/deleteNews.do")
    public String deleteNews(int id) {
        newsService.delete(id);
        return "redirect:newsList.do";
    }

    //	文件上传
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
