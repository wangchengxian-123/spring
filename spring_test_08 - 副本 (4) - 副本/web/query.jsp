<%--
  Created by IntelliJ IDEA.
  User: 86151
  Date: 2020/3/17
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/select">
    <input type="submit" value="查找">

<c:forEach items="${query}" var="item">
${item.id}
    ${item.title}
    ${item.author}
    ${item.price}
    ${item.pub}
</c:forEach>
</form>
</body>
</html>
