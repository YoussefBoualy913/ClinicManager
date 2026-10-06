<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-50">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inscription Patient | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col min-h-full font-sans antialiased">

<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<main class="flex-grow container mx-auto px-4 py-10 max-w-2xl">
    <div class="bg-white p-8 rounded-2xl shadow-sm border border-slate-200">
        <div class="mb-6 border-b border-slate-100 pb-4">
            <h1 class="text-2xl font-bold text-slate-900">Inscription Patient</h1>
            <p class="text-sm text-slate-500">Complétez vos informations pour créer votre dossier médical.</p>
        </div>

        <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

        <form action="${pageContext.request.contextPath}/register" method="post" class="space-y-6">
            <input type="hidden" name="role" value="PATIENT"/>

            <!-- Informations Personnelles (User) -->
            <div>
                <h2 class="text-xs font-semibold text-blue-600 uppercase tracking-wider mb-3">Informations de compte</h2>
                <div class="grid sm:grid-cols-2 gap-4">
                    <div>
                        <label for="firstName" class="block text-sm font-medium text-slate-700 mb-1">Prénom *</label>
                        <input type="text" id="firstName" name="firstName" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm"/>
                    </div>
                    <div>
                        <label for="lastName" class="block text-sm font-medium text-slate-700 mb-1">Nom *</label>
                        <input type="text" id="lastName" name="lastName" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm"/>
                    </div>
                </div>

                <div class="grid sm:grid-cols-2 gap-4 mt-4">
                    <div>
                        <label for="email" class="block text-sm font-medium text-slate-700 mb-1">Email *</label>
                        <input type="email" id="email" name="email" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm"/>
                    </div>
                    <div>
                        <label for="phone" class="block text-sm font-medium text-slate-700 mb-1">Téléphone *</label>
                        <input type="tel" id="phone" name="phone" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm"/>
                    </div>
                </div>

                <div class="mt-4">
                    <label for="password" class="block text-sm font-medium text-slate-700 mb-1">Mot de passe * (min. 6 caractères)</label>
                    <input type="password" id="password" name="password" minlength="6" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm"/>
                </div>
            </div>

            <hr class="border-slate-100"/>

            <!-- Informations Médicales & Administratives (Patient) -->
            <div>
                <h2 class="text-xs font-semibold text-blue-600 uppercase tracking-wider mb-3">Informations Médicales</h2>

                <div class="grid sm:grid-cols-2 gap-4">
                    <div>
                        <label for="cin" class="block text-sm font-medium text-slate-700 mb-1">CIN *</label>
                        <input type="text" id="cin" name="cin" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm"/>
                    </div>
                    <div>
                        <label for="birthDate" class="block text-sm font-medium text-slate-700 mb-1">Date de naissance *</label>
                        <input type="date" id="birthDate" name="birthDate" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm"/>
                    </div>
                </div>

                <div class="grid sm:grid-cols-2 gap-4 mt-4">
                    <div>
                        <label for="gender" class="block text-sm font-medium text-slate-700 mb-1">Genre *</label>
                        <select id="gender" name="gender" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm">
                            <option value="">-- Sélectionner --</option>
                            <option value="MALE">Homme</option>
                            <option value="FEMALE">Femme</option>
                            <option value="OTHER">Autre</option>
                        </select>
                    </div>
                    <div>
                        <label for="bloodGroup" class="block text-sm font-medium text-slate-700 mb-1">Groupe Sanguin</label>
                        <select id="bloodGroup" name="bloodGroup" class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm">
                            <option value="">-- Non spécifié --</option>
                            <option value="A_POS">A+</option>
                            <option value="A_NEG">A-</option>
                            <option value="A_NEG">B+</option>
                            <option value="B_NEG">B-</option>
                            <option value="AB_POS">AB+</option>
                            <option value="AB_NEG">AB-</option>
                            <option value="O_POS">O+</option>
                            <option value="O_NEG">O-</option>
                        </select>
                    </div>
                </div>

                <div class="mt-4">
                    <label for="address" class="block text-sm font-medium text-slate-700 mb-1">Adresse *</label>
                    <input type="text" id="address" name="address" required class="w-full px-3 py-2 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm"/>
                </div>

            </div>

            <button type="submit" class="w-full py-3 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-lg shadow-sm transition-colors text-sm">
                S'inscrire comme Patient
            </button>
        </form>
    </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>