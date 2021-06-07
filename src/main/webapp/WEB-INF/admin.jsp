<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

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
    <link href="/inc/styles/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/inc/styles/daterangepicker.css" rel="stylesheet" media="all">

  <link rel="stylesheet" type="text/css" href="/inc/styles/core.css">
  <link rel="stylesheet" type="text/css" href="/inc/styles/style.css">
  <link rel="stylesheet" href="/inc/styles/style_inscription.css">
  <link rel="stylesheet" type="text/css" href="/inc/styles/style_admin.css">
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
        <li><a href="/ensiasdocs/profile"><i class="fas fa-user-graduate" style="margin-right:10px;"></i></i>Profil</a></li>
        <li><a href="/ensiasdocs/calendrier"><i class="fas fa-calendar-alt" style="margin-right:10px;"></i>Calendrier</a></li>
        <li><a href="/ensiasdocs/todo"><i class="fas fa-list-alt" style="margin-right:10px;"></i>To Do</a></li>
        <c:if test="${user.isadmin == 1}">
        <li><a href="/ensiasdocs/admin" ><i class="fas fa-user-cog" style="margin-right:10px;"></i>Administrateur</a></li>
        </c:if>
      </ul>
      <a class="navbar-brand" href=""><img src="/inc/images/logo.png" alt="ENSIAS-DOC" width="200"
          style="position: absolute;bottom: 100px;"></a>
    </nav>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <c:forEach items="${requestScope.modules}" var="module">
        <div class="modules" hidden>
          <span class="elm_id">${module.elm_id}</span>
          <span class="elm_name">${module.elmName}</span>
          <span class="elm_module">${module.elmModule}</span>
          <span class="elm_annee">${module.elmAnnee}</span>
          <span class="elm_semester">${module.elmSem}</span>
          <span class="elm_description">${module.elmDesc}</span>
          <span class="filieres">
          <c:forEach items="${module.filieres}" var="filiere">
            <span class = "filiere">${filiere.filiere_name}</span>
          </c:forEach>
          </span>
        </div>
      </c:forEach>
    <div id="page-content-wrapper">
      <c:import url="/WEB-INF/header.jsp"></c:import>

      <div class="container align-self-center" style="margin-top: 50px;">
        <div class="min-vh-100">
		      <center>
            <img src="https://fontmeme.com/permalink/210219/311c1cb284951df6ea8c9082e44f276a.png" alt="polices-de-calligraphie" border="0" style="margin-bottom:20px;">
          </center>
          <div class="tab">
            <button class="tablinks active" onclick="openCity(event, 'Module')">Création d'un module</button>
            <button class="tablinks" onclick="openCity(event, 'Document')">Ajout des documents</button>
            <button class="tablinks" onclick="openCity(event, 'Modification')">Modification d'un module</button>
            <button class="tablinks" onclick="openCity(event, 'Exams')">Ajout d'un examen</button>
          </div>


          <!-- Page Ajout d'examen -->
          <div id="Exams" class="tabcontent">
            <h2><i class="fas fa-cubes" style="margin-right: 10px;"></i>Ajouter un examen</h2>
            <div>
              <form:form action="/ensiasdocs/admin/ajouter-examen" method="POST">
                <div class="row align-items-center">
                  <div class="input-group col-lg-12 mb-4">
                    <div class="input-group col-lg-12 mb-4" style="margin-top: 50px;">

                      <select name="elm_module"
                        class="browser-default custom-select champs-form choix">
                        <option value="" disabled selected>Choix du module</option>
                        <c:forEach items ="${modules}" var="module">
                        	<option value="${module.elm_id }">${module.elmName}</option>
                        </c:forEach>
                      </select>
                    </div>

                    <div class="col-6">
                      <div class="input-group">
                          <input class="input--style-2 js-datepicker" type="text" placeholder="Date d'examen" name="examen">
                          <i class="far fa-calendar-alt  input-icon js-btn-calendar"></i>
                      </div>
                  </div>

                    
                  </div>
                </div>
                <div class="form-group col-lg-12 mx-auto mb-0" >
                    <button class="btn btn-primary btn-block py-2 rounded" type="submit" style="margin-bottom: 30px;">
                      <span class="font-weight-bold">Ajouter un examen</span>
                    </button>
                  </div>
              </form:form>
            </div>
          </div>


          <!-- Page Modification module -->
          <div id="Modification" class="tabcontent">
            <h2><i class="fas fa-pencil-alt" style="margin-right: 10px;"></i>Modification d'un module</h2>
            <div>
              <form:form action="/ensiasdocs/admin/modifier-module" method="POST" modelAttribute="element_modification">
                <div class="row align-items-center">
                  <div class="input-group col-lg-12 mb-4">
                    <div class="input-group col-lg-12 mb-4" style="margin-top: 50px;">
                      <form:select id="cmodule" name="elm_module"
                        class="browser-default custom-select champs-form choix" path="elm_id">
                        <option value="" disabled selected>Choix du module</option>
                        <c:forEach items ="${requestScope.modules}" var="module">
                        	<option value="${module.elm_id }">${module.elmName}</option>
                        </c:forEach>
                      </form:select>
                    </div>

                    <!-- Nom module -->
                    <div class="input-group col-lg-12 mb-4">
                      <form:input type="text" name="module" id="nv_module" class="form-control champs-form"
                        placeholder="Nouveau nom du module" path="elmModule"/>
                      <form:input type="text" name="module" id="elmModule" class="form-control d-none champs-form"
                                  placeholder="Nouveau nom du module" path="elmName" />
                    </div>

                    <!-- Année -->
                    <div class="input-group col-lg-6 mb-4">
                      <form:select id="nv_annee" value="" name="annee"
                        class="browser-default custom-select champs-form choix" path="elmAnnee">
                        <option value="" disabled selected>Niveau d'étude</option>
                        <option value="1A">1er année</option>
                        <option value="2A">2ème année</option>
                        <option value="3A">3ème année</option>
                      </form:select>
                    </div>

                    <!-- Semestre -->
                    <div class="input-group col-lg-6 mb-4">
                      <form:select id="nv_semestre" value="" name="semestre"
                        class="browser-default custom-select champs-form choix" path="elmSem">
                        <option value="" disabled selected>Semestre</option>
                        <option value="S1">Semestre 1</option>
                        <option value="S2">Semestre 2</option>
                        <option value="S3">Semestre 3</option>
                        <option value="S4">Semestre 4</option>
                        <option value="S5">Semestre 5</option>
                      </form:select>
                    </div>

                    <!-- Description module -->
                    <div class="input-group col-lg-12 mb-4">
                      <form:textarea id="nv_dscModule" name="dscModule" class="form-control md-textarea" length="120"
                        rows="3" placeholder="Description du module" path="elmDesc"></form:textarea>
                    </div>

                    <!-- Choix des filières -->
                    <p style="margin-left:50px;font-weight:bold;"><i class="fas fa-atom" style="margin-right:7px;"></i>Choix des filières :</p>
                    <div class="form-check">
                      <div class="input-group col-lg-12 custom-checkbox">
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  class = "filiere_cb" name="GL" value="GL" path="filieres"/>
                          <span class="checkmark"></span>
                          Génie Logiciel
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  class = "filiere_cb" name="IWIM" value="IWIM" path="filieres"/>
                          <span class="checkmark"></span>
                          Ingénierie du Web et Informatique Mobile
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  class = "filiere_cb" name="eMBI" value="eMBI" path="filieres"/>
                          <span class="checkmark"></span>
                          e-Management et Business Intelligence
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  class = "filiere_cb" name="SSI" value="SSI" path="filieres"/>
                          <span class="checkmark"></span>
                          Sécurité des Systèmes d'Information
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  class = "filiere_cb" name="ISEM" value="ISEM" path="filieres"/>
                          <span class="checkmark"></span>
                          Ingénierie des Systèmes Embarqués, Mobiles
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  class = "filiere_cb" name="IeL" value="IeL" path="filieres"/>
                          <span class="checkmark"></span>
                          Ingénierie e-Logistique
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  class = "filiere_cb" name="2IA" value="2IA" path="filieres"/>
                          <span class="checkmark"></span>
                          Ingénierie Intélligence Artificielle
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  class = "filiere_cb" name="IDF" value="IDF" path="filieres"/>
                          <span class="checkmark"></span>
                          Ingénierie Digitale pour la Finance
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group col-lg-12 mx-auto mb-0" >
                    <button class="btn btn-primary btn-block py-2 rounded" type="submit" style="margin-bottom: 30px;">
                      <span class="font-weight-bold">Modifier</span>
                    </button>
                  </div>
              </form:form>
            </div>
          </div>


          <!-- Page Création des modules -->
          <div id="Module" class="tabcontent" style="display: block;">
            <h2><i class="fas fa-folder-plus" style="margin-right: 10px;"></i>Création d'un module</h2>
            <div class="row py-5 align-items-center">
              <div>
                <form:form action="/ensiasdocs/admin/creer-module" method="POST" modelAttribute="element_creation">
                  <div class="row">

                    <!-- Nom elm module -->
                    <div class="input-group col-lg-12 mb-4">
                      <form:input type="text" name="elm_module" id="elm_module" class="form-control champs-form"
                        placeholder="Nom de l'element du module" path="elmName"/>
                    </div>
                    
                    
                    <!-- Nom module -->
                    <div class="input-group col-lg-12 mb-4">
                      <form:input type="text" name="module" id="module" class="form-control champs-form"
                        placeholder="Nom du module" path="elmModule"/>
                    </div>

                    <!-- Année -->
                    <div class="input-group col-lg-6 mb-4">
                      <form:select id="annee" value="" name="annee" class="browser-default custom-select champs-form choix" path="elmAnnee">
                        <option value="" disabled selected>Niveau d'étude</option>
                        <option value="1A">1er année</option>
                        <option value="2A">2ème année</option>
                        <option value="3A">3ème année</option>
                      </form:select>
                    </div>

                    <!-- Semestre -->
                    <div class="input-group col-lg-6 mb-4">
                      <form:select id="semestre" value="" name="semestre"
                        class="browser-default custom-select champs-form choix" path="elmSem">
                        <option value="" disabled selected>Semestre</option>
                        <option value="S1">Semestre 1</option>
                        <option value="S2">Semestre 2</option>
                        <option value="S3">Semestre 3</option>
                        <option value="S4">Semestre 4</option>
                        <option value="S5">Semestre 5</option>
                      </form:select>
                    </div>
                    <!-- Description module -->
                    <div class="input-group col-lg-12 mb-4">
                      <form:textarea id="dscModule" name="dscModule" class="form-control md-textarea" length="120" rows="3"
                        placeholder="Description du module" path="elmDesc"></form:textarea>
                    </div>



                    <!-- Choix des filières -->
                    <p style="margin-left:50px;font-weight:bold;"><i class="fas fa-atom" style="margin-right:7px;"></i>Choix des filières :</p>
                    <div class="form-check">
                      <div class="input-group col-lg-12 custom-checkbox">
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  name="GL" value="GL" path="filieres"/>
                          <span class="checkmark"></span>
                          Génie Logiciel
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  name="IWIM" value="IWIM" path="filieres"/>
                          <span class="checkmark"></span>
                          Ingénierie du Web et Informatique Mobile
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox name="eMBI" value="eMBI" path="filieres"/>
                          <span class="checkmark"></span>
                          e-Management et Business Intelligence
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  name="SSI" value="SSI" path="filieres"/>
                          <span class="checkmark"></span>
                          Sécurité des Systèmes d'Information
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  name="ISEM" value="ISEM" path="filieres"/>
                          <span class="checkmark"></span>
                          Ingénierie des Systèmes Embarqués, Mobiles
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  name="IeL" value="IeL" path="filieres"/>
                          <span class="checkmark"></span>
                          Ingénierie e-Logistique
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  name="2IA" value="2IA" path="filieres"/>
                          <span class="checkmark"></span>
                          Ingénierie Intélligence Artificielle
                        </label>
                        <label class="container col-lg-6 mb-4">
                          <form:checkbox  name="IDF" value="IDF" path="filieres" />
                          <span class="checkmark"></span>
                          Ingénierie Digitale pour la Finance
                        </label>
                      </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-group col-lg-12 mx-auto mb-0">
                      <button class="btn btn-primary btn-block py-2 rounded" type="submit">
                        <span class="font-weight-bold">Créer un module</span>
                      </button>
                    </div>

                  </div>
                </form:form>
              </div>
            </div>
          </div>


          <!-- Ajout des documents -->
          <div id="Document" class="tabcontent">
            <h2><i class="fas fa-file-download" style="margin-right: 10px;"></i>Ajout des documents</h2>
            <div>
              <form:form action="/ensiasdocs/admin/upload-doc" method="POST" enctype="multipart/form-data" >
                <div class="row align-items-center">

                  <div class="input-group col-lg-12 mb-4">
                    <div class="input-group col-lg-12 mb-4" style="margin-top: 50px;">
                      <select id="nom_module" value="" name="nom_module"
                        class="browser-default custom-select champs-form choix">
                        <option value="" disabled selected>Choix du module</option>
                        <c:forEach items ="${requestScope.modules}" var="module">
                        	<option value="${module.elm_id }">${module.elmName}</option>
                        </c:forEach>
                      </select>
                    </div>

                    <div class="container">
                      <div class="row it">

                        <div class="col-sm-offset-1 col-sm-10" id="one" style="margin-left: 50px;padding: 50px;">

                          <!--row-->
                          <div id="uploader">
                            <div class="row uploadDoc">
                              <div class="col-sm-3">
                                <div class="docErr">Please upload valid file</div>
                                <!--error-->
                                <div class="fileUpload btn btn-orange">
                                  <img src="https://image.flaticon.com/icons/svg/136/136549.svg" class="icon">
                                  <span class="upl" id="upload">Upload document</span>
                                  <input type="file" class="upload up" id="up" accept="*" name="file" onchange="readURL(this);"  />
                                </div><!-- btn-orange -->
                              </div><!-- col-3 -->
                              <div class="col-sm-8">
                                <input type="text" class="form-control" name="type" placeholder="Note">
                              </div>
                              <!--col-8-->
                              <div class="col-sm-1 align-items-center" ><a class="btn-check"><i class="fa fa-times"></i></a></div>
                              <!-- col-1 -->
                            </div>
                            <!--row-->
                          </div>
                          <!--uploader-->
                          <div class="text-center">
                            <a class="btn btn-new"><i class="fa fa-plus"></i> Ajouter </a>
                            <button class="btn btn-next" type="submit"><i class="fa fa-paper-plane"></i> Enregistrer</button>
                          </div>
                        </div>
                        <!--one-->

                      </div><!-- container -->

                    </div>
                  </div>
                  </div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
      <c:import url="/WEB-INF/footer.jsp"></c:import>
    </div>
    
  </div>

  <script src="/inc/js/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="/inc/js/main.js"></script>
  <script src="/inc/js/barre.js"></script>
  <script src="/inc/js/admin.js"></script>
  <script src="/inc/js/upload.js"></script>

  <script src="/inc/js/jquery/jquery.min.js"></script>
  <script src="/inc/js/moment.min.js"></script>
  <script src="/inc/js/daterangepicker.js"></script>
  <script src="/inc/js/global.js"></script>
</body>

</html>