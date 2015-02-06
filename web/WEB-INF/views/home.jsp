<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<html>
  <head>
    <title>Just a simple WeiBo</title>
      <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
      <script type="text/javascript" src="/resources/js/jquery-2.1.3.min.js"></script>
      <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
  </head>
  <body>
    <h1 class="text-center">Just a Simple WeiBo</h1>
    <hr/>

            <p class="text-center">欢迎,<s:authentication property="name"/><a href="/logout"><button class="btn btn-default btn-primary">登出</button></a></p>

    <h2 class="text-center">微博列表:</h2>

    <ul class="text-center">
        <c:forEach var="weibo" items="${weibos}">
            <li style="list-style: none">
                <c:out value="${weibo.name}"/>说：  <c:out value="${weibo.content}"/>
                <c:if test="${weibo.name == username}">
                    <form action="/delete" method="post" style="display: inline">
                        <input type="text" name="idForDelete" value="${weibo.id}" class="hidden"/>
                        <button class="btn btn-danger" type="submit">删除</button>
                    </form>
                </c:if>
            </li>
            <br/>
        </c:forEach>
    </ul>

        <div class="container">
            <form action="/say" method="post" class="form-horizontal col-md-5 col-md-offset-4">
                <input type="text" name="userOfWeibo" class="hidden" value="<s:authentication property="name"/>">
                <p><s:authentication property="name"/>说：<input type="text" name="contentOfWeibo" class="form-control" placeholder="说点什么..."/><button type="submit" class="btn btn-primary">发送</button></p>
            </form>
        </div>

  </body>
</html>
