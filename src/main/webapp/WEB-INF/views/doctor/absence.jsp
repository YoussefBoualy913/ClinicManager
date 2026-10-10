<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Absences | ClinicManager</title>
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
                                  class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                                   <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                                   Gestion Disponibilités
                    </a>
                     <a href="${pageContext.request.contextPath}/doctor/absences"
                                   class="flex items-center gap-3 px-3 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium shadow-sm">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                                    Gestion Absences
                                </a>
               </nav>
    </aside>

    <!-- Contenu Principal (Défilement indépendant) -->
    <main class="flex-grow p-6 lg:p-8 overflow-y-auto h-full">
        <div class="max-w-6xl mx-auto w-full">

            <!-- En-tête -->
            <div class="mb-8">
                <h1 class="text-2xl font-bold text-slate-900">Gestion des Absences</h1>
                <p class="text-sm text-slate-500">Déclarez vos congés ou indisponibilités temporaires afin de bloquer la prise de rendez-vous.</p>
            </div>

            <!-- Messages d'alerte (Succès / Erreur) -->
            <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 pb-12">

                <!-- FORMULAIRE : Déclarer une absence -->
                <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 lg:p-8 h-fit">
                    <h2 class="text-lg font-bold text-slate-900 mb-4 pb-3 border-b border-slate-100 flex items-center gap-2">
                        <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/></svg>
                        Déclarer une Absence
                    </h2>

                    <form action="${pageContext.request.contextPath}/doctor/absences" method="post" class="space-y-4">

                        <!-- Type d'absence (AbsenceType Enum) -->
                        <div>
                            <label for="type" class="block text-sm font-medium text-slate-700 mb-1">Type d'absence</label>
                            <select id="type" name="type" required
                                    class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm bg-white">
                                <option value="" disabled selected>Sélectionnez un type</option>
                                <option value="VACANCE">Vacances / Congé</option>
                                <option value="SICK">Maladie</option>
                                <option value="TRAINING">Formation</option>
                                <option value="OTHER">Autre</option>
                            </select>
                        </div>

                        <!-- Date de Début -->
                        <div>
                            <label for="startDate" class="block text-sm font-medium text-slate-700 mb-1">Date de début</label>
                            <input type="date" id="startDate" name="startDate" required
                                   class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                        </div>

                        <!-- Date de Fin -->
                        <div>
                            <label for="endDate" class="block text-sm font-medium text-slate-700 mb-1">Date de fin</label>
                            <input type="date" id="endDate" name="endDate" required
                                   class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                        </div>

                        <!-- Motif / Raison (500 caractères max) -->
                        <div>
                            <label for="reason" class="block text-sm font-medium text-slate-700 mb-1">Motif / Description</label>
                            <textarea id="reason" name="reason" rows="3" maxlength="500" placeholder="Ex: Congés payés, Formation médicale..."
                                      class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm resize-none"></textarea>
                        </div>

                        <!-- Bouton Déposer -->
                        <div class="pt-3">
                            <button type="submit"
                                    class="w-full py-2.5 px-4 bg-blue-600 hover:bg-blue-700 text-white font-semibold text-sm rounded-lg shadow-sm transition-colors flex items-center justify-center gap-2">
                                Enregistrer l'absence
                            </button>
                        </div>
                    </form>
                </div>

                <!-- LISTE : Historique des absences -->
                <div class="lg:col-span-2 space-y-4">
                    <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 lg:p-8">
                        <h2 class="text-lg font-bold text-slate-900 mb-4 pb-3 border-b border-slate-100">Historique de vos Absences</h2>

                        <c:choose>
                            <c:when test="${not empty absences}">
                                <div class="space-y-4">
                                    <c:forEach var="absence" items="${absences}">
                                        <div class="p-4 bg-slate-50 rounded-xl border border-slate-200 flex items-start justify-between hover:border-slate-300 transition-colors">
                                            <div class="space-y-2">

                                                <!-- Badge Type + Période -->
                                                <div class="flex items-center gap-3">
                                                    <span class="px-2.5 py-1 text-xs font-bold rounded-md uppercase tracking-wide
                                                        ${absence.type == 'VACANCE' ? 'bg-blue-100 text-blue-700' :
                                                          absence.type == 'SICK' ? 'bg-rose-100 text-rose-700' :
                                                          absence.type == 'TRAINING' ? 'bg-amber-100 text-amber-700' : 'bg-slate-200 text-slate-700'}">
                                                        <c:choose>
                                                            <c:when test="${absence.type == 'VACANCE'}">Vacances</c:when>
                                                            <c:when test="${absence.type == 'SICK'}">Maladie</c:when>
                                                            <c:when test="${absence.type == 'TRAINING'}">Formation</c:when>
                                                            <c:otherwise>Autre</c:otherwise>
                                                        </c:choose>
                                                    </span>

                                                    <span class="text-base font-extrabold text-slate-800">
                                                        Du ${absence.startDate} au ${absence.endDate}
                                                    </span>
                                                </div>

                                                <!-- Motif -->
                                                <p class="text-xs text-slate-600">
                                                    <span class="font-semibold text-slate-700">Motif :</span>
                                                    <c:out value="${not empty absence.reason ? absence.reason : 'Aucun motif spécifié'}"/>
                                                </p>
                                            </div>

                                            <!-- Bouton Supprimer -->
                                            <form action="${pageContext.request.contextPath}/doctor/absences/delete" method="post"
                                                  onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer cette déclaration d\'absence ?');">
                                                <input type="hidden" name="id" value="${absence.id}"/>
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
                                <!-- Aucune absence enregistrée -->
                                <div class="text-center py-12 text-slate-400">
                                    <svg class="w-12 h-12 mx-auto text-slate-300 mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                                    </svg>
                                    <p class="text-sm font-medium">Aucune absence enregistrée pour le moment.</p>
                                    <p class="text-xs mt-1 text-slate-400">Remplissez le formulaire à gauche pour déclarer une période d'absence.</p>
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