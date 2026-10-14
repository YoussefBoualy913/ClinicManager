<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choisir un Médecin | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="h-screen flex flex-col font-sans antialiased text-slate-800 overflow-hidden">

<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="flex-grow flex overflow-hidden">

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
        </nav>
    </aside>

    <main class="flex-grow p-6 lg:p-8 overflow-y-auto h-full">
        <div class="max-w-5xl mx-auto w-full">

            <jsp:include page="/WEB-INF/views/patient/appointments/steps-wizard.jsp">
                <jsp:param name="currentStep" value="2" />
            </jsp:include>

            <div class="flex items-center justify-between mb-6">
                <div>
                    <h1 class="text-2xl font-bold text-slate-900">Étape 2 : Choisissez votre médecin</h1>
                    <p class="text-sm text-slate-500">Spécialité sélectionnée : <span class="font-semibold text-blue-600"><c:out value="${selectedSpecialty.name}"/></span></p>
                </div>
                <a href="${pageContext.request.contextPath}/patient/appointments/new" class="px-4 py-2 bg-slate-200 hover:bg-slate-300 text-slate-700 text-xs font-semibold rounded-lg transition-colors">
                    ← Changer de spécialité
                </a>
            </div>

            <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

            <c:choose>
                <c:when test="${not empty doctors}">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 pb-12">
                        <c:forEach var="doc" items="${doctors}">
                            <div class="bg-white rounded-2xl border border-slate-200 p-6 flex flex-col justify-between shadow-sm hover:border-blue-500 hover:shadow-md transition-all">
                                <div>
                                    <div class="flex items-center gap-4 mb-4">
                                        <div class="w-12 h-12 rounded-full bg-blue-100 text-blue-700 font-bold flex items-center justify-center text-base">
                                            Dr
                                        </div>
                                        <div>
                                            <h3 class="font-bold text-slate-900 text-lg">Dr. <c:out value="${doc.firstName}"/> <c:out value="${doc.lastName}"/></h3>
                                            <p class="text-xs font-medium text-slate-500"><c:out value="${selectedSpecialty.name}"/></p>
                                        </div>
                                    </div>

                                    <c:if test="${not empty doc.matricule}">
                                        <p class="text-xs text-slate-600 mb-6 flex items-center gap-1.5">
                                            <svg class="w-4 h-4 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5m0 0h4m-4 0V11m0 0V8a2 2 0 012-2h2a2 2 0 012 2v3m-6 0h6"/></svg>
                                            Bureau n° <span class="font-semibold text-slate-800"><c:out value="${doc.matricule}"/></span>
                                        </p>
                                    </c:if>
                                </div>

                                <form action="${pageContext.request.contextPath}/patient/appointments/doctor" method="post">
                                    <input type="hidden" name="doctorId" value="${doc.id}"/>
                                    <button type="submit" class="w-full py-2.5 px-4 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold rounded-xl transition-colors">
                                        Choisir ce médecin →
                                    </button>
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="bg-white rounded-2xl border border-slate-200 p-12 text-center max-w-md mx-auto my-8">
                        <p class="text-slate-500 text-sm mb-4">Aucun médecin disponible pour cette spécialité pour le moment.</p>
                        <a href="${pageContext.request.contextPath}/patient/appointments/new" class="inline-block px-4 py-2 bg-blue-600 text-white text-xs font-semibold rounded-lg">Retour au choix des spécialités</a>
                    </div>
                </c:otherwise>
            </c:choose>

            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        </div>
    </main>

</div>

</body>
</html>