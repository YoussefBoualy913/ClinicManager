<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rendez-vous Confirmé | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="h-screen flex flex-col font-sans antialiased text-slate-800 overflow-hidden">

<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="flex-grow flex overflow-hidden">

    <main class="flex-grow p-6 lg:p-8 overflow-y-auto h-full flex items-center justify-center">
        <div class="bg-white rounded-2xl border border-slate-200 shadow-sm p-8 max-w-lg w-full text-center space-y-6">

            <div class="w-16 h-16 bg-emerald-100 text-emerald-600 rounded-full flex items-center justify-center mx-auto">
                <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
            </div>

            <h1 class="text-2xl font-bold text-slate-900">Rendez-vous réservé avec succès !</h1>
            <p class="text-sm text-slate-500">Votre réservation a bien été enregistrée. Vous pouvez consulter les détails dans votre espace personnel à tout moment.</p>

            <div class="pt-4 flex flex-col sm:flex-row gap-3 justify-center">
                <a href="${pageContext.request.contextPath}/patient/appointments" class="px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-semibold text-sm rounded-xl shadow-sm transition-colors">
                    Consulter mes rendez-vous
                </a>
                <a href="${pageContext.request.contextPath}/patient/dashboard" class="px-5 py-2.5 bg-slate-100 hover:bg-slate-200 text-slate-700 font-semibold text-sm rounded-xl transition-colors">
                    Retour au tableau de bord
                </a>
            </div>
        </div>
    </main>

</div>

</body>
</html>