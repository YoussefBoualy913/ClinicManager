<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:if test="${not empty successMessage}">
    <p class="alert alert-success">${successMessage}</p>
</c:if>
<c:if test="${not empty errorMessage}">
    <p class="alert alert-error">${errorMessage}</p>
</c:if>