
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<header>
    <c:choose>
        <c:when test="${!auth}">

            <nav class="navbar haut fixed-top">
                <div class="container">
                    <a class="navbar-brand" href="/"><img src="/inc/images/logo.png" alt="ENSIAS-DOC" width="200"></a>
                    <div>
                        <a class="btn btn-outline-primary mr-2" href="login"><span><i class="fas fa-user"></i></span>&nbsp;&nbsp;Log In</a>
                        <a class="btn btn-primary" href="register"><span><i class="fas fa-user-plus"></i></span>&nbsp;&nbsp;Sign Up</a></div>
                </div>
                </div>
            </nav>

        </c:when>
        <c:otherwise>

            <nav class="navbar haut fixed-top">
                <button type="button" class="hamburger animated fadeInLeft is-closed" data-toggle="offcanvas">
                    <span class="hamb-top"></span>
                    <span class="hamb-middle"></span>
                    <span class="hamb-bottom"></span>
                </button>
                <div class="container">
                    <a class="navbar-brand" href="/ensiasdocs/home"><img src="/inc/images/logo.png" alt="ENSIAS-DOC" width="200"></a>
                    <div>
                <span>
                <c:choose>
                    <c:when test="${user.isadmin==1}"><i class="fas fa-user-shield"></i></c:when>
                    <c:otherwise><i class="fas fa-user-circle"></i> </c:otherwise>
                </c:choose>
                </span><a href ="/ensiasdocs/profile" class="userName" ><strong>${user.firstName} ${user.lastName}</strong></a>
                        <a class="btn btn-danger" href="/logout"><span><i class="fas fa-sign-out-alt"></i></span>&nbsp;&nbsp;Logout</a>
                    </div>
            </nav>

        </c:otherwise>
    </c:choose>


</header>