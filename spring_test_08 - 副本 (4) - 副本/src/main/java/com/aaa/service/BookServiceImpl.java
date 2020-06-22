package com.aaa.service;

import com.aaa.dao.BookDao;
import com.aaa.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;
import java.util.List;

/**
 * @author WCX
 * @data 2020/3/18 9:40
 * @describe
 */
@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;
    @Override
    public List<Book> query() {
        return bookDao.query();
    }

    @Override
    public int add(Book book) {
        return bookDao.add(book);
    }

    @Override
    public int delete(Integer id) {
        return bookDao.delete(id);
    }

    @Override
    public int update(Book book) {
        return bookDao.update(book);
    }

    @Override
    public List<Book> queryById(Integer id) {
        return bookDao.queryById(id);
    }
@Transactional
    @Override
    public void textTrans(List<Book> books) throws Exception{
        bookDao.add(books.get(0));
    System.out.println(1/0);
        bookDao.add(books.get(1));

    }
}
