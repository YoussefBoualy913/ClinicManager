<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choisir un Horaire | ClinicManager</title>
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
                <jsp:param name="currentStep" value="4" />
            </jsp:include>

            <div class="flex items-center justify-between mb-6">
                <div class="mb-6">
                    <h1 class="text-2xl font-bold text-slate-900">Étape 4 : Sélectionnez l'horaire</h1>
                    <p class="text-sm text-slate-500">
                        Date choisie : <span class="font-semibold text-slate-800 capitalize"><c:out value="${formattedDate}"/></span>
                        - Dr. <c:out value="${selectedDoctor.firstName}"/> <c:out value="${selectedDoctor.lastName}"/>
                    </p>
                </div>
                <form action="${pageContext.request.contextPath}/patient/appointments/doctor" method="post">
                    <input type="hidden" name="doctorId" value="${selectedDoctor.id}"/>
                    <button type="submit" class="px-4 py-2 bg-slate-200 hover:bg-slate-300 text-slate-700 text-xs font-semibold rounded-lg transition-colors">
                        ← Changer de jour
                    </button>
                </form>
            </div>

            <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

            <c:choose>
                <c:when test="${not empty availableSlots}">
                    <div class="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 gap-3 pb-12">
                        <c:forEach var="slot" items="${availableSlots}">
                            <form action="${pageContext.request.contextPath}/patient/appointments/slot" method="post">
                                <input type="hidden" name="selectedTime" value="${slot.startTime}"/>
                                <button type="submit" class="w-full py-3 bg-white hover:bg-emerald-600 hover:text-white border border-slate-200 rounded-xl text-center text-sm font-bold text-slate-800 shadow-sm transition-all">
                                    <c:out value="${slot.startTime}"/>
                                </button>
                            </form>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="bg-white rounded-2xl border border-slate-200 p-12 text-center max-w-md mx-auto my-8">
                        <p class="text-slate-500 text-sm mb-4">Tous les créneaux de cette journée ont déjà été réservés.</p>
                        <form action="${pageContext.request.contextPath}/patient/appointments/doctor" method="post">
                            <input type="hidden" name="doctorId" value="${selectedDoctor.id}"/>
                            <button type="submit" class="px-4 py-2 bg-blue-600 text-white text-xs font-semibold rounded-lg">Choisir une autre date</button>
                        </form>
                    </div>
                </c:otherwise>
            </c:choose>

            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        </div>
    </main>

</div>

</body>
</html>