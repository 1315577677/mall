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
    <!-- Custom Theme JavaScript -->
    <script>
var pictureList;

function show() {
    var html='';
    for (var i=0;i<pictureList.length;i++){
        html=html+
            "                            <div class=\"col-lg-3\">\n" +
            "                                <img class=\"img-square\" src=\"<%=imgPath%>"+pictureList[i]+"\">\n" +
            "                                <input type=\"checkbox\" class=\"checkbox\" name=\"pictureList\" value=\""+pictureList[i]+"\">\n" +
            "                            </div>\n"

    }
    document.getElementById("showpicture").innerHTML=html;
    }


        function editProduct( id) {
            $.ajax({
                type:"get",
                url:"<%=basePath%>editpage.action?d=new Date().getTime() ",
                data:{"id":id},
                success:function(data) {
                    pictureList=data.pictureList;
                    $("#edit_custLevel").val(data.described)
                    $("#edit_linkMan").val(data.name);
                    $("#edit_phone").val(data.price);
                    $("#edit_mobile").val(data.size);
                    $("#customerFrom1").val(data.category);
                    $("#product_ID").val(id);
                    $("#edit_address").val(data.inventory);show();
                }
            });

        }
        function deleteCustomer() {
            var str = "";
            $("[name='ids']:checked").each(function () {
                str += $(this).val() + ",";
            })

            if(confirm('确实要下架这些商品吗?')) {
                $.ajax({
                    type: 'POST',
                    url: "<%=basePath%>deleteProductByids.action",
                    data: {"str":str},
                    success: function(data){
                            alert("下架成功！");
                            window.location.reload();
                    },
                     });
                }
        }
    </script>

</head>
<body>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

