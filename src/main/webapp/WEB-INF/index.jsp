<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<h1>Your Gold: <div><c:out value="${sessionScope.user_gold}"/></div></h1>

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


<a href="<c:url value="/reset"/>">Reset</a>


<h1>Activities:</h1>
<div>
    <c:forEach items="${sessionScope.log}" var="log_event">
        <p><c:out value="${log_event.place}"/> -
        <c:out value="${log_event.gold_result}"/> -
        <c:out value="${log_event.timestamp}"/></p>
    </c:forEach>
</div>

</html>
