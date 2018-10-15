<%--
  Created by IntelliJ IDEA.
  User: SatanPeas
  Date: 2017/11/12
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <title>我的世界</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
    <script src="<%=path%>/common/js/jquery-3.2.1.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/react/15.4.2/react.js"></script>
    <script src="https://cdn.bootcss.com/react/15.4.2/react-dom.js"></script>
    <script src="https://cdn.bootcss.com/babel-standalone/6.22.1/babel.js"></script>
    <script src="https://cdn.bootcss.com/fetch/2.0.3/fetch.js"></script>
    <script type="text/babel">
        /* 获取项目根路径 */
        function getRootPath(){
            //获取当前路径
            let curPath = window.document.location.href;
            //获取主机地址之后的目录
            let pathName = window.document.location.pathname;
            let pos = curPath.indexOf(pathName);
            //获取主机地址
            let localhostPath = curPath.substring(0,pos);
            //获取带"/"的项目名
            let projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);

            return (localhostPath + projectName);
        }
    </script>
</head>
</html>
