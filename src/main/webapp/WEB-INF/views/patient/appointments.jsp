<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes Rendez-vous | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="h-screen flex flex-col font-sans antialiased text-slate-800 overflow-hidden">

<!-- 1. NAVBAR FIXE -->
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<!-- 2. CONTENEUR PRINCIPAL -->
<div class="flex-grow flex overflow-hidden">

    <!-- Sidebar Patient -->
    <aside class="w-64 bg-slate-900 text-slate-300 hidden md:flex flex-col p-4 space-y-6 flex-shrink-0 h-full overflow-y-auto">
        <div class="text-xs font-semibold text-slate-500 uppercase tracking-wider px-3">Espace Patient</div>
        <nav class="space-y-1">
            <a href="${pageContext.request.contextPath}/patient/dashboard"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 00-1-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
                Tableau de bord
            </a>
            <a href="${pageContext.request.contextPath}/patient/appointments"
               class="flex items-center gap-3 px-3 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium shadow-sm">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                Mes Rendez-vous
            </a>
            <a href="${pageContext.request.contextPath}/patient/medical-record"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                Dossier Médical
            </a>
            <a href="${pageContext.request.contextPath}/patient/profile"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
                Mon Profil
            </a>
        </nav>
    </aside>

    <!-- Contenu Principal -->
    <main class="flex-grow p-6 lg:p-8 overflow-y-auto h-full">
        <div class="max-w-6xl mx-auto w-full">

            <!-- En-tête + Bouton d'action -->
            <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-8">
                <div>
                    <h1 class="text-2xl font-bold text-slate-900">Mes Rendez-vous</h1>
                    <p class="text-sm text-slate-500">Consultez l'historique et la liste de vos rendez-vous médicaux.</p>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/patient/appointments/book"
                       class="inline-flex items-center gap-2 px-4 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-medium text-sm rounded-xl shadow-sm transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/></svg>
                        Prendre un rendez-vous
                    </a>
                </div>
            </div>

            <!-- Messages d'alerte (Succès / Erreur) -->
            <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

            <!-- Filtres / Onglets -->
            <div class="flex items-center gap-2 border-b border-slate-200 mb-6 pb-2 overflow-x-auto">
                <a href="${pageContext.request.contextPath}/patient/appointments"
                   class="px-4 py-2 rounded-lg text-sm font-medium ${empty param.filter ? 'bg-white text-blue-600 shadow-sm border border-slate-200' : 'text-slate-600 hover:bg-slate-200/60'}">
                    Tous
                </a>
                <a href="${pageContext.request.contextPath}/patient/appointments?filter=UPCOMING"
                   class="px-4 py-2 rounded-lg text-sm font-medium ${param.filter == 'UPCOMING' ? 'bg-white text-blue-600 shadow-sm border border-slate-200' : 'text-slate-600 hover:bg-slate-200/60'}">
                    À venir
                </a>
                <a href="${pageContext.request.contextPath}/patient/appointments?filter=COMPLETED"
                   class="px-4 py-2 rounded-lg text-sm font-medium ${param.filter == 'COMPLETED' ? 'bg-white text-blue-600 shadow-sm border border-slate-200' : 'text-slate-600 hover:bg-slate-200/60'}">
                    Effectués
                </a>
                <a href="${pageContext.request.contextPath}/patient/appointments?filter=CANCELLED"
                   class="px-4 py-2 rounded-lg text-sm font-medium ${param.filter == 'CANCELLED' ? 'bg-white text-blue-600 shadow-sm border border-slate-200' : 'text-slate-600 hover:bg-slate-200/60'}">
                    Annulés
                </a>
            </div>

            <!-- Liste des Rendez-vous -->
            <c:choose>
                <c:when test="${not empty appointments}">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 pb-12">
                        <c:forEach var="appointment" items="${appointments}">
                            <div class="bg-white rounded-2xl border border-slate-200 shadow-sm hover:shadow-md transition-shadow p-6 flex flex-col justify-between">
                                <div>
                                    <!-- Header de la carte : Statut & Date/Heure -->
                                    <div class="flex items-center justify-between mb-4">
                                        <div class="flex items-center gap-2 text-slate-600 text-sm font-semibold">
                                            <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                            </svg>
                                            ${appointment.date.dayOfMonth}/${appointment.date.monthValue}/${appointment.date.year}
                                            <span class="text-slate-300">•</span>
                                            ${appointment.startTime}
                                        </div>

                                        <!-- Badges de Statut -->
                                        <c:choose>
                                            <c:when test="${appointment.status == 'PLANNED'}">
                                                <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 border border-emerald-200">
                                                    Planifié
                                                </span>
                                            </c:when>
                                            <c:when test="${appointment.status == 'DONE'}">
                                                <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold bg-blue-50 text-blue-700 border border-blue-200">
                                                    Terminé
                                                </span>
                                            </c:when>
                                            <c:when test="${appointment.status == 'CANCELED'}">
                                                <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold bg-rose-50 text-rose-700 border border-rose-200">
                                                    Annulé
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold bg-slate-100 text-slate-700 border border-slate-200">
                                                    ${appointment.status}
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <!-- Infos Médecin -->
                                    <div class="flex items-center gap-4 mb-4 p-3 bg-slate-50 rounded-xl border border-slate-100">
                                        <div class="w-10 h-10 rounded-full bg-blue-100 text-blue-700 flex items-center justify-center font-bold text-sm">
                                            Dr
                                        </div>
                                        <div>
                                            <h3 class="font-bold text-slate-900 text-base">Dr. ${appointment.doctor.firstName} ${appointment.doctor.lastName}</h3>
                                            <p class="text-xs text-slate-500">${appointment.doctor.specialty != null ? appointment.doctor.specialty.name : 'Médecin Généraliste'}</p>
                                        </div>
                                    </div>

                                    <!-- Motif du rendez-vous -->
                                    <div class="text-sm text-slate-600 mb-6">
                                        <span class="font-semibold text-slate-700">Motif : </span>
                                        <c:out value="${appointment.reason != null ? appointment.reason : 'Consultation standard'}" />
                                    </div>
                                </div>

                                <!-- Actions -->
                                <div class="pt-4 border-t border-slate-100 flex items-center justify-between">
                                    <c:if test="${appointment.status == 'PLANNED'}">
                                        <form action="${pageContext.request.contextPath}/patient/appointments/cancel" method="post"
                                              onsubmit="return confirm('Êtes-vous sûr de vouloir annuler ce rendez-vous ?');">
                                            <input type="hidden" name="appointmentId" value="${appointment.id}"/>
                                            <button type="submit" class="text-xs text-rose-600 hover:text-rose-800 font-semibold transition-colors">
                                                Annuler le rendez-vous
                                            </button>
                                        </form>
                                    </c:if>
                                    <c:if test="${appointment.status != 'PLANNED' }">
                                        <span class="text-xs text-slate-400">Aucune action requise</span>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>

                <c:otherwise>
                    <!-- Aucun rendez-vous trouvé -->
                    <div class="bg-white rounded-2xl border border-slate-200 p-12 text-center max-w-lg mx-auto my-8">
                        <div class="w-16 h-16 bg-blue-50 text-blue-600 rounded-full flex items-center justify-center mx-auto mb-4">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                            </svg>
                        </div>
                        <h3 class="text-lg font-bold text-slate-900 mb-1">Aucun rendez-vous trouvé</h3>
                        <p class="text-slate-500 text-sm mb-6">Vous n'avez pas de rendez-vous correspondant à ce filtre pour le moment.</p>
                        <a href="${pageContext.request.contextPath}/patient/appointments/book"
                           class="inline-flex items-center gap-2 px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-semibold text-sm rounded-xl shadow-sm transition-colors">
                            Prendre votre premier rendez-vous
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>

            <!-- Footer -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

        </div>
    </main>

</div>

</body>
</html>