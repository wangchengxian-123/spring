<%--
  Created by IntelliJ IDEA.
  User: 86151
  Date: 2020/3/18
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
    <tr>
    <th>id</th>
    <th>书名</th>
    <th>作者</th>
    <th>价格</th>
    <th>出版地</th>
        <th>头像</th>
    <th>操作</th>
</tr>
    <c:forEach items="${list}" var="item">
        <tr>
            <td> ${item.id}</td>
            <td> ${item.title}</td>
            <td> ${item.author}</td>
            <td> ${item.price}</td>
            <td> ${item.pub}</td>
            <td><img src="/upload/${item.head}"></td>
            <td><a href="/book/queryById?id=${item.id}">修改</a></td>
        </tr>
    </c:forEach>
</table>
<a href="/logout">注销</a>
</body>
</html>
