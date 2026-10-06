<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-50">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inscription Médecin | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col min-h-full font-sans antialiased">

<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<main class="flex-grow container mx-auto px-4 py-10 max-w-2xl">
    <div class="bg-white p-8 rounded-2xl shadow-sm border border-slate-200">
        <div class="mb-6 border-b border-slate-100 pb-4">
            <h1 class="text-2xl font-bold text-slate-900">Inscription Médecin</h1>
            <p class="text-sm text-slate-500">Renseignez vos identifiants professionnels pour être rattaché à votre service.</p>
        </div>

        <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

        <form action="${pageContext.request.contextPath}/register" method="post" class="space-y-6">
            <input type="hidden" name="role" value="DOCTOR"/>

            <!-- Informations Compte (User) -->
            <div>
                <h2 class="text-xs font-semibold text-emerald-600 uppercase tracking-wider mb-3">Informations personnelles</h2>

                <div class="grid sm:grid-cols-3 gap-4">
                    <div>
                        <label for="title" class="block text-sm font-medium text-slate-700 mb-1">Titre *</label>
                        <select id="title" name="title" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:outline-none text-sm">
                            <option value="GENERAL_PRACTITIONER">General practitioner</option>
                            <option value="PROFESSOR">Pr.</option>
                            <option value="SPECIALIST">Specailist</option>
                        </select>
                    </div>
                    <div>
                        <label for="firstName" class="block text-sm font-medium text-slate-700 mb-1">Prénom *</label>
                        <input type="text" id="firstName" name="firstName" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:outline-none text-sm"/>
                    </div>
                    <div>
                        <label for="lastName" class="block text-sm font-medium text-slate-700 mb-1">Nom *</label>
                        <input type="text" id="lastName" name="lastName" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:outline-none text-sm"/>
                    </div>
                </div>

                <div class="grid sm:grid-cols-2 gap-4 mt-4">
                    <div>
                        <label for="email" class="block text-sm font-medium text-slate-700 mb-1">Email Professionnel *</label>
                        <input type="email" id="email" name="email" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:outline-none text-sm"/>
                    </div>
                    <div>
                        <label for="phone" class="block text-sm font-medium text-slate-700 mb-1">Téléphone Direct *</label>
                        <input type="tel" id="phone" name="phone" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:outline-none text-sm"/>
                    </div>
                </div>

                <div class="mt-4">
                    <label for="password" class="block text-sm font-medium text-slate-700 mb-1">Mot de passe * (min. 6 caractères)</label>
                    <input type="password" id="password" name="password" minlength="6" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:outline-none text-sm"/>
                </div>
            </div>

            <hr class="border-slate-100"/>

            <!-- Informations Professionnelles (Doctor) -->
            <div>
                <h2 class="text-xs font-semibold text-emerald-600 uppercase tracking-wider mb-3">Affectation & Spécialité</h2>

                <div class="grid sm:grid-cols-2 gap-4">
                    <div>
                        <label for="matricule" class="block text-sm font-medium text-slate-700 mb-1">Matricule / Ordre RPPS *</label>
                        <input type="text" id="matricule" name="matricule" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:outline-none text-sm"/>
                    </div>
                    <div>
                                            <label for="specialtyId" class="block text-sm font-medium text-slate-700 mb-1">Spécialité *</label>
                                            <select id="specialtyId" name="specialtyId" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:outline-none text-sm">
                                                <option value="">-- Choisir une spécialité --</option>
                                                <c:forEach var="specialty" items="${specialties}">
                                                    <option value="${specialty.id}">${specialty.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                </div>


            </div>

            <button type="submit" class="w-full py-3 bg-emerald-600 hover:bg-emerald-700 text-white font-bold rounded-lg shadow-sm transition-colors text-sm">
                S'inscrire comme Médecin
            </button>
        </form>
    </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>