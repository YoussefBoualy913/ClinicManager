<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="step" value="${param.currentStep}" />

<div class="bg-white rounded-2xl border border-slate-200 p-4 mb-6 shadow-sm">
    <div class="flex items-center justify-between max-w-3xl mx-auto text-xs font-semibold text-slate-500">

        <!-- Étape 1 -->
        <div class="flex flex-col items-center gap-1.5 ${step >= 1 ? 'text-blue-600' : 'text-slate-400'}">
            <div class="w-8 h-8 rounded-full flex items-center justify-center font-bold text-sm ${step >= 1 ? 'bg-blue-600 text-white shadow-sm' : 'bg-slate-100 text-slate-400'}">1</div>
            <span class="hidden sm:inline">Spécialité</span>
        </div>

        <div class="flex-grow h-0.5 mx-2 ${step > 1 ? 'bg-blue-600' : 'bg-slate-200'}"></div>

        <!-- Étape 2 -->
        <div class="flex flex-col items-center gap-1.5 ${step >= 2 ? 'text-blue-600' : 'text-slate-400'}">
            <div class="w-8 h-8 rounded-full flex items-center justify-center font-bold text-sm ${step >= 2 ? 'bg-blue-600 text-white shadow-sm' : 'bg-slate-100 text-slate-400'}">2</div>
            <span class="hidden sm:inline">Médecin</span>
        </div>

        <div class="flex-grow h-0.5 mx-2 ${step > 2 ? 'bg-blue-600' : 'bg-slate-200'}"></div>

        <!-- Étape 3 -->
        <div class="flex flex-col items-center gap-1.5 ${step >= 3 ? 'text-blue-600' : 'text-slate-400'}">
            <div class="w-8 h-8 rounded-full flex items-center justify-center font-bold text-sm ${step >= 3 ? 'bg-blue-600 text-white shadow-sm' : 'bg-slate-100 text-slate-400'}">3</div>
            <span class="hidden sm:inline">Date</span>
        </div>

        <div class="flex-grow h-0.5 mx-2 ${step > 3 ? 'bg-blue-600' : 'bg-slate-200'}"></div>

        <!-- Étape 4 -->
        <div class="flex flex-col items-center gap-1.5 ${step >= 4 ? 'text-blue-600' : 'text-slate-400'}">
            <div class="w-8 h-8 rounded-full flex items-center justify-center font-bold text-sm ${step >= 4 ? 'bg-blue-600 text-white shadow-sm' : 'bg-slate-100 text-slate-400'}">4</div>
            <span class="hidden sm:inline">Créneau</span>
        </div>

        <div class="flex-grow h-0.5 mx-2 ${step > 4 ? 'bg-blue-600' : 'bg-slate-200'}"></div>

        <!-- Étape 5 -->
        <div class="flex flex-col items-center gap-1.5 ${step >= 5 ? 'text-blue-600' : 'text-slate-400'}">
            <div class="w-8 h-8 rounded-full flex items-center justify-center font-bold text-sm ${step >= 5 ? 'bg-blue-600 text-white shadow-sm' : 'bg-slate-100 text-slate-400'}">5</div>
            <span class="hidden sm:inline">Confirmation</span>
        </div>

    </div>
</div>