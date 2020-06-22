<%--
  Created by IntelliJ IDEA.
  User: 86151
  Date: 2020/3/19
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <form enctype="multipart/form-data" id="bookForm">
    <table border="1">
        <tr>
            <td>id</td>
            <td><input type="text" id="id"></td>
        </tr>
        <tr>
            <td>书名</td>
            <td><input type="text" id="title"></td>
        </tr>
        <tr>
            <td>作者</td>
            <td><input type="text" id="author"></td>
        </tr>
        <tr>
            <td>价格</td>
            <td><input type="text" id="price"></td>
        </tr>
        <tr>
            <td>出版地</td>
            <td><input type="text" id="pub"></td>
        </tr>
        <tr>
            <td>头像</td>
            <td><input type="file" id="head"></td>
        </tr>
    </table>
    <input type="button" id="que" value="确认">
    <input type="button" onclick="shi()" value="事务测试">
    </form>
</div>
<div>
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
        <tbody id="tbody"></tbody>
    </table>
</div>
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
                    var td6 = $("<td><img src='/upload/"+res[i].head+"'></td>");
                    var td7=$("<td></td>");
                    td1.append(res[i].id);
                    td2.append(res[i].title);
                    td3.append(res[i].author);
                    td4.append(res[i].price);
                    td5.append(res[i].pub);

                    td7.append("<input type='button' onclick='bindForm("+res[i].id+")' value='修改'><input type='button' onclick='delForm("+res[i].id+")' value='删除'>");
                    tr.append(td1, td2, td3, td4, td5,td6,td7);
                    $("#tbody").append(tr);
                }
            },
            function:bindForm=function (bookList) {
                $.ajax({
                    url:"/bookJson/queryById?id="+bookList,
                    type:"post",
                    dataType:"json",
                    success:function (data) {
                        $("#id").val(data[0].id);
                        $("#title").val(data[0].title);
                        $("#author").val(data[0].author);
                        $("#price").val(data[0].price);
                        $("#pub").val(data[0].pub);
                    }
                })
}
        })
    }

    $(function () {
            loadList();
        $("#que").click(function () {
            // $.ajax({
            //
            //     url:"/book/add",
            //     type:"post",
            //     data:{
            //         "id":$("#id").val(),
            //         "title":$("#title").val(),
            //         "author":$("#author").val(),
            //         "price":$("#price").val(),
            //         "pub":$("#pub").val(),
            //         "head":$("#head").val
            //
            //     },
            //     dataType:"json",
            //     success:function () {
            //
            //         window.location.reload();
            //     }
            // })
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


        })
    })
function delForm(shan) {
    $.ajax({
        type:"post",
        url:"/bookJson/del?id="+shan,
        dataType:"json",
        success:function () {
            window.location.reload();
        }
    })
}
function shi() {

    $.ajax({
        type:"post",
        url:"/bookJson/shi",
        dataType:"json",
        success:function () {
            alert("成功");
            window.location.reload()
        }
    })
}

</script>
</html>
