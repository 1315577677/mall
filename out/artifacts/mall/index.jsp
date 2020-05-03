<%--
  Created by IntelliJ IDEA.
  User: zhangxiang
  Date: 2020-03-12
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<html>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="description" content="">
  <meta name="author" content="">
  <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=basePath%>css/dashboard.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Abao</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse" >
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<%=basePath%>logout.action">退出登陆</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3 col-md-2 sidebar">
      <ul class="nav nav-sidebar">
        <li ><a href="<%=basePath%>getPageInfo.action" >商品管理</a></li>
        <li>
          <a data-toggle="collapse" data-target="#demo1" id="mess" href="#">订单管理</a>
          <ul class="nav nav-stacked collapse" id="demo1">
            <li role="presentation"><a href="<%=basePath%>getOrderInfo.action?stutas=1" style="padding-left: 50px">待发订单&nbsp;&nbsp;<span class="badge" id="ordernum" ></span></a></li>
            <li role="presentation"><a href="<%=basePath%>getOrderInfo.action?stutas=2" style="padding-left: 50px">退货订单&nbsp;&nbsp;<span class="badge" id="outordernum"></span></a></li>
            <li role="presentation"><a href="<%=basePath%>getOrderInfo.action?stutas=3" style="padding-left: 50px">历史订单</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav nav-sidebar" style="padding-top: 50px">
        <li><a href="#">账户信息维护</a></li>
      </ul>
    </div>
    </div>
  </div>
</div>
<script>
  $(document).ready(function () {
    $("#mess").click(function () {
      $.ajax({
        type: 'get',
        url: '<%=basePath%>getCountByStutas.action',
        success: function (data) {
          var ordernum = document.getElementById("ordernum")
          var outordernum =document.getElementById("outordernum")
          if(data.ordernum>0){
            ordernum.innerHTML=data.ordernum
          }
          if(data.outordernum>0){
            outordernum.innerHTML=data.outordernum
          }
        }
      })
    })
  })
</script>
</body>
</html>
