<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Profil | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="h-screen flex flex-col font-sans antialiased text-slate-800 overflow-hidden">

<!-- 1. NAVBAR FIXE EN HAUT -->
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<!-- 2. CONTENEUR PRINCIPAL FIXÉ EN HAUTEUR -->
<div class="flex-grow flex overflow-hidden">

    <!-- Navigation Latérale (Sidebar Patient Fixe) -->
    <aside class="w-64 bg-slate-900 text-slate-300 hidden md:flex flex-col p-4 space-y-6 flex-shrink-0 h-full overflow-y-auto">
        <div class="text-xs font-semibold text-slate-500 uppercase tracking-wider px-3">Espace Patient</div>
        <nav class="space-y-1">
            <a href="${pageContext.request.contextPath}/patient/dashboard"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 00-1-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
                Tableau de bord
            </a>
            <a href="${pageContext.request.contextPath}/patient/appointments"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                Mes Rendez-vous
            </a>
            <a href="${pageContext.request.contextPath}/patient/medical-record"
               class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                Dossier Médical
            </a>
            <a href="${pageContext.request.contextPath}/patient/profile"
               class="flex items-center gap-3 px-3 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium shadow-sm">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
                Mon Profil
            </a>
        </nav>
    </aside>

    <!-- Contenu Principal (Défilement indépendant) -->
    <main class="flex-grow p-6 lg:p-8 overflow-y-auto h-full">
        <div class="max-w-5xl mx-auto w-full">

            <!-- En-tête -->
            <div class="mb-8">
                <h1 class="text-2xl font-bold text-slate-900">Mon Profil</h1>
                <p class="text-sm text-slate-500">Gérez vos informations personnelles et préférences de compte.</p>
            </div>

            <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

            <div class="space-y-8 pb-12">

                <!-- Carte 1 : Informations Personnelles -->
                <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 lg:p-8">
                    <div class="flex items-center gap-4 mb-6 pb-4 border-b border-slate-100">
                        <div class="w-12 h-12 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center font-bold text-xl">
                            ${sessionScope.user.firstName.substring(0,1)}${sessionScope.user.lastName.substring(0,1)}
                        </div>
                        <div>
                            <h2 class="text-lg font-bold text-slate-900">${patient.firstName} ${patient.lastName}</h2>
                            <p class="text-xs text-slate-500">Patient - Inscrit le  ${sessionScope.createdAtFormated} </p>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/patient/profile" method="post" class="space-y-6">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                            <!-- Prénom -->
                            <div>
                                <label for="firstName" class="block text-sm font-medium text-slate-700 mb-1">Prénom</label>
                                <input type="text" id="firstName" name="firstName" value="${patient.firstName}" required
                                       class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                            </div>

                            <!-- Nom -->
                            <div>
                                <label for="lastName" class="block text-sm font-medium text-slate-700 mb-1">Nom</label>
                                <input type="text" id="lastName" name="lastName" value="${patient.lastName}" required
                                       class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                            </div>

                            <!-- Email -->
                            <div>
                                <label for="email" class="block text-sm font-medium text-slate-700 mb-1">Adresse Email</label>
                                <input type="email" id="email" name="email" value="${patient.email}" required
                                       class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                            </div>

                            <!-- Téléphone -->
                            <div>
                                <label for="phone" class="block text-sm font-medium text-slate-700 mb-1">Téléphone</label>
                                <input type="tel" id="phone" name="phone" value="${patient.phone}" placeholder="06 00 00 00 00"
                                       class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                            </div>

                            <!-- Date de naissance -->
                            <div>
                                <label for="birthDate" class="block text-sm font-medium text-slate-700 mb-1">Date de naissance</label>
                                <input type="date" id="birthDate" name="birthDate" value="${patient.birthDate}"
                                       class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                            </div>

                            <!-- Adresse -->
                            <div>
                                <label for="address" class="block text-sm font-medium text-slate-700 mb-1">Adresse</label>
                                <input type="text" id="address" name="address" value="${patient.address}" placeholder="123 Rue de la Santé"
                                       class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                            </div>
                             <div>
                                                            <label for="cin" class="block text-sm font-medium text-slate-700 mb-1">CIN</label>
                                                            <input type="text" id="cin" name="cin" value="${patient.cin}" placeholder="123 Rue de la Santé"
                                                                   class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                                                        </div>

                        </div>

                        <div class="flex justify-end pt-4">
                            <button type="submit"
                                    class="px-6 py-2.5 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold rounded-lg shadow-sm transition-colors">
                                Enregistrer les modifications
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Carte 2 : Informations Médicales de Base -->
                <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 lg:p-8">
                    <h2 class="text-lg font-bold text-slate-900 mb-4 pb-2 border-b border-slate-100">Informations Médicales</h2>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="p-4 bg-slate-50 rounded-xl border border-slate-200">
                            <span class="text-xs font-semibold text-slate-400 uppercase tracking-wider block mb-1">Groupe Sanguin</span>
                            <p class="text-lg font-bold text-slate-800">${patient.bloodGroup != null ? patient.bloodGroup : 'Non spécifié'}</p>
                        </div>
                    </div>
                </div>

                <!-- Carte 3 : Changement de Mot de Passe -->
                <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 lg:p-8">
                    <h2 class="text-lg font-bold text-slate-900 mb-4 pb-2 border-b border-slate-100">Sécurité du compte</h2>

                    <form action="${pageContext.request.contextPath}/patient/profile/password" method="post" class="space-y-6 max-w-xl">

                        <div>
                            <label for="currentPassword" class="block text-sm font-medium text-slate-700 mb-1">Mot de passe actuel</label>
                            <input type="password" id="currentPassword" name="currentPassword" required
                                   class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                        </div>

                        <div>
                            <label for="newPassword" class="block text-sm font-medium text-slate-700 mb-1">Nouveau mot de passe</label>
                            <input type="password" id="newPassword" name="newPassword" required minlength="6"
                                   class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                        </div>

                        <div>
                            <label for="confirmPassword" class="block text-sm font-medium text-slate-700 mb-1">Confirmer le nouveau mot de passe</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" required minlength="6"
                                   class="w-full px-4 py-2.5 rounded-lg border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none transition-all text-sm"/>
                        </div>
                        <c:if test="${not empty error}">
                            <div class="mb-6 p-4 rounded-lg bg-red-50 border border-red-200 text-red-700 text-sm">
                                ${error}
                            </div>
                        </c:if>
                        <div class="pt-2">
                            <button type="submit"
                                    class="px-6 py-2.5 bg-slate-800 hover:bg-slate-900 text-white text-sm font-semibold rounded-lg shadow-sm transition-colors">
                                Changer le mot de passe
                            </button>
                        </div>

                    </form>
                </div>

            </div>

            <!-- Footer intégré à la fin du scroll du contenu -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        </div>
    </main>

</div>

</body>
</html>