<%--
  Created by IntelliJ IDEA.
  User: 86151
  Date: 2020/3/17
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>欢迎页面</p>
<a href="/book/query">查询书籍</a>
<a href="/book_add.jsp">添加书籍</a>
<a href="/book_del.jsp">删除书籍</a>
<a href="/book_upd.jsp">修改书籍</a>

<div>
    <a href="json_test.jsp">json测试</a>

</div>

<hr/>
shiro标签验证测试：
<br/>

<shiro:authenticated>
    如果看到该内容，说明用户已经认证过
    <a href="/logout">注销</a>
</shiro:authenticated>

<shiro:hasRole name="经理">
    <h2>我是经理</h2>
</shiro:hasRole>

<shiro:hasRole name="董事长">
    <h2>我是懂事长</h2>
</shiro:hasRole>


</body>
<script src="js/jquery-1.8.3.min.js"></script>
<script>
    function loadList(){
        $.ajax({
            url:"/bookJson/query",
            type:"post",
            dataType:"json",
            success:function (res) {
                for (var i = 0; i < res.length; i++) {
                    var tr = $("<tr></tr>");
                    var td1 = $("<td></td>");
                    var td2 = $("<td></td>");
                    var td3 = $("<td></td>");
                    var td4 = $("<td></td>");
                    var td5 = $("<td></td>");
                    var td6 = $("<td></td>");
                    td1.append(res[i].id);
                    td2.append(res[i].title);
                    td3.append(res[i].author);
                    td4.append(res[i].price);
                    td5.append(res[i].pub);
                    td6.append("<a href='/bookJson/queryById?id=res[i].id'>修改</a>");
                    tr.append(td1, td2, td3, td4, td5,td6);
                    $("#tbody").append(tr);
                }
            }

        })
    }
    function formList(){
        var tab=$("<table border='1'></table>");
        var tr1=$("<tr><td>id</td><td><input type='text' id='id'></td></tr>");
        var tr2=$("<tr><td>书名</td><td><input type='text' id='title'></td></tr>");
        var tr3=$("<tr><td>作者</td><td><input type='text' id='author'></td></tr>");
        var tr4=$("<tr><td>价格</td><td><input type='text' id='price'></td></tr>");
        var tr5=$("<tr><td>出版地</td><td><input type='text' id='pub'></td></tr>");
        tab.append(tr1,tr2,tr3,tr4,tr5);
        $("#biao").append(tab);
    }
    $(function () {
       $("#btn").click(function () {
formList();
        loadList();

       })
    })
</script>
</html>
