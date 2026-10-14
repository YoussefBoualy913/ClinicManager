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

<!-- 1. NAVBAR FIXE EN HAUT -->
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<!-- 2. CONTENEUR PRINCIPAL FIXÉ EN HAUTEUR -->
<div class="flex-grow flex overflow-hidden">

    <!-- Navigation Latérale (Sidebar Médecin) -->
    <aside class="w-64 bg-slate-900 text-slate-300 hidden md:flex flex-col p-4 space-y-6 flex-shrink-0 h-full overflow-y-auto">
        <div class="text-xs font-semibold text-slate-500 uppercase tracking-wider px-3">Espace Médecin</div>
        <nav class="space-y-1">
                    <a href="${pageContext.request.contextPath}/doctor/dashboard"
                       class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 00-1-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
                        Tableau de bord
                    </a>
                    <a href="${pageContext.request.contextPath}/doctor/appointments"
                       class="flex items-center gap-3 px-3 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium shadow-sm">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                        Mes Consultation / RDV
                    </a>
                    <a href="${pageContext.request.contextPath}/doctor/patients"
                       class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/></svg>
                        Mes Patients
                    </a>
                    <a href="${pageContext.request.contextPath}/doctor/schedule"
                       class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                        Mon Emploi du Temps
                    </a>
                     <a href="${pageContext.request.contextPath}/doctor/availabilities"
                                   class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                                    Gestion Disponibilités
                     </a>
                      <a href="${pageContext.request.contextPath}/doctor/absences"
                                    class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                                     <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                                     Gestion Absences
                                 </a>
                </nav>
    </aside>

    <!-- Contenu Principal (Défilement indépendant) -->
    <main class="flex-grow p-6 lg:p-8 overflow-y-auto h-full">
        <div class="max-w-7xl mx-auto w-full">

            <!-- En-tête -->
            <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-8">
                <div>
                    <h1 class="text-2xl font-bold text-slate-900">Agenda & Rendez-vous</h1>
                    <p class="text-sm text-slate-500">Visualisez et gérez l'ensemble des consultations réservées par vos patients.</p>
                </div>
            </div>

            <!-- Messages d'alerte (Succès / Erreur) -->
            <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

            <!-- Filtres / Onglets de statut -->
            <div class="flex items-center gap-2 border-b border-slate-200 mb-6 pb-2 overflow-x-auto">
                <a href="${pageContext.request.contextPath}/doctor/appointments"
                   class="px-4 py-2 rounded-lg text-sm font-medium ${empty param.filter ? 'bg-white text-blue-600 shadow-sm border border-slate-200' : 'text-slate-600 hover:bg-slate-200/60'}">
                    Tous
                </a>
                <a href="${pageContext.request.contextPath}/doctor/appointments?filter=SCHEDULED"
                   class="px-4 py-2 rounded-lg text-sm font-medium ${param.filter == 'SCHEDULED' ? 'bg-white text-blue-600 shadow-sm border border-slate-200' : 'text-slate-600 hover:bg-slate-200/60'}">
                    En attente / Planifiés
                </a>
                <a href="${pageContext.request.contextPath}/doctor/appointments?filter=COMPLETED"
                   class="px-4 py-2 rounded-lg text-sm font-medium ${param.filter == 'COMPLETED' ? 'bg-white text-blue-600 shadow-sm border border-slate-200' : 'text-slate-600 hover:bg-slate-200/60'}">
                    Terminés
                </a>
                <a href="${pageContext.request.contextPath}/doctor/appointments?filter=CANCELLED"
                   class="px-4 py-2 rounded-lg text-sm font-medium ${param.filter == 'CANCELLED' ? 'bg-white text-blue-600 shadow-sm border border-slate-200' : 'text-slate-600 hover:bg-slate-200/60'}">
                    Annulés
                </a>
            </div>

            <!-- Tableau des Rendez-vous -->
            <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden mb-12">
                <div class="overflow-x-auto">
                    <table class="w-full text-left text-sm text-slate-600">
                        <thead class="bg-slate-50 text-xs font-semibold uppercase text-slate-400 border-b border-slate-100">
                            <tr>
                                <th class="px-6 py-3.5">Date & Heure</th>
                                <th class="px-6 py-3.5">Patient</th>
                                <th class="px-6 py-3.5">Motif</th>
                                <th class="px-6 py-3.5">Statut</th>
                                <th class="px-6 py-3.5 text-right">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            <c:choose>
                                <c:when test="${not empty appointments}">
                                    <c:forEach var="apt" items="${appointments}">
                                        <tr class="hover:bg-slate-50/80 transition-colors">

                                            <!-- Date et Heure -->
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="font-bold text-slate-900">
                                                   ${apt.date.dayOfMonth}/${apt.date.monthValue}/${apt.date.year}
                                                </div>
                                                <div class="text-xs text-slate-500">
                                                    ${apt.startTime}->${apt.endTime}
                                                </div>
                                            </td>

                                            <!-- Patient -->
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="flex items-center gap-3">
                                                    <div class="w-8 h-8 rounded-full bg-blue-100 text-blue-700 font-bold flex items-center justify-center text-xs">
                                                        ${apt.patient.firstName.substring(0,1)}${apt.patient.lastName.substring(0,1)}
                                                    </div>
                                                    <div>
                                                        <div class="font-medium text-slate-900">${apt.patient.firstName} ${apt.patient.lastName}</div>
                                                        <div class="text-xs text-slate-400">${apt.patient.phone}</div>
                                                    </div>
                                                </div>
                                            </td>

                                            <!-- Motif -->
                                            <td class="px-6 py-4 max-w-xs truncate">
                                                <c:out value="${not empty apt.reason ? apt.reason : 'Consultation standard'}"/>
                                            </td>

                                            <!-- Statut -->
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <c:choose>
                                                    <c:when test="${apt.status == 'PLANNED' }">
                                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-amber-50 text-amber-700 border border-amber-200">
                                                            Planifié
                                                        </span>
                                                    </c:when>

                                                    <c:when test="${apt.status == 'DONE'}">
                                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-emerald-50 text-emerald-700 border border-emerald-200">
                                                            Terminé
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${apt.status == 'CANCELED'}">
                                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-rose-50 text-rose-700 border border-rose-200">
                                                            Annulé
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-slate-100 text-slate-600 border border-slate-200">
                                                            ${apt.status}
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>

                                            <!-- Actions -->
                                            <td class="px-6 py-4 text-right whitespace-nowrap">
                                                <div class="flex items-center justify-end gap-2">
                                                    <a href="${pageContext.request.contextPath}/doctor/consultation?id=${apt.id}"
                                                       class="px-3 py-1.5 bg-blue-50 hover:bg-blue-100 text-blue-700 font-medium text-xs rounded-lg transition-colors">
                                                        Détails / Consulter
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/doctor/patient/record?id=${apt.patient.id}"
                                                       class="px-3 py-1.5 bg-slate-100 hover:bg-slate-200 text-slate-700 font-medium text-xs rounded-lg transition-colors">
                                                        Dossier
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" class="px-6 py-12 text-center text-slate-400">
                                            Aucun rendez-vous trouvé dans cette catégorie.
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Footer -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        </div>
    </main>

</div>

</body>
</html>