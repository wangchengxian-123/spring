<%--
  Created by IntelliJ IDEA.
  User: MrLang
  Date: 2020/3/26
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body>
    <form action="/user/login" method="post">
        <div>用户名<input type="text" name="userName"/></div>
        <div>密码<input type="text" name="password"/></div>
        <div><input type="submit" value="登录"/></div>
    </form>
</body>
</html>
