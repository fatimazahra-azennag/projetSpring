<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>
    <title>ENSIAS-DOC</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="inc/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/duotone.css"
          integrity="sha384-R3QzTxyukP03CMqKFe0ssp5wUvBPEyy9ZspCB+Y01fEjhMwcXixTyeot+S40+AjZ" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/fontawesome.css"
          integrity="sha384-eHoocPgXsiuZh+Yy6+7DsKAerLXyJmu2Hadh4QYyt+8v86geixVYwFqUvMU8X90l" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="/inc/styles/core.css">
    <link rel="stylesheet" type="text/css" href="/inc/styles/style.css">
    <link rel="stylesheet" href="/inc/styles/style_inscription.css">
    <link rel="stylesheet" type="text/css" href="/inc/styles/style_module.css">
    <link rel="stylesheet" href="/inc/styles/style_home.css">
    <link rel="stylesheet" href="/inc/styles/style_barre.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/js/tether.min.js"></script>

    <link rel="icon" href="/inc/icons/logo.ico">
</head>


<body>

<div id="wrapper" class="toggled">
    <div class="overlay"></div>

    <!-- Sidebar -->
    <nav class="navbar navbar-inverse fixed-top" id="sidebar-wrapper" role="navigation" style="margin-top: 75px;">

        <ul class="nav sidebar-nav" style="list-style-type: none;">
            <div class="sidebar-header">
                <center class="logo-user">
                    <svg xmlns="http://www.w3.org/2000/svg" width="60%" height="141.747" viewBox="0 0 153 141.747"
                         style="margin-bottom: 10px;margin-top: 5%;">
                        <path id="user-circle-solid"
                              d="M76.5,8C34.24,8,0,39.722,0,78.874s34.24,70.874,76.5,70.874S153,118.026,153,78.874,118.76,8,76.5,8Zm0,27.435c14.992,0,27.145,11.26,27.145,25.149S91.492,85.732,76.5,85.732,49.355,74.473,49.355,60.584,61.508,35.435,76.5,35.435Zm0,98.309a61.1,61.1,0,0,1-45.191-19.49,34.812,34.812,0,0,1,30.384-17.09,8.1,8.1,0,0,1,2.19.314,41.346,41.346,0,0,0,25.233,0,8.1,8.1,0,0,1,2.19-.314,34.812,34.812,0,0,1,30.384,17.09A61.1,61.1,0,0,1,76.5,133.744Z"
                              transform="translate(0 -8)" fill="rgba(0,0,0,0.52)" />
                    </svg>
                </center>
                <div class="sidebar-brand" >

                    <a href="/ensiasdocs/profile">${user.firstName } ${user.lastName }</a>
                </div>
            </div>
            <li><a href="/ensiasdocs/home"><i class="fas fa-book" style="margin-right:10px;"></i>Module</a></li>
            <li><a href="/ensiasdocs/profile"><i class="fas fa-user-graduate" style="margin-right:10px;"></i></i>Profil</a></li>
            <li><a href="/ensiasdocs/calendrier"><i class="fas fa-calendar-alt" style="margin-right:10px;"></i>Calendrier</a></li>
            <li><a href="/ensiasdocs/todo"><i class="fas fa-list-alt" style="margin-right:10px;"></i>To Do</a></li>
            <c:if test="${sessionScope.user.administrator }">
                <li><a href="/ensiasdocs/admin" ><i class="fas fa-user-cog" style="margin-right:10px;"></i>Administrateur</a></li>
            </c:if>
            </li>
        </ul>
        <a class="navbar-brand" href=""><img src="/inc/images/logo.png" alt="ENSIAS-DOC" width="200"
                                             style="position: absolute;bottom: 100px;"></a>
    </nav>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <c:import url="/WEB-INF/header.jsp"></c:import>

        <div class="container align-self-center">
            <div class="min-vh-100">
                <div class="row justify-content-center">
                    <div class="col-lg-12 col-md-12 col-sm-12 carte module-name-bloc">
                        <div class="card text-white bg-light mb-3">
                            <center>
                                <div class="card-header module-name">${module.elmName}</div>
                            </center>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${!inscrit }">
                            <!-- Si l'étudiant n'est pas inscrit au module -->
                            <div class="col-lg-12 col-md-12 col-sm-12 carte">
                                <div class="card text-white mb-3">
                                    <div class="card-header section-header"><i class="far fa-plus-square" style="margin-right: 15px;"></i>Ajouter à mes modules</div>
                                    <div class="card-body bg-warning" style="padding-left: 100px;padding-right: 100px;font-size: 18px;">
                                        <center>
                                            <p>
                                                Vous ne pouvez pas accéder à ce module car vous n'êtes pas encore inscrit.
                                                Afin de bénéficier des documents de ce module et avoir un accès totale sur tous ses ressources pédagogiques,
                                                <br/><strong style="font-size: 22px;">veuillez s'abonner rapidement !!!</strong>
                                            </p>
                                            <form:form action="abonner" method="post">
                                                <input name = "id" value="${ module.elm_id }" class ="d-none" />
                                                <button type="submit" class="btn btn-success"><i class="fas fa-star" style="margin-right: 15px;"></i>S'abonner</button>
                                            </form:form>
                                        </center>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- Si l'étudiant est inscrit au module -->
                            <div class="col-lg-12 col-md-12 col-sm-12 carte">
                                <div class="card text-white bg-secondary mb-3">
                                    <div class="card-header section-header"><i class="fas fa-graduation-cap"
                                                                               style="margin-right: 12px;"></i>Documets</div>
                                    <div class="card-body">

                                        <c:forEach items="${ types }" var="type">
                                            <h5 class="type-title"><i class="fas fa-hand-point-right" style="margin-right: 7px;"></i>${type}</h5>
                                            <c:forEach items="${ docs }" var="doc">
                                                <c:choose>
                                                    <c:when test="${doc.docType == type }">
                                                        <div class="bloc-file">
                                                            <a class="file-title" href="/ensiasdocs/document/${ doc.doc_id }"><i class="fas fa-file-pdf"
                                                                                                                                 style="margin-right: 7px;"></i>${ doc.docName}</a>
                                                            <div style="float:right;">
                                                                <a href="/files/${ doc.doc_id }"><button class="button-show btn-telecharger"><i
                                                                        class="fa fa-download" style="margin-right: 5px;"></i><span>Télécharger
                                    </span></button></a>
                                                                <a href="/ensiasdocs/document?idDoc=${doc.doc_id}"><button class="button-show btn-visualiser"><i
                                                                        class="fas fa-eye" style="margin-right: 5px;"></i><span>Visualiser </span></button></a>
                                                            </div>

                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>

        </div>

        <c:import url="/WEB-INF/footer.jsp"></c:import>
    </div>
    <!-- /#page-content-wrapper -->
</div>

<script src="/inc/js/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/inc/js/main.js"></script>
<script src="/inc/js/barre.js"></script>
</body>

</html>