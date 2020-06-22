package com.aaa.controller;

import com.aaa.entity.Book;
import com.aaa.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author WCX
 * @data 2020/3/19 10:10
 * @describe
 */

@RestController
@RequestMapping("/bookJson")
public class BookJsonController {
    @Autowired
    private BookService bookService;
    //    查询全部
    @RequestMapping("/query")

    public List<Book> query(){
        List<Book> query = bookService.query();
        return query;
    }
//    添加
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public int add(Book book,Integer id){
        int add=0;
        if (id==null){
        add = bookService.add(book);
        return add;
        }else {
            add=bookService.update(book);
        }
        return add;
    }
    //    根据id查找
    @RequestMapping("/queryById")
    public List<Book> queryById(Integer id){
         List<Book> books = bookService.queryById(id);
        return books;
    }
//    删除书籍
    @RequestMapping("/del")
    public int delById(Integer id){
        int delete = bookService.delete(id);
        return delete;
    }
//    事务练习
    @RequestMapping("/shi")
    public void shi()throws Exception{
        List<Book>bookList= bookService.query();
        bookService.textTrans(bookList);
    }
}
