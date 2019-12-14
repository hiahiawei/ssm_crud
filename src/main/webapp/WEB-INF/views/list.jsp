<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/27
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>

<%--c:forEach遍历--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>

    <%--request.getContextPath():得到工程名--%>
    <% pageContext.setAttribute("path", request.getContextPath()); %>

    <%--web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准（http://localhost:3306）;需要加上项目名称
                http://localhost:3306/ssm_crud
    --%>
    <!--引入jquery path=/ssm_crud-->
    <script type="text/javascript" src="${path}/static/js/jquery-3.4.1.min.js"></script>

    <!--引入bootstrap样式-->
    <link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>

    <%--搭建显示页面,基于bootstrap的分页模式--%>
    <div class="container">
        <!-- 标题 -->
        <div class="row">
            <div class="col-md-12">
                <h1>FSW-SSM-CRUD</h1>
            </div>
        </div>
        <!-- 按钮 -->
        <div class="row">
            <div class="col-md-4 col-md-offset-10">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <!-- 显示数据 -->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#Id</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>departmentName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.empGender=="M"?"男":"女"}</th>
                            <th>${emp.email }</th>
                            <th>${emp.department.deptName }</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑</button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除</button></button>
                            </th>
                        </tr>

                    </c:forEach>

                </table>
            </div>

        </div>
        <!-- 显示分页信息 -->
        <div class="row">
            <!-- 分页文字信息 -->
            <div class="col-md-6">
                当前${pageInfo.pageNum },总${pageInfo.pages }页,总${pageInfo.total }条记录
            </div>
            <!-- 分页条信息 直接搞组件，填数据就行 -->
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${path}/emps?pn=1">首页</a></li>
                        <%--pageInfo.hasPreviousPage：是否有上一页--%>
                        <c:if test="${pageInfo.hasPreviousPage }">
                            <li>
                                <a href="${path }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
                                    <%--向左的《--%>
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <%--navigate：导航的意思--%>
                        <c:forEach items="${pageInfo.navigatepageNums }" var="PageNum">
                            <c:if test="${PageNum==pageInfo.pageNum }">
                                <li class="active"><a href="#">${PageNum }</a></li>
                            </c:if>
                            <c:if test="${PageNum!=pageInfo.pageNum }">
                                <li ><a href="${path }/emps?pn=${PageNum }">${PageNum }</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${pageInfo.hasNextPage }">

                            <li>
                                <a href="${path }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="${path}/emps?pn=${pageInfo.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>


</body>
</html>
