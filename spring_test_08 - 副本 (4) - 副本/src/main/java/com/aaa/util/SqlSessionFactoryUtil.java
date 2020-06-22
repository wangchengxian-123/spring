package com.aaa.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

/**
 * @author WCX
 * @data 2020/2/16 13:26
 * @describe
 */
public class SqlSessionFactoryUtil {
    private static SqlSessionFactory sessionFactory;

    static {
        Reader reader=null;
        try {
            reader = Resources.getResourceAsReader("mybatis.xml");
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static SqlSession getSession(){
        return sessionFactory.openSession();
    }
}
