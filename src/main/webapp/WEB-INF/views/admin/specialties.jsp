<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin - Specialites | ClinicManager</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/navbar.jspf"/>
<main class="container">
    <h1>Admin - Specialites</h1>
    <jsp:include page="/WEB-INF/views/common/messages.jspf"/>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jspf"/>
</body>
</html>