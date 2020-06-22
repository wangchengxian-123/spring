package com.aaa.controller;

import com.aaa.entity.Book;
import com.aaa.service.BookService;
import com.aaa.service.BookServiceImpl;
import com.aaa.util.FileUpLoadUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author WCX
 * @data 2020/3/14 15:35
 * @describe
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;
//    查询全部
    @RequestMapping("/query")
    @RequiresRoles("经理")
    public String query(HttpServletRequest request){
        Subject subject = SecurityUtils.getSubject();
//        if (subject.hasRole("经")) {
            List<Book> query = bookService.query();

            if (query.size() > 0) {
                request.setAttribute("list", query);
                return "book_list";
            }
//        }
    return "error";
    }
//    添加书籍
    @RequestMapping("/add")
public String add(Book book,@RequestParam("pic")MultipartFile[] picFile ,HttpServletRequest request)throws Exception{
//        String newFileNames[]=null;
        for (int i=0;i<picFile.length;i++){
        String targetFile=request.getServletContext().getRealPath("/upload/");
        String newFileName = FileUpLoadUtil.upload(picFile[i], targetFile);
//            newFileNames[i]=newFileName;
        book.setHead(newFileName);
}
        int add = bookService.add(book);
        if (add>0){
            return "redirect:query";
//            return "success";
        }
        return "error";
    }
//    删除书籍
    @RequestMapping("/del")
public String del(Integer id){
        int delete = bookService.delete(id);
        if (delete>0){
            return "redirect:query";
        }
        return "error";
    }
//    修改书籍
    @RequestMapping("/upd")
    public String upd(Book book){
        int update = bookService.update(book);
        if (update>0){
            return "redirect:query";
        }
        return "error";
    }
//    根据id查找
    @RequestMapping("/queryById")
    public String queryById(HttpServletRequest request,Integer id){
        List<Book> books = bookService.queryById(id);
        if (books.size()>0){

        request.setAttribute("books",books);
        }
        return "book_upd";
    }
}
