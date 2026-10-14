<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choisir une Spécialité | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="h-screen flex flex-col font-sans antialiased text-slate-800 overflow-hidden">

<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="flex-grow flex overflow-hidden">

    <!-- Sidebar Patient Fixe -->
    <aside class="w-64 bg-slate-900 text-slate-300 hidden md:flex flex-col p-4 space-y-6 flex-shrink-0 h-full overflow-y-auto">
        <div class="text-xs font-semibold text-slate-500 uppercase tracking-wider px-3">Espace Patient</div>
        <nav class="space-y-1">
            <a href="${pageContext.request.contextPath}/patient/dashboard" class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 00-1-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
                Tableau de bord
            </a>
            <a href="${pageContext.request.contextPath}/patient/appointments" class="flex items-center gap-3 px-3 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium shadow-sm">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                Mes Rendez-vous
            </a>
            <a href="${pageContext.request.contextPath}/patient/profile" class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
                Mon Profil
            </a>
        </nav>
    </aside>

    <main class="flex-grow p-6 lg:p-8 overflow-y-auto h-full">
        <div class="max-w-5xl mx-auto w-full">

            <jsp:include page="/WEB-INF/views/patient/appointments/steps-wizard.jsp">
                <jsp:param name="currentStep" value="1" />
            </jsp:include>

            <div class="mb-6">
                <h1 class="text-2xl font-bold text-slate-900">Étape 1 : Sélectionnez une spécialité</h1>
                <p class="text-sm text-slate-500">Choisissez le domaine médical correspondant à votre besoin de consultation.</p>
            </div>

            <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

            <c:choose>
                <c:when test="${not empty specialties}">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 pb-12">
                        <c:forEach var="spec" items="${specialties}">
                            <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 flex flex-col justify-between hover:border-blue-500 hover:shadow-md transition-all">
                                <div>
                                    <div class="w-12 h-12 bg-blue-50 text-blue-600 rounded-xl flex items-center justify-center mb-4">
                                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5m0 0h4m-4 0V11m0 0V8a2 2 0 012-2h2a2 2 0 012 2v3m-6 0h6"/></svg>
                                    </div>
                                    <h3 class="text-lg font-bold text-slate-900 mb-2"><c:out value="${spec.name}"/></h3>
                                    <p class="text-xs text-slate-500 line-clamp-3 mb-6">
                                        <c:out value="${not empty spec.description ? spec.description : 'Consultations spécialisées assurées par nos praticiens expérimentés.'}"/>
                                    </p>
                                </div>

                                <form action="${pageContext.request.contextPath}/patient/appointments/specialty" method="post">
                                    <input type="hidden" name="specialtyId" value="${spec.id}"/>
                                    <button type="submit" class="w-full py-2.5 px-4 bg-slate-900 hover:bg-blue-600 text-white text-sm font-semibold rounded-xl transition-colors flex items-center justify-center gap-2">
                                        Choisir cette spécialité →
                                    </button>
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="bg-white rounded-2xl border border-slate-200 p-12 text-center max-w-md mx-auto my-8">
                        <p class="text-slate-500 text-sm">Aucune spécialité disponible pour le moment.</p>
                    </div>
                </c:otherwise>
            </c:choose>

            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        </div>
    </main>

</div>

</body>
</html>