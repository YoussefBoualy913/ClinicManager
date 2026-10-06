<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-50">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col min-h-full font-sans">

<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<main class="flex-grow flex items-center justify-center py-16 px-4">
    <div class="max-w-3xl text-center space-y-6">

        <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

        <span class="px-3 py-1 bg-blue-100 text-blue-700 font-semibold text-xs rounded-full uppercase tracking-wider">
            Gestion Médicale
        </span>

        <h1 class="text-4xl sm:text-5xl font-extrabold text-slate-900 tracking-tight">
            Bienvenue sur <span class="text-blue-600">ClinicManager</span>
        </h1>

        <p class="text-lg text-slate-600 max-w-xl mx-auto">
            La solution simple pour la prise de rendez-vous médicaux et la gestion de vos consultations en ligne.
        </p>

        <!-- Dynamic Action Buttons -->
        <div class="pt-4 flex flex-col sm:flex-row justify-center gap-4">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/dashboard"
                       class="px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg shadow-sm transition-colors">
                        Accéder à Mon Espace
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/register"
                       class="px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg shadow-sm transition-colors">
                        S'inscrire
                    </a>
                    <a href="${pageContext.request.contextPath}/login"
                       class="px-6 py-3 bg-white border border-slate-300 hover:bg-slate-100 text-slate-700 font-semibold rounded-lg transition-colors">
                        Se connecter
                    </a>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>