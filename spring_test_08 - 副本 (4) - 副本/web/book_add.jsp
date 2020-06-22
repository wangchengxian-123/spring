<%--
  Created by IntelliJ IDEA.
  User: 86151
  Date: 2020/3/18
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/book/add" enctype="multipart/form-data" id="bookForm">
    id:<input type="text" name="id"></br>
    书名:<input type="text" name="title"></br>
    作者:<input type="text" name="author"></br>
    价格:<input type="text" name="price"></br>
    出版地:<input type="text" name="pub"></br>
    头像:<input type="file" name="pic">
    <input type="submit" value="添加">
    <input type="button" onclick="handlerSubmit()" value="异步提交">

</form>
</body>
<script src="js/jquery-1.8.3.min.js"></script>
<script>
    function handlerSubmit() {
        alert(123);
        var form = new FormData(document.getElementById("bookForm"));
        $.ajax({
            url:"/book/add",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                alert("ok");
            },
            error:function(e){
                alert("错误！！");
            }
        });

    }
</script>
</html>
