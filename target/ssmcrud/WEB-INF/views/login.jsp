<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/2
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("path", request.getContextPath()); %>
<html>
<head>
    <title>登录</title>
    <!--引入jquery-->
    <script type="text/javascript" src="static/js/jquery-3.4.1.min.js"></script>

    <!--引入bootstrap样式-->
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <style>
        #div1{
            height: 100%;
            width: 100%;
            background: url("${path}/static/picture/bgpic.jpg") no-repeat 4px 5px;
            overflow: hidden;
            background-size:cover;
        }

        .mycenter
        {
            margin-top: 100px;
            margin-left: auto;
            margin-right: auto;
            height: 350px;
            width: 500px;
            padding-top: 40px;
            padding-left: 30px;
            background-color: whitesmoke;
        }
        .mysign
        {
            width: 440px;
            text-align: center;
        }
        .mycenter input,button
        {
            margin-top: 2%;
            margin-left: 10%;
            margin-right: 10%;
        }

    </style>
</head>
<body>
    <div id="div1">
        <form id="from">
            <div class="mycenter">
                <div class="mysign">
                    <div class="col-lg-11 text-center text-info">
                        <h2>&nbsp;FSW-SSM-CRUD</h2>
                    </div>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" name="userName" placeholder="请输入账户" autocomplete="off"/>
                    </div>
                    <div class="col-lg-10">
                    </div>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" name="userPassword" placeholder="请输入密码"/>
                    </div>

                    <div class="col-lg-10">
                        <button type="button" id="btn-log" class="btn btn-success col-lg-12">登录</button>
                    </div>
                    <div class="col-lg-10">
                        <button type="button" id="btn-reg" class="btn btn-info col-lg-12">注册</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script type="text/javascript">

        $('#btn-log').click(function(){

            $.ajax({
                url:"${path}/userSelect",
                data:$("#div1 form").serialize(),
                type:"POST",
                //result是请求返回的结果
                success:function(result){
                    if(result.code==100){
                        window.location.href = 'employee.jsp';
                    }else{
                        alert("用户名或密码错误，请重试！！");
                        window.location.href = 'index.jsp';
                    }
                }
            });
        });

        $('#btn-reg').click(function(){

            $.ajax({
                url:"${path}/userInsert",
                data:$("#div1 form").serialize(),
                type:"POST",
                //result是请求返回的结果
                success:function(result){
                    if(result.code==100){
                        alert("注册成功，请登录！！");
                        window.location.href = 'index.jsp';
                    }else{
                        alert("注册失败，请重试！！");
                        window.location.href = 'index.jsp';
                    }
                }
            });
        });


    </script>


</body>
</html>
