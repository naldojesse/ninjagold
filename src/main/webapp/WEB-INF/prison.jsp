<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<h1>Gold is too low, you've been sent to debtors prison!</h1>
<h1>Your Gold: <div><c:out value="${sessionScope.user_gold}"/></div></h1>

<h1>Activities:</h1>
<div>
    <c:forEach items="${sessionScope.log}" var="log_event">
        <p><c:out value="${log_event.place}"/> -
            <c:out value="${log_event.gold_result}"/> -
            <c:out value="${log_event.timestamp}"/></p>
    </c:forEach>
</div>

</body>
</html>