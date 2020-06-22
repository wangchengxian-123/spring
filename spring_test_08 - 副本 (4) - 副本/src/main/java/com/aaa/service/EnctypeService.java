package com.aaa.service;

import org.apache.shiro.crypto.hash.SimpleHash;

public class EnctypeService {

    public static void main(String[] args) {

//        SimpleHash simpleHash=new SimpleHash("算法名称","原始密码","盐值","迭代次数");
        SimpleHash simpleHash=new SimpleHash("MD5","123456","123",1024);
        System.out.println(simpleHash.toString());
    }
}
