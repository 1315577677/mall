<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhangxiang
  Date: 2020-03-13
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String imgPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+"/img/";
%>
<html>
<head>
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
          type="text/css">
    <script src="<%=basePath%>js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=basePath%>js/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
    <script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
    <%@include file="../index.jsp"%>
</head>
<body>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class=" panel panel-default">
        <form id="update" class="form-inline"action="<%=basePath%>getOrderInfo.action">
            <input hidden name="stutas" value="3">
            <table class="table table-hover ">
                <td>
                    <label for="customerName">订单号</label>
                    <input type="text" class="form-control" id="customerName"  name="custName">
                    <button type="submit" class="btn btn-primary">查询</button>
                </td>
            </table>

            <table class="table text-detail">
                <thead>
                <tr>
                    <th>订单号</th>
                    <th>买家账户</th>
                    <th>商品名</th>
                    <th>商品价格</th>
                    <th>购买时间</th>
                    <th>详细地址</th>
                </tr>
                </thead>
                <tbody style="text-align: center">
                <c:forEach items="${page.rows}" var="row">
                    <tr >
                        <td>${row.ordernum}</td>
                        <td>${row.username}</td>
                        <td>${row.name}</td>
                        <td>${row.price}</td>
                        <td>${row.create_date}</td>
                        <td><button type="button" class="btn btn-info" data-toggle="collapse" data-target="#${row.ordernum}">展开</button></td>
                    </tr>
                    <tr id="${row.ordernum}" class="collapse">
                        <td colspan="7">${row.address}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="text-right">
                <itcast:page url="${pageContext.request.contextPath }/getOrderInfo.action?stutas=2" />
            </div>
        </form>
    </div>
</div>
</body>
</html>
