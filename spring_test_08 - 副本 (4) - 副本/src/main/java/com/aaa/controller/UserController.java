package com.aaa.controller;

import com.aaa.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @PostMapping("/")
    public User reg(User user) {
        return user;
    }

    @PutMapping
    public User update(@RequestBody User user) {
        System.out.println("修改"+user);
        return new User().setId(1).setUserName("abc");
    }


    @GetMapping
    public User query() {
        return new User().setUserName("张三");
    }

    @GetMapping("/{id}")//{id}:参数占位符，代表该位置存储的是ID的
    public User query2(@PathVariable("id") Integer id) {
        return new User().setUserName("李四").setId(id);
    }

    @DeleteMapping("/{id}")//{id}:参数占位符，代表该位置存储的是ID的
    public User delete(@PathVariable("id") Integer id) {
        return new User().setUserName("李四").setId(id);
    }


    @PostMapping("/login")
    public String login(User user) {
        //获取Subject
        Subject currentUser= SecurityUtils.getSubject();
        if (!currentUser.isAuthenticated()) {
            //用户名密码的令牌信息
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getPassword());
            //记住我
            token.setRememberMe(true);
            try {
                //调用登录方法：将token ------------->委托给安全管理器进行认证--------------------->进入认证器，调用Realm获取用户信息进行匹配
                currentUser.login(token);
                return "success";
            } catch (UnknownAccountException uae) { //账号不存在
                throw new UnknownAccountException("账号不存在");
            } catch (IncorrectCredentialsException ice) {//密码不匹配
                throw new IncorrectCredentialsException("密码不匹配");
            } catch (LockedAccountException lae) {//账户锁定
                throw new LockedAccountException("账户锁定异常");
            }
            catch (AuthenticationException ae) { //认证异常
                throw new AuthenticationException("认证异常");
            }
        }
        return "error";
    }
}
