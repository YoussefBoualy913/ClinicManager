<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Disponibilités | ClinicManager</title>
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
                                   class="flex items-center gap-3 px-3 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium shadow-sm">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                                    Gestion Disponibilités
                     </a>
                </nav>
    </aside>

    <!-- Contenu Principal (Défilement indépendant) -->
    <main class="flex-grow p-6 lg:p-8 overflow-y-auto h-full">
        <div class="max-w-6xl mx-auto w-full">

            <!-- En-tête -->
            <div class="mb-8">
                <h1 class="text-2xl font-bold text-slate-900">Gestion des Disponibilités</h1>
                <p class="text-sm text-slate-500">Configurez vos jours, créneaux horaires et périodes de validité pour vos consultations.</p>
            </div>

            <!-- Messages d'alerte (Succès / Erreur) -->
            <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 pb-12">

                <!-- FORMULAIRE : Ajouter une disponibilité -->
                <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 lg:p-8 h-fit">
                    <h2 class="text-lg font-bold text-slate-900 mb-4 pb-3 border-b border-slate-100 flex items-center gap-2">
                        <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/></svg>
                        Nouveau Créneau
                    </h2>

                    <form action="${pageContext.request.contextPath}/doctor/availabilities" method="post" class="space-y-4">

                        <!-- Jour de la semaine (DayOfWeek Enum) -->
                        <div>
                            <label for="dayOfWeek" class="block text-sm font-medium text-slate-700 mb-1">Jour de la semaine</label>
                            <select id="dayOfWeek" name="dayOfWeek" required
                                    class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm bg-white">
                                <option value="" disabled selected>Sélectionnez un jour</option>
                                <option value="MONDAY">Lundi</option>
                                <option value="TUESDAY">Mardi</option>
                                <option value="WEDNESDAY">Mercredi</option>
                                <option value="THURSDAY">Jeudi</option>
                                <option value="FRIDAY">Vendredi</option>
                                <option value="SATURDAY">Samedi</option>
                                <option value="SUNDAY">Dimanche</option>
                            </select>
                        </div>

                        <!-- Heures (startTime et endTime) -->
                        <div class="grid grid-cols-2 gap-3">
                            <div>
                                <label for="startTime" class="block text-sm font-medium text-slate-700 mb-1">Début</label>
                                <input type="time" id="startTime" name="startTime" required
                                       class="w-full px-3 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                            </div>
                            <div>
                                <label for="endTime" class="block text-sm font-medium text-slate-700 mb-1">Fin</label>
                                <input type="time" id="endTime" name="endTime" required
                                       class="w-full px-3 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                            </div>
                        </div>

                        <!-- Statut (AvailabilityStatus Enum) -->
                        <div>
                            <label for="status" class="block text-sm font-medium text-slate-700 mb-1">Statut initial</label>
                            <select id="status" name="status" required
                                    class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm bg-white">
                                <option value="ACTIVE" selected>Active</option>
                                <option value="INACTIVE">Inactive</option>
                                <option value="CLOSED">Close</option>
                                <option value="CLOSED">Closed</option>
                            </select>
                        </div>

                        <!-- Période de validité (validFrom et validUntil) -->
                        <div>
                            <label for="validFrom" class="block text-sm font-medium text-slate-700 mb-1">Valide à partir du</label>
                            <input type="date" id="validFrom" name="validFrom" required
                                   class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                        </div>

                        <div>
                            <label for="validUntil" class="block text-sm font-medium text-slate-700 mb-1">Valide jusqu'au </label>
                            <input type="date" id="validUntil" name="validUntil"
                                   class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                        </div>

                        <!-- Bouton Ajouter -->
                        <div class="pt-3">
                            <button type="submit"
                                    class="w-full py-2.5 px-4 bg-blue-600 hover:bg-blue-700 text-white font-semibold text-sm rounded-lg shadow-sm transition-colors flex items-center justify-center gap-2">
                                Ajouter la disponibilité
                            </button>
                        </div>
                    </form>
                </div>

                <!-- LISTE : Disponibilités Actuelles -->
                <div class="lg:col-span-2 space-y-4">
                    <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 lg:p-8">
                        <h2 class="text-lg font-bold text-slate-900 mb-4 pb-3 border-b border-slate-100">Vos Plages d'Ouverture</h2>

                        <c:choose>
                            <c:when test="${not empty availabilities}">
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    <c:forEach var="avail" items="${availabilities}">
                                        <div class="p-4 bg-slate-50 rounded-xl border border-slate-200 flex items-start justify-between hover:border-slate-300 transition-colors">
                                            <div class="space-y-2">

                                                <!-- Jour + Badge Statut -->
                                                <div class="flex items-center gap-2">
                                                    <span class="px-2.5 py-1 text-xs font-bold rounded-md bg-blue-100 text-blue-700 uppercase tracking-wide">
                                                        <c:choose>
                                                            <c:when test="${avail.dayOfWeek == 'MONDAY'}">Lundi</c:when>
                                                            <c:when test="${avail.dayOfWeek == 'TUESDAY'}">Mardi</c:when>
                                                            <c:when test="${avail.dayOfWeek == 'WEDNESDAY'}">Mercredi</c:when>
                                                            <c:when test="${avail.dayOfWeek == 'THURSDAY'}">Jeudi</c:when>
                                                            <c:when test="${avail.dayOfWeek == 'FRIDAY'}">Vendredi</c:when>
                                                            <c:when test="${avail.dayOfWeek == 'SATURDAY'}">Samedi</c:when>
                                                            <c:when test="${avail.dayOfWeek == 'SUNDAY'}">Dimanche</c:when>
                                                            <c:otherwise>${avail.dayOfWeek}</c:otherwise>
                                                        </c:choose>
                                                    </span>

                                                    <span class="px-2 py-0.5 text-xs font-semibold rounded-full
                                                        ${avail.status == 'ACTIVE' ? 'bg-emerald-100 text-emerald-700' : 'bg-rose-100 text-rose-700'}">
                                                        ${avail.status == 'ACTIVE' ? 'Disponible' : 'Indisponible'}
                                                    </span>
                                                </div>

                                                <!-- Plage Horaire -->
                                                <p class="text-lg font-extrabold text-slate-800">
                                                    ${avail.startTime} - ${avail.endTime}
                                                </p>

                                                <!-- Période de validité -->
                                                <p class="text-xs text-slate-500">
                                                    Valide du <span class="font-medium text-slate-700">${avail.validFrom}</span>
                                                    <c:if test="${not empty avail.validUntil}">
                                                        au <span class="font-medium text-slate-700">${avail.validUntil}</span>
                                                    </c:if>
                                                </p>
                                            </div>

                                            <!-- Formulaire de suppression -->
                                            <form action="${pageContext.request.contextPath}/doctor/availabilities/delete" method="post"
                                                  onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer cette disponibilité ?');">
                                                <input type="hidden" name="id" value="${avail.id}"/>
                                                <button type="submit"
                                                        class="p-2 text-slate-400 hover:text-rose-600 hover:bg-rose-50 rounded-lg transition-colors"
                                                        title="Supprimer">
                                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                                    </svg>
                                                </button>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <!-- Aucun créneau configuré -->
                                <div class="text-center py-12 text-slate-400">
                                    <svg class="w-12 h-12 mx-auto text-slate-300 mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                    </svg>
                                    <p class="text-sm font-medium">Aucune disponibilité configurée.</p>
                                    <p class="text-xs mt-1 text-slate-400">Ajoutez une plage horaire pour définir vos périodes d'ouverture.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

            </div>

            <!-- Footer -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        </div>
    </main>

</div>

</body>
</html>