<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord Administration | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col min-h-full font-sans antialiased text-slate-800">

<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="flex-grow flex">
    <!-- Navigation Latérale (Sidebar) -->
    <aside class="w-64 bg-slate-900 text-slate-300 hidden md:flex flex-col p-4 space-y-6">
        <div class="text-xs font-semibold text-slate-500 uppercase tracking-wider px-3">Administration</div>
        <nav class="space-y-1">
            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="flex items-center gap-3 px-3 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium shadow-sm">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 00-1-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
                Tableau de Bord
            </a>
            <a href="${pageContext.request.contextPath}/admin/doctors"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
                Médecins
            </a>
            <a href="${pageContext.request.contextPath}/admin/patients"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/></svg>
                Patients
            </a>
            <a href="${pageContext.request.contextPath}/admin/departments"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5m0 0h5m-5 0V11m0 0h5m-5 0H7m5 0v10"/></svg>
                Départements
            </a>
            <a href="${pageContext.request.contextPath}/admin/specialties"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"/></svg>
                Spécialités
            </a>
            <a href="${pageContext.request.contextPath}/admin/appointments"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                Tous les RDV
            </a>
        </nav>
    </aside>

    <!-- Contenu Principal -->
    <main class="flex-grow p-6 lg:p-8">

        <!-- En-tête -->
        <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-8">
            <div>
                <h1 class="text-2xl font-bold text-slate-900">Tableau de Bord Administrateur</h1>
                <p class="text-sm text-slate-500">Vue d'ensemble de la clinique et gestion des ressources.</p>
            </div>
            <div class="flex gap-3">
                <a href="${pageContext.request.contextPath}/admin/doctors/new"
                   class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold rounded-lg shadow-sm transition-colors flex items-center gap-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/></svg>
                    Ajouter un Médecin
                </a>
            </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

        <!-- Grille des Statistiques / KPIs -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">

            <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm flex items-center justify-between">
                <div>
                    <p class="text-xs font-semibold text-slate-500 uppercase tracking-wider mb-1">Total Médecins</p>
                    <h3 class="text-3xl font-extrabold text-slate-900">${doctorsCount != null ? doctorsCount : 0}</h3>
                </div>
                <div class="w-12 h-12 bg-emerald-100 text-emerald-600 rounded-xl flex items-center justify-center">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
                </div>
            </div>

            <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm flex items-center justify-between">
                <div>
                    <p class="text-xs font-semibold text-slate-500 uppercase tracking-wider mb-1">Total Patients</p>
                    <h3 class="text-3xl font-extrabold text-slate-900">${patientsCount != null ? patientsCount : 0}</h3>
                </div>
                <div class="w-12 h-12 bg-blue-100 text-blue-600 rounded-xl flex items-center justify-center">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/></svg>
                </div>
            </div>

            <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm flex items-center justify-between">
                <div>
                    <p class="text-xs font-semibold text-slate-500 uppercase tracking-wider mb-1">RDV Aujourd'hui</p>
                    <h3 class="text-3xl font-extrabold text-slate-900">${todayAppointmentsCount != null ? todayAppointmentsCount : 0}</h3>
                </div>
                <div class="w-12 h-12 bg-amber-100 text-amber-600 rounded-xl flex items-center justify-center">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                </div>
            </div>

            <div class="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm flex items-center justify-between">
                <div>
                    <p class="text-xs font-semibold text-slate-500 uppercase tracking-wider mb-1">Départements</p>
                    <h3 class="text-3xl font-extrabold text-slate-900">${departmentsCount != null ? departmentsCount : 0}</h3>
                </div>
                <div class="w-12 h-12 bg-purple-100 text-purple-600 rounded-xl flex items-center justify-center">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5m0 0h5m-5 0V11m0 0h5m-5 0H7m5 0v10"/></svg>
                </div>
            </div>

        </div>

        <!-- Section Contenu : Tableaux de Suivi -->
        <div class="grid lg:grid-cols-3 gap-8">

            <!-- Tableau des Rendez-vous Récents -->
            <div class="lg:col-span-2 bg-white rounded-2xl border border-slate-200 shadow-sm p-6">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-lg font-bold text-slate-900">Rendez-vous Récents</h2>
                    <a href="${pageContext.request.contextPath}/admin/appointments" class="text-sm font-semibold text-blue-600 hover:text-blue-700">Voir tout</a>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="border-b border-slate-100 text-xs font-semibold text-slate-400 uppercase tracking-wider">
                                <th class="pb-3">Patient</th>
                                <th class="pb-3">Médecin</th>
                                <th class="pb-3">Date & Heure</th>
                                <th class="pb-3">Statut</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100 text-sm">
                            <c:choose>
                                <c:when test="${not empty recentAppointments}">
                                    <c:forEach var="apt" items="${recentAppointments}">
                                        <tr class="hover:bg-slate-50 transition-colors">
                                            <td class="py-3.5 font-medium text-slate-800">${apt.patient.firstName} ${apt.patient.lastName}</td>
                                            <td class="py-3.5 text-slate-600">Dr. ${apt.doctor.lastName}</td>
                                            <td class="py-3.5 text-slate-500">${apt.appointmentDate} - ${apt.timeSlot}</td>
                                            <td class="py-3.5">
                                                <span class="px-2.5 py-1 text-xs font-semibold rounded-full
                                                    ${apt.status == 'CONFIRMED' ? 'bg-emerald-100 text-emerald-700' :
                                                      apt.status == 'PENDING' ? 'bg-amber-100 text-amber-700' : 'bg-rose-100 text-rose-700'}">
                                                    ${apt.status}
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="4" class="py-6 text-center text-slate-400">Aucun rendez-vous récent.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Comptes Médecins à Valider -->
            <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 flex flex-col justify-between">
                <div>
                    <h2 class="text-lg font-bold text-slate-900 mb-4">Comptes en Attente</h2>
                    <p class="text-xs text-slate-500 mb-6">Nouveaux médecins nécessitant une validation de leur matricule.</p>

                    <div class="space-y-4">
                        <c:choose>
                            <c:when test="${not empty pendingDoctors}">
                                <c:forEach var="doc" items="${pendingDoctors}">
                                    <div class="p-3 bg-slate-50 border border-slate-200 rounded-xl flex items-center justify-between">
                                        <div>
                                            <p class="text-sm font-semibold text-slate-800">Dr. ${doc.firstName} ${doc.lastName}</p>
                                            <p class="text-xs text-slate-500">${doc.specialty.name} - Mat: ${doc.matricule}</p>
                                        </div>
                                        <form action="${pageContext.request.contextPath}/admin/doctors/approve" method="post">
                                            <input type="hidden" name="doctorId" value="${doc.id}"/>
                                            <button type="submit" class="px-3 py-1.5 bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-semibold rounded-lg transition-colors">
                                                Valider
                                            </button>
                                        </form>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-6 text-slate-400 text-sm">
                                    Aucune demande de validation en attente.
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="mt-8 pt-4 border-t border-slate-100">
                    <a href="${pageContext.request.contextPath}/admin/departments/new"
                       class="w-full py-2.5 px-4 bg-slate-100 hover:bg-slate-200 text-slate-700 text-sm font-semibold rounded-lg transition-colors block text-center">
                        + Ajouter un département
                    </a>
                </div>
            </div>

        </div>

    </main>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>