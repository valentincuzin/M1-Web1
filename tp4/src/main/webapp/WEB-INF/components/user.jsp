<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>User</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
<c:set var="user" value="${requestScope.model}" scope="request"/>

<h1>Utilisateur ${user.login}</h1>
<ul>
    <li>Login : <a href="${pageContext.request.contextPath}/users/${user.hashCode()}/login">${user.login}</a></li>
    <li>Nom : <a href="${pageContext.request.contextPath}/users/${user.hashCode()}/name">${user.name}</a></li>
    <c:if test="${requestScope.authorizedUser}">
    <li>
        Todos:
        <ul>
            <c:forEach items="${user.assignedTodos}" var="todoHash">
                <li><a href="${pageContext.request.contextPath}/todos/${todoHash}">${applicationScope.todoDao.findByHash(todoHash).title}</a></li>
            </c:forEach>
        </ul>
    </li>
    </c:if>
</ul>
</body>
</html>
