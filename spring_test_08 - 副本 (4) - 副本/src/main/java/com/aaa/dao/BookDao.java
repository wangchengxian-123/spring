package com.aaa.dao;

import com.aaa.entity.Book;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @author WCX
 * @data 2020/3/17 10:06
 * @describe
 */
public interface BookDao {
//    查询书籍
    @Select("select * from book")
List<Book> query();
//    添加书籍
    @Insert("insert into book (title,author,price,pub,head) values(#{title},#{author},#{price},#{pub},#{head})")
    int add(Book book);
//    删除书籍
    @Delete("delete from book where id=#{id}")
    int delete(Integer id);
//    修改书籍
    @Update("update book set title=#{title},author=#{author},price=#{price},pub=#{pub} where id=#{id}")
    int update(Book book);
//    根据id查找
    @Select("select * from book where id=#{id}")
    List<Book>queryById(Integer id);
}
