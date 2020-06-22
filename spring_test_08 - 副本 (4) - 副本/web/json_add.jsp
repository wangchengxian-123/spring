<%--
  Created by IntelliJ IDEA.
  User: 86151
  Date: 2020/3/19
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form>
    id:<input type="text" id="id" ></br>
    书名:<input type="text" id="title" ></br>
    作者:<input type="text" id="author" ></br>
    价格:<input type="text" id="price" ></br>
    出版地:<input type="text" id="pub" ></br>
    <input type="button" id="btn" value="添加">
</form>
</body>
<script src="js/jquery-1.8.3.min.js"></script>
<script>
    $(function () {
        $("#btn").click(function () {

            $.ajax({
                url:"/bookJson/add",
                type:"post",
                data:{
                    "id":$("#id").val(),
                    "title":$("#title").val(),
                    "author":$("#author").val(),
                    "price":$("#price").val(),
                    "pub":$("#pub").val(),
                },
                dataType:"json",
                success:function (res) {

                }
            })
        })
    })
</script>
</html>
