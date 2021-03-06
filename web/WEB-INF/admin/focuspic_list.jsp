<%@ page import="java.util.List" %>
<%@ page import="com.hq.bean.Focuspic" %><%--
  @author zth
  @create  2019-05-09 16:35
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="header.jsp"%>

    <title>焦点广告管理</title>
    <style>
        .file {
            position: relative;
            display: inline-block;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }
        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }
        .file:hover {
            background: #AADFFD;
            border-color: #78C3F3;
            color: #004974;
            text-decoration: none;
        }
    </style>

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>焦点广告 <small>焦点广告图片</small></h5>
                </div>
                <div class="ibox-content">
                    <h2>上传焦点广告<br></h2>

                    <form class="form-inline" method="post" enctype="multipart/form-data" action="admin/focuspic?action=uploadPic" >
                        <div class="form-group">
                            <input type="text" class="form-control" maxlength="45" name="dis" placeholder="焦点图描述">
                        </div>
                        <div class="form-group">
                            <select name="level" class="form-control">
                                <%
                                    for (int i = 9; i >0 ; i--) {
                                        %>
                                <option value="<%=i%>"><%=i%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">

                                <input type="text" class="form-control" placeholder="请选择上传图片" readonly id="fileName">
                        </div>
                        <div class="form-group " >
                            <div class="form-control"  style="padding: 0px">
                                <a href="javascript:;" class="file " style="width: 100%" >选择图片
                                    <input type="file"  onchange="document.getElementById('fileName').value=this.value"  name="pic">
                                </a>
                            </div>

                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control" name="link" placeholder="外链">
                        </div>
                        <div class="form-control " style="padding: 0px;margin: 0px">
                            <button type="submit" class="btn btn-info" >增加焦点图</button>
                        </div>
                    </form>

                    <div style="margin-top: 20px">
                        <%
                            List<Focuspic> flist = (List<Focuspic>)request.getAttribute("flist");
                            if (null != flist && flist.size()>0){
                                for (Focuspic focuspic:flist) {
                        %>
                                <div style="display: inline-block;padding-top: 10px;padding-right: 20px " >
                                    <img class="img-rounded" style="width: 230px ;" src="<%=focuspic.getPath()%> ">

                                    <div style="background: #E8E8E8; ">
                                        <p style="padding: 10px 0px 0px 10px;display: inline-block; "><%=focuspic.getDis()%></p>
                                        <a style="margin-top: 10px" href="admin/focuspic?action=delFocusPic&id=<%=focuspic.getId()%>" class="btn btn-xs btn-danger pull-right">删除</a>
                                    </div>
                                </div>
                        <%
                                }
                            }
                        %>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="booter.jsp"%>
</body>
</html>
