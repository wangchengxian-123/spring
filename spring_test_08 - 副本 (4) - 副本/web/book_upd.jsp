<%--
  Created by IntelliJ IDEA.
  User: 86151
  Date: 2020/3/18
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/book/upd">
<c:forEach items="${books}" var="item">



    id:<input type="text" name="id" value="${item.id}" readonly="readonly"></br>
    书名:<input type="text" name="title" value="${item.title}"></br>
    作者:<input type="text" name="author" value="${item.author}"></br>
    价格:<input type="text" name="price" value="${item.price}"></br>
    出版地:<input type="text" name="pub" value="${item.pub}"></br>
</c:forEach>
    <input type="submit" value="修改">
</form>
</body>
</html>
