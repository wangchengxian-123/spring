package com.aaa.service;

import com.aaa.entity.Book;

import java.util.List;
import java.util.Map;

/**
 * @author WCX
 * @data 2020/3/14 15:32
 * @describe
 */
public interface BookService {
    //查询书籍
    List<Book> query();
//添加书籍
int add(Book book);
//删除书籍
int delete(Integer id);
//修改书籍
int update(Book book);
//根据id查找
    List<Book>queryById(Integer id);
//    事务
    void textTrans(List<Book> books) throws Exception;
}