<div class="row">
    <div class="col-lg-12">
        <div class="col-lg-12">
            <h1 class="page-header">商品管理</h1>
        </div>
        <div class="panel-body">
            <form class="form-inline"  action="${pageContext.request.contextPath }/getPageInfo.action" method="get">
                <div class="form-group">
                    <label for="customerName">商品名称</label>
                    <input type="text" class="form-control" id="customerName" value="${custName }" name="custName">
                </div>
                <div class="form-group">
                    <label for="customerFrom">商品种类</label>
                    <select	class="form-control" id="customerFrom" placeholder="商品种类" name="custSource">
                        <option value="">--请选择--</option>
                        <c:forEach items="${fromType}" var="item">
                            <option value="${item.id}"<c:if test="${item.id == custSource}"> selected</c:if>>${item.category }</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">查询</button>
                <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">添加商品</button>
            </form>
        </div>
        <div class="container">
            <div id="demo" class="collapse">
                        <div  class="form-horizontal">

                                   <jsp:include page="photoUp.html"/>

                                    <div class="row" >
                                        <div class="form-group">
                                            <label for="edit_linkMan" class="col-sm-2 control-label">商品名</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control"  id="name" placeholder="商品名" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="edit_phone" class="col-sm-2 control-label">价格</label>
                                            <div class="col-sm-10">
                                                <input type="number" class="form-control" id="price"  placeholder="价格">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="edit_mobile" class="col-sm-2 control-label">尺寸</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="size" placeholder="尺寸">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="customerFrom1" class="col-sm-2 control-label">商品种类</label>
                                            <div class="col-sm-10">
                                                <select	class="form-control"  placeholder="商品种类" id="categoryid">
                                                    <option value="">--请选择--</option>
                                                    <c:forEach items="${fromType}" var="item">
                                                        <option name="categoryid" value="${item.id}"<c:if test="${item.id == custSource}"> selected</c:if>>${item.category }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="edit_address" class="col-sm-2 control-label">库存</label>
                                        <div class="col-sm-10">
                                            <input type="number" class="form-control" id="inventory" placeholder="库存" >
                                        </div>
                                    </div>
                                    </div>
                                    <div class="row">
                                        <textarea   class="form-control" id="described" rows="5"></textarea>
                                    </div>
                                    <a href="#" id="btn" class="btn btn-primary pull-right"  data-dismiss="modal">提交</a>
                        </div>
            </div>
    </div>


        <script>

            $(document).ready(
                function(){
                    $("#btn").click(function () {
                        formData2.set("name", $("#name").val());
                        formData2.set("size", $("#size").val());
                        formData2.set("price",$("#price").val());
                        formData2.set("described",$("#described").val());
                        formData2.set("inventory", $("#inventory").val());
                        formData2.set("categoryid", $("#categoryid").val());
                        $.ajax({
                            type: 'post',
                            data: formData2,
                            dataType: "text",
                            cache: false,
                            url: '<%=basePath%>addProductInfo.action',
                            processData: false,
                            contentType: false,
                            success: function (data) {
                                alert(data);
                                window.location.reload();
                            }
                        })

                    })
                }
            );

        </script>

        <div class="panel panel-default">
            <div class="panel-heading">商品信息列表</div>
            <!-- /.panel-heading -->
            <table class="table table-bordered table-striped">
                <thead>
                <tr><th>选择</th>
                    <th>商品编号</th>
                    <th>名字</th>
                    <th>价格</th>
                    <th>描述</th>
                    <th>尺寸</th>
                    <th>种类</th>
                    <th>库存</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <form id="testform">
                    <c:forEach items="${page.rows}" var="row">
                        <tr>
                            <td><input value="${row.product_ID}" type="checkbox" name="ids"></td>
                            <td>${row.product_ID}</td>
                            <td>${row.name}</td>
                            <td>${row.price}</td>
                            <td>${row.described}</td>
                            <td>${row.size}</td>
                            <td>${row.category}</td>
                            <td>${row.inventory}</td>
                            <td>
                                <!-- 按钮触发模态框 -->
                                <a type="button"  class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editProduct('${row.product_ID}')">修改</a>
                            </td>
                        </tr>
                    </c:forEach>
                </form>
                </tbody>
            </table>
            <div class="text-right">
                <a href="#" class="btn btn-danger btn-primary pull-left pagination "  onclick="deleteCustomer()">&nbsp;&nbsp;下架</a>
                <itcast:page url="${pageContext.request.contextPath }/getPageInfo.action" />
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
</div>



<!-- 模态框（Modal） -->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 777px">
        <form action="<%=basePath%>updateProduct.action" id="edit_customer_form"  method="post" class="form-horizontal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改商品信息</h4>
            </div>
            <div class="modal-body">
                    <div id="showpicture" class="row" ></div>
                   <jsp:include page="photoUp.html"/>
                <a class="btn btn-info" id="bbt">确认上传</a>
                    <div class="row" >
                        <div class="form-group">
                            <label for="edit_linkMan" class="col-sm-2 control-label">商品名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_linkMan" name="name" placeholder="商品名" name="cust_linkman">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_phone" class="col-sm-2 control-label">价格</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="price" id="edit_phone" placeholder="价格" name="cust_phone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_mobile" class="col-sm-2 control-label">尺寸</label>
                            <div class="col-sm-10">
                                <input hidden id="product_ID" name="product_ID"/>
                                <input type="text" class="form-control" name="size"id="edit_mobile" placeholder="尺寸" name="cust_mobile">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="customerFrom1" class="col-sm-2 control-label">商品种类</label>
                            <div class="col-sm-10">
                                <select	class="form-control" id="customerFrom1" placeholder="商品种类" name="categoryid">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${fromType}" var="item">
                                        <option name="categoryid" value="${item.id}"<c:if test="${item.id == custSource}"> selected</c:if>>${item.category }</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="edit_address" class="col-sm-2 control-label">库存</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" name="inventory"id="edit_address" placeholder="库存" name="cust_address">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <textarea  id="edit_custLevel" class="form-control" name="described" rows="5"></textarea>
                    </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn  btn-default" data-dismiss="modal">关闭</button>
                <a class="btn btn-primary" onclick="updateCustomer()" data-dismiss="modal">提交更改</a>
            </div>
        </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>

