<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-50">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inscription - Choix du profil | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-col min-h-full font-sans antialiased">

<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<main class="flex-grow flex items-center justify-center container mx-auto px-4 py-12">
    <div class="max-w-2xl w-full">
        <div class="text-center mb-10">
            <h1 class="text-3xl font-extrabold text-slate-900 mb-2">Créer un compte</h1>
            <p class="text-slate-600">Choisissez votre profil pour accéder à votre formulaire d'inscription :</p>
        </div>

        <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

        <div class="grid md:grid-cols-2 gap-6">
            <!-- Carte Patient -->
            <a href="${pageContext.request.contextPath}/register?role=patient"
               class="p-8 bg-white rounded-2xl shadow-sm hover:shadow-md transition-all border border-slate-200 flex flex-col items-center text-center group hover:border-blue-500">
                <div class="w-16 h-16 bg-blue-100 text-blue-600 rounded-2xl flex items-center justify-center mb-4 group-hover:bg-blue-600 group-hover:text-white transition-colors">
                    <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                </div>
                <h2 class="text-xl font-bold text-slate-800 mb-2">Espace Patient</h2>
                <p class="text-slate-500 text-sm">Prenez rendez-vous en ligne et suivez votre historique médical.</p>
            </a>

            <!-- Carte Médecin -->
            <a href="${pageContext.request.contextPath}/register?role=doctor"
               class="p-8 bg-white rounded-2xl shadow-sm hover:shadow-md transition-all border border-slate-200 flex flex-col items-center text-center group hover:border-emerald-500">
                <div class="w-16 h-16 bg-emerald-100 text-emerald-600 rounded-2xl flex items-center justify-center mb-4 group-hover:bg-emerald-600 group-hover:text-white transition-colors">
                    <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                </div>
                <h2 class="text-xl font-bold text-slate-800 mb-2">Espace Médecin</h2>
                <p class="text-slate-500 text-sm">Gérez votre agenda, vos créneaux et rédigez des notes médicales.</p>
            </a>
        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>