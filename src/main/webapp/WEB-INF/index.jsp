<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <link rel="stylesheet" href="/css/index.css">
</head>
<body>

<div id="container">

    <div id="header">
        <h1 id="your_gold">Your Gold: <span><c:out value="${sessionScope.user_gold}"/></span>  <a href="<c:url value="/reset"/>">Reset</a></h1>

    </div>


    <div class="place">
        <h1>Farm</h1>
        <h2>(earns 10-20 gold)</h2>
        <form action="/process_gold" method="post">
            <input type="hidden" name="place" value="farm">
            <input type="submit" value="Find Gold">
        </form>
    </div>

    <div class="place">
        <h1>Cave</h1>
        <h2>(earns 5-10 gold)</h2>
        <form action="/process_gold" method="post">
            <input type="hidden" name="place" value="cave">
            <input type="submit" value="Find Gold">
        </form>
    </div>

    <div class="place">
        <h1>House</h1>
        <h2>(earns 2-5 gold)</h2>
        <form action="/process_gold" method="post">
            <input type="hidden" name="place" value="house">
            <input type="submit" value="Find Gold">
        </form>
    </div>

    <div class="place">
        <h1>Casino</h1>
        <h2>(earns/takes 0-50 gold)</h2>
        <form action="/process_gold" method="post">
            <input type="hidden" name="place" value="casino">
            <input type="submit" value="Find Gold">
        </form>
    </div>

    <div class="place">
        <h1>Spa</h1>
        <h2>(takes 5-20 gold)</h2>
        <form action="/process_gold" method="post">
            <input type="hidden" name="place" value="spa">
            <input type="submit" value="Find Gold">
        </form>

    </div>


    <div id="activities">
        <h1>Activities:</h1>
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



</body>

</html>
