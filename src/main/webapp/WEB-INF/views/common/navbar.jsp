<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Détection de la page active -->
<c:set var="uri" value="${pageContext.request.requestURI}" />
<c:set var="isLogin" value="${uri.endsWith('/login') || uri.contains('/login.jsp')}" />
<c:set var="isRegister" value="${uri.contains('/register') || uri.contains('/register')}" />

<!-- Navbar Fixe (sticky top-0 z-50) -->
<header class="sticky top-0 z-50 bg-white border-b border-slate-200">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">

    <!-- Logo / Marque -->
    <a href="${pageContext.request.contextPath}/" class="text-xl font-bold text-slate-800 flex items-center gap-2">
      <span class="text-blue-600">Clinic</span>Manager
    </a>

    <!-- Boutons d'action -->
    <div class="flex items-center gap-3">
      <c:choose>
        <%-- Si l'utilisateur est connecté --%>
        <c:when test="${not empty sessionScope.user}">
          <a href="${pageContext.request.contextPath}/dashboard"
             class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold rounded-lg transition-colors">
            Mon Espace
          </a>
          <a href="${pageContext.request.contextPath}/logout"
             class="px-4 py-2 bg-slate-100 hover:bg-slate-200 text-slate-700 text-sm font-semibold rounded-lg transition-colors">
            Déconnexion
          </a>
        </c:when>

        <%-- Si l'utilisateur n'est pas connecté --%>
        <c:otherwise>

          <!-- Bouton Connexion -->
          <a href="${pageContext.request.contextPath}/login"
             class="px-4 py-2 text-sm font-semibold rounded-lg transition-colors
                    ${isLogin ? 'bg-blue-600 text-white shadow-sm' : 'bg-slate-100 hover:bg-slate-200 text-slate-700'}">
            Se connecter
          </a>

          <!-- Bouton Inscription -->
          <a href="${pageContext.request.contextPath}/register"
             class="px-4 py-2 text-sm font-semibold rounded-lg transition-colors
                    ${isRegister ? 'bg-blue-600 text-white shadow-sm' : 'bg-slate-100 hover:bg-slate-200 text-slate-700'}">
            S'inscrire
          </a>

        </c:otherwise>
      </c:choose>
    </div>

  </div>
</header>