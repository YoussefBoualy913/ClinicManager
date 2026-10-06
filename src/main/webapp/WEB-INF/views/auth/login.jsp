<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-50">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col min-h-full font-sans antialiased">

<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<main class="flex-grow flex items-center justify-center container mx-auto px-4 py-12">
    <div class="max-w-md w-full bg-white p-8 rounded-2xl shadow-sm border border-slate-200">

        <!-- En-tête du formulaire -->
        <div class="text-center mb-8">
            <div class="inline-flex items-center justify-center w-12 h-12 rounded-full bg-blue-100 text-blue-600 mb-3">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"></path>
                </svg>
            </div>
            <h1 class="text-2xl font-bold text-slate-900">Se connecter</h1>
            <p class="text-sm text-slate-500 mt-1">Accédez à votre espace ClinicManager</p>
        </div>

        <!-- Notification de succès d'inscription -->
        <c:if test="${param.registered == 'true'}">
            <div class="mb-6 p-4 rounded-lg bg-emerald-50 border border-emerald-200 text-emerald-800 text-sm flex items-center gap-2">
                <svg class="w-5 h-5 text-emerald-600 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                </svg>
                <span>Inscription réussie ! Vous pouvez maintenant vous connecter.</span>
            </div>
        </c:if>

        <!-- Affichage des messages d'erreur génériques -->
        <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

        <!-- Formulaire de connexion -->
        <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-5">

            <div>
                <label for="email" class="block text-sm font-medium text-slate-700 mb-1">Adresse Email</label>
                <div class="relative">
                    <input type="email" id="email" name="email" required
                           placeholder="exemple@domaine.com"
                           class="w-full pl-10 pr-3 py-2.5 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm text-slate-800 transition-all"/>
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-slate-400">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v15a3 3 0 006 0v-1a10 10 0 10-10 10 shadow-2xl"></path>
                        </svg>
                    </div>
                </div>
            </div>

            <div>
                <div class="flex items-center justify-between mb-1">
                    <label for="password" class="block text-sm font-medium text-slate-700">Mot de passe</label>
                    <a href="${pageContext.request.contextPath}/forgot-password" class="text-xs font-semibold text-blue-600 hover:text-blue-700">
                        Mot de passe oublié ?
                    </a>
                </div>
                <div class="relative">
                    <input type="password" id="password" name="password" required
                           placeholder="••••••••"
                           class="w-full pl-10 pr-3 py-2.5 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm text-slate-800 transition-all"/>
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-slate-400">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                        </svg>
                    </div>
                </div>
            </div>

            <div class="flex items-center justify-between text-sm">
                <label class="flex items-center gap-2 cursor-pointer">
                    <input type="checkbox" name="rememberMe" class="w-4 h-4 text-blue-600 border-slate-300 rounded focus:ring-blue-500">
                    <span class="text-slate-600">Se souvenir de moi</span>
                </label>
            </div>

            <button type="submit"
                    class="w-full py-3 px-4 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg shadow-sm transition-colors text-sm focus:ring-2 focus:ring-blue-500 focus:ring-offset-2">
                Se connecter
            </button>
        </form>

        <!-- Pied de carte : Lien vers l'inscription -->
        <div class="mt-8 pt-6 border-t border-slate-100 text-center text-sm text-slate-600">
            Vous n'avez pas de compte ?
            <a href="${pageContext.request.contextPath}/register" class="font-semibold text-blue-600 hover:text-blue-700">
                Créer un compte
            </a>
        </div>

    </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>