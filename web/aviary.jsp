<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Вольеры</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        td, th {
            padding: 4px;
            border: 1px solid #000080;
        }

        th {
            background: #000080;
            color: #ffe;
            text-align: left;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<%@page import="com.zoo.DAO" %>
<%@page import="com.zoo.Aviary" %>
<jsp:useBean id="listAviary" class="java.util.ArrayList" scope="application"/>
<%
    request.setCharacterEncoding("UTF-8");
%>
<form id="checkedForm" action="aviary.jsp" method="post">
    <%
        DAO dao = new DAO();
        request.setCharacterEncoding("UTF-8");
        listAviary = dao.getAllFeeds();
        if (request.getParameter("action") != null) {
            if (request.getParameter("idAviary") != null) {
                if (request.getParameter("idAviary").equals("")) {
                    String title = request.getParameter("title");
                    int size = Integer.parseInt(request.getParameter("size"));
                    dao.addAviary(new Aviary(title, size));
                }
            }
        } else {
            for (int i = 0; i < listAviary.size(); i++) {
                if (request.getParameter("checkBox" + i) != null) {
                    dao.deleteFeed(Integer.parseInt(request.getParameter("checkBox" + i)));
                }
            }
        }
        listAviary = dao.getAllAnimals();
    %>
    <div style="padding: 5px;">
        <button type="button" name="action" onclick="location.href ='inputAviary.jsp'" value="Add">Добавить новый вольер
        </button>
        <button type="submit" name="action" value="Delete">Удалить</button>
    </div>
</form>
<%
    out.print("<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\"><html>");
    out.print("<body>");
    out.print("<table id=\"centerPlacement\" border=\"1\"><tbody>");
    out.print("<tr><th></th><th>Название</th><th>Вес</th>");
    for(int i=0; i<listAviary.size();i++) {
        Object o=listAviary.get(i);
        Aviary aviary =(Aviary) o; //TODO: вывод ниже пофиксь пж
       /* out.print("<tr><td><input form=\"checkedForm\" type=\"checkBox\" name=\"checkBox"+i+
                "\" value=\""+animal.getIdFeed()+
                "\" >"+"</td><td>"+animal.getTitle()
                +"</td><td>"+animal.getCount()+
                "</td><td> <form action=\"inputFeed.jsp\" method=\"post\"><button type=\"submit\" name=\"action\" value=\""
                +animal.getIdFeed()+
                "\">Edit</button></form>"
                + "<form action=\"FeedInfo.jsp\" method=\"post\"><button type=\"submit\" name=\"action\" value=\""
                + animal.getIdFeed()+"\">Info</button></form>"
        );*/
    }
    out.print("</tbody></table></body>");
    out.print("</html>");
%>
<jsp:include page="_footer.jsp"/>
</body>
</html>

