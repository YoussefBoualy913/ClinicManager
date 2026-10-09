<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de bord - Médecin | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="h-screen flex flex-col font-sans antialiased text-slate-800 overflow-hidden">

<!-- 1. BARRE DE NAVIGATION SUPÉRIEURE -->
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<!-- 2. CONTENEUR PRINCIPAL -->
<div class="flex-grow flex overflow-hidden">

    <!-- Sidebar Médecin -->
    <aside class="w-64 bg-slate-900 text-slate-300 hidden md:flex flex-col p-4 space-y-6 flex-shrink-0 h-full overflow-y-auto">
        <div class="text-xs font-semibold text-slate-500 uppercase tracking-wider px-3">Espace Médecin</div>
        <nav class="space-y-1">
            <a href="${pageContext.request.contextPath}/doctor/dashboard"
               class="flex items-center gap-3 px-3 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium shadow-sm">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 00-1-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
                Tableau de bord
            </a>
            <a href="${pageContext.request.contextPath}/doctor/appointments"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
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
        </nav>
    </aside>

    <!-- Zone de contenu -->
    <main class="flex-grow p-6 lg:p-8 overflow-y-auto h-full">
        <div class="max-w-7xl mx-auto space-y-8">

            <!-- Message de bienvenue + Titre -->
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div>
                    <h1 class="text-2xl font-bold text-slate-900">
                        Bonjour, Dr. <c:out value="${sessionScope.user.lastName != null ? sessionScope.user.lastName : 'Médecin'}"/> 👋
                    </h1>
                    <p class="text-sm text-slate-500 mt-1">
                        Voici un aperçu de vos activités et des rendez-vous prévus pour aujourd'hui.
                    </p>
                </div>
                <div class="flex items-center gap-3">
                    <a href="${pageContext.request.contextPath}/doctor/prescriptions/new"
                       class="inline-flex items-center gap-2 px-4 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-medium text-sm rounded-xl shadow-sm transition-colors">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/></svg>
                        Nouvelle Ordonnance
                    </a>
                </div>
            </div>

            <!-- Messages d'alerte s'il y en a -->
            <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

            <!-- CARD STATISTIQUES RAPIDES -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">

                <!-- Carte 1: RDV Aujourd'hui -->
                <div class="bg-white p-5 rounded-2xl border border-slate-200 shadow-sm flex items-center gap-4">
                    <div class="w-12 h-12 rounded-xl bg-blue-50 text-blue-600 flex items-center justify-center flex-shrink-0">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                    </div>
                    <div>
                        <p class="text-xs font-semibold uppercase text-slate-400 tracking-wider">RDV Aujourd'hui</p>
                        <h3 class="text-2xl font-bold text-slate-900"><c:out value="${todayAppointmentsCount != null ? todayAppointmentsCount : '0'}"/></h3>
                    </div>
                </div>

                <!-- Carte 2: Consultations Termiénées -->
                <div class="bg-white p-5 rounded-2xl border border-slate-200 shadow-sm flex items-center gap-4">
                    <div class="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center flex-shrink-0">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
                    </div>
                    <div>
                        <p class="text-xs font-semibold uppercase text-slate-400 tracking-wider">Terminées</p>
                        <h3 class="text-2xl font-bold text-slate-900"><c:out value="${completedCount != null ? completedCount : '0'}"/></h3>
                    </div>
                </div>

                <!-- Carte 3: En Attente -->
                <div class="bg-white p-5 rounded-2xl border border-slate-200 shadow-sm flex items-center gap-4">
                    <div class="w-12 h-12 rounded-xl bg-amber-50 text-amber-600 flex items-center justify-center flex-shrink-0">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                    </div>
                    <div>
                        <p class="text-xs font-semibold uppercase text-slate-400 tracking-wider">En Attente</p>
                        <h3 class="text-2xl font-bold text-slate-900"><c:out value="${pendingCount != null ? pendingCount : '0'}"/></h3>
                    </div>
                </div>

                <!-- Carte 4: Total Patients -->
                <div class="bg-white p-5 rounded-2xl border border-slate-200 shadow-sm flex items-center gap-4">
                    <div class="w-12 h-12 rounded-xl bg-purple-50 text-purple-600 flex items-center justify-center flex-shrink-0">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/></svg>
                    </div>
                    <div>
                        <p class="text-xs font-semibold uppercase text-slate-400 tracking-wider">Total Patients</p>
                        <h3 class="text-2xl font-bold text-slate-900"><c:out value="${totalPatientsCount != null ? totalPatientsCount : '0'}"/></h3>
                    </div>
                </div>

            </div>

            <!-- TABLEAU DES RENDEZ-VOUS DU JOUR -->
            <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
                <div class="p-6 border-b border-slate-100 flex items-center justify-between">
                    <div>
                        <h2 class="text-lg font-bold text-slate-900">Rendez-vous d'aujourd'hui</h2>
                        <p class="text-xs text-slate-500">Liste des patients programmés pour cette journée.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/doctor/appointments" class="text-xs font-semibold text-blue-600 hover:text-blue-800">
                        Voir tout →
                    </a>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full text-left text-sm text-slate-600">
                        <thead class="bg-slate-50 text-xs font-semibold uppercase text-slate-400 border-b border-slate-100">
                            <tr>
                                <th class="px-6 py-3.5">Heure</th>
                                <th class="px-6 py-3.5">Patient</th>
                                <th class="px-6 py-3.5">Motif</th>
                                <th class="px-6 py-3.5">Statut</th>
                                <th class="px-6 py-3.5 text-right">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            <c:choose>
                                <c:when test="${not empty todayAppointments}">
                                    <c:forEach var="apt" items="${todayAppointments}">
                                        <tr class="hover:bg-slate-50/80 transition-colors">
                                            <!-- Heure -->
                                            <td class="px-6 py-4 font-semibold text-slate-900 whitespace-nowrap">
                                                <fmt:formatDate value="${apt.appointmentTime}" pattern="HH:mm"/>
                                            </td>

                                            <!-- Patient -->
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="flex items-center gap-3">
                                                    <div class="w-8 h-8 rounded-full bg-slate-200 text-slate-700 font-bold flex items-center justify-center text-xs">
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
                                                <c:out value="${apt.reason != null ? apt.reason : 'Consultation standard'}"/>
                                            </td>

                                            <!-- Statut -->
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <c:choose>
                                                    <c:when test="${apt.status == 'SCHEDULED' || apt.status == 'CONFIRMED'}">
                                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-amber-50 text-amber-700 border border-amber-200">
                                                            En attente
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${apt.status == 'IN_PROGRESS'}">
                                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-50 text-blue-700 border border-blue-200">
                                                            En cours
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${apt.status == 'COMPLETED'}">
                                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-emerald-50 text-emerald-700 border border-emerald-200">
                                                            Terminé
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
                                                    <a href="${pageContext.request.contextPath}/doctor/consultation?appointmentId=${apt.id}"
                                                       class="px-3 py-1.5 bg-blue-50 hover:bg-blue-100 text-blue-700 font-medium text-xs rounded-lg transition-colors">
                                                        Consulter
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
                                        <td colspan="5" class="px-6 py-10 text-center text-slate-400">
                                            Aucun rendez-vous prévu pour aujourd'hui.
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- FOOTER -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

        </div>
    </main>

</div>

</body>
</html>