<script src="../js/jquery.min.js"></script>
<script src="../js/jquery.dataTables.min.js"></script>
<script>
    //图片上传预览功能
    function updateCustomer() {
        $.post("<%=basePath%>updateProduct.action",$("#edit_customer_form").serialize(),function(data){
            alert(data);
                window.location.reload();
        });
    }
    var userAgent = navigator.userAgent; //用于判断浏览器类型
    //使用formData完成多图片上传
    var formData = new FormData();
    var formData2 = new FormData();
    $(".file").change(function() {
        //获取选择图片的对象
        var docObj = $(this)[0];
        var picDiv = $(this).parents(".picDiv");
        //得到所有的图片文件
        var fileList = docObj.files;
        //将图片数据放到formData中传递后台
        if($(this)[0].files.length==1){
            formData.append("file",docObj.files[0]);
            formData2.append("file",docObj.files[0]);
        }else{
            for(var i=0; i<$(this)[0].files.length;i++){
                formData.append("file",$(this)[0].files[i]);
                formData2.append("file",$(this)[0].files[i]);
            }
        }
        //循环遍历
        for (var i = 0; i < fileList.length; i++) {
            //动态添加html元素
            var picHtml = "<div class='imageDiv col-lg-3' nm='"+fileList[i].name+"'> <img id='img" + fileList[i].name + "' /> <div class='cover'><i class='delbtn'>❌</i></div></div>";
            console.log(picHtml);
            picDiv.prepend(picHtml);
            //获取图片imgi的对象
            var imgObjPreview = document.getElementById("img" + fileList[i].name);
            if (fileList && fileList[i]) {
                //图片属性
                imgObjPreview.style.display = 'block';
                imgObjPreview.style.width = '160px';
                imgObjPreview.style.height = '130px';
                //imgObjPreview.src = docObj.files[0].getAsDataURL();
                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要以下方式
                if (userAgent.indexOf('MSIE') == -1) {
                    //IE以外浏览器
                    imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]); //获取上传图片文件的物理路径;
                    console.log(imgObjPreview.src);
                    // var msgHtml = '<input type="file" id="fileInput" multiple/>';
                } else {
                    //IE浏览器
                    if (docObj.value.indexOf(",") != -1) {
                        var srcArr = docObj.value.split(",");
                        imgObjPreview.src = srcArr[i];
                    } else {
                        imgObjPreview.src = docObj.value;
                    }
                }
            }
        }
        /*删除功能*/
        $(".delbtn").click(function() {
            if(formData.getAll("file").length==0){
                formData=formData2;
            }else{
                formData2.delete("file");
                for(var i=0;i<formData.getAll("file").length;i++){
                    if(formData.getAll("file")[i].name==$(this).parents(".imageDiv").attr("nm")){

                    }else{
                        formData2.append("file",formData.getAll("file")[i]);
                    }
                }
            }
            formData.delete("file");
            for(var i=0;i<formData2.getAll("file").length;i++){
                formData.append("file",formData2.getAll("file")[i]);
            }
            var _this = $(this);
            _this.parents(".imageDiv").remove();
        });
    });
    $("#bbt").click(function(){
       var id= document.getElementById("product_ID").value;
        formData2.set("id",id);
        $.ajax({
            type:'post',
            data:formData2,
            cache: false, //上传文件不需要缓存
            url:'<%=basePath%>uploadPhoto.action',
            processData: false, // 告诉jQuery不要去处理发送的数据
            contentType: false, // 告诉jQuery不要去设置Content-Type请求头
            success:function(data){
                    alert(data);
            }
        })
    })
</script>
</body>
</html>
