<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <title>ENSIAS-DOC</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Font Awesome icons (free version)-->
  <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/inc/bootstrap/bootstrap.min.css">
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
        <c:if test="${user.isadmin==1 }">
        <li><a href="/ensiasdocs/admin" ><i class="fas fa-user-cog" style="margin-right:10px;"></i>Administrateur</a></li>
        </c:if>
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

      <div class="container align-self-center">
        <div class="min-vh-100">

          <div class="profile-card">
            <div class="card text-white bg-light mb-3">
              <center>
                <div class="card-header module-name"><i class="far fa-address-card" style="margin-right: 10px;"></i>Profil</div>
              </center>
            </div>
            <div class="container">
              <div class="row justify-content-center">
                <div class="col-4">
                  <center>
                    <svg xmlns="http://www.w3.org/2000/svg" width="60%" height="141.747" viewBox="0 0 153 141.747"
                      style="margin-bottom: 10px;margin-top: 5%;">
                      <path id="user-circle-solid"
                        d="M76.5,8C34.24,8,0,39.722,0,78.874s34.24,70.874,76.5,70.874S153,118.026,153,78.874,118.76,8,76.5,8Zm0,27.435c14.992,0,27.145,11.26,27.145,25.149S91.492,85.732,76.5,85.732,49.355,74.473,49.355,60.584,61.508,35.435,76.5,35.435Zm0,98.309a61.1,61.1,0,0,1-45.191-19.49,34.812,34.812,0,0,1,30.384-17.09,8.1,8.1,0,0,1,2.19.314,41.346,41.346,0,0,0,25.233,0,8.1,8.1,0,0,1,2.19-.314,34.812,34.812,0,0,1,30.384,17.09A61.1,61.1,0,0,1,76.5,133.744Z"
                        transform="translate(0 -8)" fill="rgba(0,0,0,0.52)" />
                    </svg>
                  </center>

                </div>

              </div>
            </div>
            <div class="container">
              <div class="row justify-content-center">

                <div class="col-4" style="margin-top: 30px;">
                  <center>
                    <h2>${user.firstName } ${user.lastName }</h2>
                    <h4>${user.user_filiere.filiere_abs}</h4>
                  </center>

                </div>
              </div>
            </div>
            <hr style="width: 50%px; padding-inline-start: 0;" />
            <div class="container corps-profile">
              <div class="row justify-content-center">
                <div class="col-5" style="margin-right: 20px;padding-left: 50px;">
                  <p><span class="info">Nom &nbsp;&nbsp; : </span><span>&nbsp;&nbsp; ${user.lastName
                      }</span></p>
                  <p><span class="info">Prénom &nbsp;&nbsp; : </span><span>&nbsp;&nbsp; ${user.firstName
                      }</span></p>
                  <p><span class="info">Adresse email &nbsp;&nbsp; : </span><span>&nbsp;&nbsp;
                      ${user.email }</span></p>
                </div>
                <div class="col-5">
                  <p><span class="info">Niveau universitaire &nbsp;&nbsp; : </span><span>&nbsp;&nbsp;
                      ${user.niv }</span>
                  </p>
                  <p><span class="info">Filière &nbsp;&nbsp; : </span><span>&nbsp;&nbsp;
                      ${user.user_filiere.filiere_abs }</span></p>
                  <p><span class="info">N° de téléphone &nbsp;&nbsp; : </span><span>&nbsp;&nbsp;
                      ${user.num }</span></p>
                </div>
              </div>
            </div>
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