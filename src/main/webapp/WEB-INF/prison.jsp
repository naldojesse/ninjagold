<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <link rel="stylesheet" href="/css/prison.css">
</head>
<body>
<div id="container">


<div id="header">
    <h1 id="your_gold">Your Gold: <span><c:out value="${sessionScope.user_gold}"/></span>  <a href="<c:url value="/reset"/>">Reset</a></h1> </h1>
</div>

<h1 id="warning">Gold is too low, you've been sent to debtors prison!</h1>

<div id="activities">


    <h1>Activities:</h1>
    <div>
        <c:forEach items="${sessionScope.log}" var="log_event">

            <c:choose>
                <c:when test="${log_event.gold_result < 0}">
                    <div id="spec_activity">
                        <p>You entered a <c:out value="${log_event.place}"/> and lost <c:out value="${log_event.gold_result}"/> gold. Ouch. (<c:out value="${log_event.timestamp}"/></p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div id="activity">
                        <p> You entered a <c:out value="${log_event.place}"/> and earned <c:out value="${log_event.gold_result}"/> gold. (<c:out value="${log_event.timestamp}"/>)</p>
                    </div>
                </c:otherwise>
            </c:choose>


        </c:forEach>
    </div>
</div>

</div>
</body>
</html>