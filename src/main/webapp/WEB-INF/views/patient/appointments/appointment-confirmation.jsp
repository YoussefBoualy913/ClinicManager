<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="fr" class="h-full bg-slate-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation du Rendez-vous | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="h-screen flex flex-col font-sans antialiased text-slate-800 overflow-hidden">

<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<div class="flex-grow flex overflow-hidden">

    <aside class="w-64 bg-slate-900 text-slate-300 hidden md:flex flex-col p-4 space-y-6 flex-shrink-0 h-full overflow-y-auto">
        <div class="text-xs font-semibold text-slate-500 uppercase tracking-wider px-3">Espace Patient</div>
        <nav class="space-y-1">
            <a href="${pageContext.request.contextPath}/patient/dashboard" class="flex items-center gap-3 px-3 py-2.5 hover:bg-slate-800 hover:text-white rounded-lg text-sm font-medium transition-colors">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 00-1-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
                Tableau de bord
            </a>
            <a href="${pageContext.request.contextPath}/patient/appointments" class="flex items-center gap-3 px-3 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium shadow-sm">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                Mes Rendez-vous
            </a>
        </nav>
    </aside>

    <main class="flex-grow p-6 lg:p-8 overflow-y-auto h-full">
        <div class="max-w-3xl mx-auto w-full">

            <jsp:include page="/WEB-INF/views/patient/appointments/steps-wizard.jsp">
                <jsp:param name="currentStep" value="5" />
            </jsp:include>

            <div class="mb-6">
                <h1 class="text-2xl font-bold text-slate-900">Étape 5 : Récapitulatif et Confirmation</h1>
                <p class="text-sm text-slate-500">Veuillez vérifier les informations ci-dessous avant de valider votre réservation.</p>
            </div>

            <jsp:include page="/WEB-INF/views/common/messages.jsp"/>

            <form action="${pageContext.request.contextPath}/patient/appointments/confirm" method="post" class="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 lg:p-8 space-y-6 mb-12">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 pb-6 border-b border-slate-100">
                    <div class="p-4 bg-slate-50 rounded-xl">
                        <span class="text-xs font-semibold text-slate-400 uppercase tracking-wider block mb-1">Spécialité</span>
                        <p class="text-base font-bold text-slate-900"><c:out value="${selectedSpecialty.name}"/></p>
                    </div>

                    <div class="p-4 bg-slate-50 rounded-xl">
                        <span class="text-xs font-semibold text-slate-400 uppercase tracking-wider block mb-1">Médecin</span>
                        <p class="text-base font-bold text-slate-900">Dr. <c:out value="${selectedDoctor.firstName}"/> <c:out value="${selectedDoctor.lastName}"/></p>
                    </div>

                    <div class="p-4 bg-slate-50 rounded-xl">
                        <span class="text-xs font-semibold text-slate-400 uppercase tracking-wider block mb-1">Date</span>
                        <p class="text-base font-bold text-slate-900">${selectedDate.dayOfMonth}/${selectedDate.monthValue}/${selectedDate.year}</p>
                    </div>

                    <div class="p-4 bg-slate-50 rounded-xl">
                        <span class="text-xs font-semibold text-slate-400 uppercase tracking-wider block mb-1">Horaire</span>
                        <p class="text-base font-bold text-emerald-600"><c:out value="${selectedTime}"/></p>
                    </div>
                </div>

                <div>
                    <label for="reason" class="block text-sm font-medium text-slate-700 mb-1">Motif de la consultation <span class="text-xs text-slate-400 font-normal">(Optionnel)</span></label>
                    <textarea id="reason" name="reason" rows="3" placeholder="Description rapide de vos symptômes ou besoins..."
                              class="w-full px-4 py-2.5 rounded-xl border border-slate-300 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none text-sm resize-none"></textarea>
                </div>

                <div class="flex items-center justify-between pt-4 border-t border-slate-100">
                    <a href="${pageContext.request.contextPath}/patient/appointments/date" class="px-5 py-2.5 bg-slate-100 hover:bg-slate-200 text-slate-700 font-semibold text-sm rounded-xl transition-colors">
                        ← Modifier mes choix
                    </a>

                    <button type="submit" class="px-6 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white font-semibold text-sm rounded-xl shadow-sm transition-colors flex items-center gap-2">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
                        Confirmer le rendez-vous
                    </button>
                </div>
            </form>

            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        </div>
    </main>

</div>

</body>
</html>