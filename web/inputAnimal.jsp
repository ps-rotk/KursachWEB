<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body bgcolor='#ffffff'>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<h1> Добавление нового животного </h1>
<form method='POST' action='animalView.jsp'>
    Имя: <input name="name"/>
    <br><br>
    Вид: <input name="kind"/>
    <br><br>
    Возраст: <input name="age"/>
    <br><br>
    <div style="padding: 5px;">
        <button type="submit" name="action" value="Add">Добавить</button>
        <button type="submit" >Назад</button>
    </div>
</form>
<jsp:include page="_footer.jsp"/>
</body>
</html>