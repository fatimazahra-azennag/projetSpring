<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% String[] bgs=new String[]{"card_image1.jpg","card_image2.jpg","card_image3.jpg"}; %>
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
  <link rel="stylesheet" href="/inc/styles/style_home.css">
  <link rel="stylesheet" type="text/css" href="/inc/styles/style_module.css">
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
        <div class="sidebar-brand">
          <a href="/ensiasdocs/profile">${user.firstName } ${user.lastName }</a>
        </div>
      </div>
      <li><a href="/ensiasdocs/home"><i class="fas fa-book" style="margin-right:10px;"></i>Module</a></li>
      <li><a href="/ensiasdocs/profile"><i class="fas fa-user-graduate" style="margin-right:10px;"></i></i>Profil</a>
      </li>
      <li><a href="/ensiasdocs/calendrier"><i class="fas fa-calendar-alt"
                                              style="margin-right:10px;"></i>Calendrier</a></li>
      <li><a href="/ensiasdocs/todo"><i class="fas fa-list-alt" style="margin-right:10px;"></i>To Do</a></li>

      </li>
      </li>
    </ul>
    <a class="navbar-brand" href=""><img src="/inc/images/logo.png" alt="ENSIAS-DOC" width="200"
                                         style="position: absolute;bottom: 100px;"></a>
  </nav>
  <!-- /#sidebar-wrapper -->

  <!-- Page Content -->
  <div id="page-content-wrapper">
    <c:import url="/WEB-INF/header.jsp"></c:import>

    <div class="container corps_home">
      <div class="container align-self-center">
        <div class="row justify-content-center">
          <center>
            <img src="/inc/images/logo.png" alt="ENSIAS-DOC" width="340" style="margin-bottom: 20px;"><br />
            <img class="image-learn" src="/inc/images/learning.jpg" alt="ENSIAS-DOC" width="100%" height="400">
            <img src="/inc/images/rechercher-logo.png" alt="ENSIAS-DOC" width="50"
                 style="margin-bottom: 20px;margin-right:0px; ">
            <img class="image-recherche" src="/inc/images/rechercher.png" alt="ENSIAS-DOC" width="340">
            <form:form action="home" method="get">
              <div class="input-group recherche"
                   style="width: 50%;box-shadow: 5px 5px 5px 5px grey;border-radius:30px;">
                <input type="search" class="form-control rounded" placeholder="Recherche module" aria-label="Search"
                       aria-describedby="search-addon" name="find" />
                <button type="submit" class="btn btn-outline-primary" style="border: none;">Rechercher</button>
              </div>
            </form:form>
          </center>
        </div>

        <div class="container align-self-center">
          <div class="row justify-content-center">
            <div class="grid">
              <% int i=0; %>
              <c:forEach items="${ modules }" var="module">

                <div class="grid__item">
                  <a href="/ensiasdocs/module/${module.elm_id}">

                    <div class="card"><img class="card__img" src="/inc/images/<%= bgs[i%bgs.length] %>"
                                           alt="Snowy Mountains">
                      <a href="/ensiasdocs/module/${module.elm_id}">
                        <div class="card__content">
                          <h1 class="card__header">${module.elmName}</h1>
                          <p class="card__text"> ${ module.elmDesc } </p><a
                                href="/ensiasdocs/module?idM=${module.elm_id}"> <button class="card__btn">Accéder
                          <span>&rarr;</span></button></a>
                        </div>
                      </a>
                    </div>
                  </a>
                </div>
                <% i++; %>
              </c:forEach>

            </div>
          </div>
        </div>
      </div>
      <c:choose>
        <c:when test="${!search }">

          <nav class="page-nbr" aria-label="Page navigation example">
            <ul class="pagination justify-content-center">

              <c:choose>
                <c:when test="${ requestedPage==0 }">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                  </li>
                </c:when>
                <c:otherwise>
                  <li class="page-item">
                    <a class="page-link" href="/ensiasdocs/home?page=${requestedPage-1 }">Previous</a>
                  </li>
                </c:otherwise>
              </c:choose>


              <c:forEach var="i" begin="0" end="${nbpages}">
                <li class="page-item"><a class="page-link" href="/ensiasdocs/home?page=${i }">${i+1}</a></li>
              </c:forEach>
              <c:choose>
                <c:when test="${ requestedPage==nbpages }">
                  <li class="page-item disabled">
                    <a class="page-link" href="#">Next</a>
                  </li>
                </c:when>
                <c:otherwise>
                  <li class="page-item">
                    <a class="page-link" href="/ensiasdocs/home?page=${requestedPage+1 }">Next</a>
                  </li>
                </c:otherwise>
              </c:choose>

            </ul>
          </nav>
        </c:when>
        <c:otherwise>
          <div class="grid__item">
            <a href="/ensiasdocs/module/${module.elm_id}">

              <div class="card"><img class="card__img" src="/inc/images/<%= bgs[i%bgs.length] %>"
                                     alt="Snowy Mountains">
                <a href="/ensiasdocs/module/${module.elm_id}">
                  <div class="card__content">
                    <h1 class="card__header">${module.elmName}</h1>
                    <p class="card__text"> ${ module.elmDesc } </p><a
                          href="/ensiasdocs/module?idM=${module.elm_id}"> <button class="card__btn">Accéder
                    <span>&rarr;</span></button></a>
                  </div>
                </a>
              </div>
            </a>
          </div>

        </c:otherwise>
      </c:choose>
      <div>
      </div>
      <c:import url="/WEB-INF/footer.jsp"></c:import>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
</div>
<script src="/inc/js/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/inc/js/main.js"></script>
<script src="/inc/js/barre.js"></script>
</body>

</html>