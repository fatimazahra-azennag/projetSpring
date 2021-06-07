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
  <link rel="stylesheet" href="/inc/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&amp;display=swap">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css">
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/duotone.css"
    integrity="sha384-R3QzTxyukP03CMqKFe0ssp5wUvBPEyy9ZspCB+Y01fEjhMwcXixTyeot+S40+AjZ" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/fontawesome.css"
    integrity="sha384-eHoocPgXsiuZh+Yy6+7DsKAerLXyJmu2Hadh4QYyt+8v86geixVYwFqUvMU8X90l" crossorigin="anonymous" />
  
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
        <c:if test="${user.isadmin == 1 }">
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
      <div class="min-vh-100">
      <div class="container m-5 p-2 rounded mx-auto bg-light shadow">
        <!-- App title section -->
        <div class="row m-1 p-4">
          <div class="col">
            <div class="p-1 h1 text-primary text-center mx-auto display-inline-block">
              <u><img src="https://fontmeme.com/permalink/210221/83652c31f237c65d90c99317abf60eae.png" alt="polices-de-calligraphie" border="0"></u>
              
            </div>
          </div>
        </div>
        <!-- Create todo section -->
        <form:form method="POST" action="/ensiasdocs/todo">
        <div class="row m-1 p-3">
          <div class="col col-11 mx-auto">
            <div class="row bg-white rounded shadow-sm p-2 add-todo-wrapper align-items-center justify-content-center">
              <div class="col">
                <input class="form-control form-control-lg border-0 add-todo-input bg-transparent rounded" name="todo_name" type="text"
                  placeholder="Nouvelle tâche ..">
              </div>
              <div class="col-auto m-0 px-2 d-flex align-items-center">
                <label class="text-secondary my-2 p-0 px-1 view-opt-label due-date-label d-none">Entrer une date</label>
				<input hidden class="date-input" value="" name="todo_date" />
                <i class="far fa-calendar-alt text-primary due-date-button" style="cursor: pointer;width: 20px;"
                  data-toggle="tooltip" data-placement="bottom" title="Set a Due date"></i>
                <i class="fa fa-calendar-times-o my-2 px-1 text-danger clear-due-date-button d-none"
                  style="cursor: pointer;width: 20px;" data-toggle="tooltip" data-placement="bottom"
                  title="Clear Due date"></i>
              </div>
              <div class="col-auto px-0 mx-0 mr-2">
                <button type="submit" class="btn btn-primary">Ajouter</button>
              </div>
            </div>
          </div>
        </div>
        </form:form>
        <div class="p-2 mx-4 border-black-25 border-bottom"></div>
        
        <!-- Todo list section -->
        <div class="row mx-1 px-5 pb-3 w-80">
          <div class="col mx-auto">
            
            <!-- Todo Item 2 -->
            <br/><br/>
            <h4 class="text-primary" style="margin-bottom: 10px;"><i class="fas fa-briefcase" style="margin-right: 15px;"></i>Mes tâches :</h4>
            <c:forEach items = "${ user.todos }" var="todo">
            <div class="row px-3 align-items-center todo-item rounded">
              <div class="col-auto m-1 p-0 d-flex align-items-center">
                <h2 class="m-0 p-0">
                <c:choose>
                <c:when test = "${ todo.done!=1 }">
                <form:form method="POST" action ="/ensiasdocs/todo/done">
                <input name="todo_id" value="${ todo.todo_id }" class="d-none"/>
                <input name="update_done" value="done" class="d-none"/>
                  <button type="submit" style=" border:none; background: none; color: inherit;padding: 0;font: inherit;"  > <i class="far fa-square text-primary  m-0 p-0"  style="cursor: pointer;width: 20px;"
                    data-toggle="tooltip" data-placement="bottom" title="Mark as complete"></i>
                    </button>
                    </form:form>
                    </c:when>
                    <c:otherwise>
                    <form:form method="POST" action ="/ensiasdocs/todo/done">
                <input name="todo_id" value="${ todo.todo_id }" class="d-none"/>
                <input name="update_done" value="todo" class="d-none"/>
                  <button type="submit" style=" border:none; background: none; color: inherit;padding: 0;font: inherit;"  > 
                  <i class="far fa-check-square text-primary  m-0 p-0 " style="cursor: pointer;width: 20px;"
                    data-toggle="tooltip" data-placement="bottom" title="Mark as todo"></i>
                    </button>
                    </form:form>
                    </c:otherwise>
                   </c:choose>
                </h2>
              </div>
              <div class="col px-1 m-1 d-flex align-items-center">
                <input type="text"
                  class="form-control form-control-lg border-0 edit-todo-input bg-transparent rounded px-3" readonly
                  value="${ todo.title }" title="Renew car insurance" />
                <input type="text" class="form-control form-control-lg border-0 edit-todo-input rounded px-3 d-none"
                  value="${ todo.title }" />
              </div>
              <c:choose>
              	<c:when test="${ todo.isclose }">
				    <div class="col-auto m-1 p-0 px-3">
				      <div class="row">
				        <div class="col-auto d-flex align-items-center rounded bg-white border border-warning">
				          <i class="fas fa-hourglass-half text-warning " style="cursor: pointer;width: 20px;margin-right: 7px;"
				            data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Il vous reste moins d'une journée"></i>
				          <h6 class="text my-2 pr-2">${ todo.delai }</h6>
				        </div>
				      </div>
				    </div>
    			</c:when>
    		<c:otherwise>
   				<div class="col-auto m-1 p-0 px-3 d-none"></div>
    		</c:otherwise>
    		</c:choose>
              <div class="col-auto m-1 p-0 todo-actions">
                <div class="row d-flex align-items-center justify-content-end">
                  <form:form method="POST" action ="/ensiasdocs/todo/delete" class="col-5" style="display:inline;">
                  <input name="todo_id" value="${ todo.todo_id }" class="d-none"/>
                  <h5 class=" m-0 p-0 px-2">
                  <button type="submit" style=" border:none; background: none; color: inherit;padding: 0;font: inherit;"  >
                    <i class="fas fa-trash-alt text-danger m-0 p-0" style="cursor: pointer;width: 20px;"
                      data-toggle="tooltip" data-placement="bottom" title="Supprimer la tâche"></i>
                      </button>
                  </h5>
                  
                  </form:form>
                </div>
                <div class="row todo-created-info">
                  <div class="col-auto d-flex align-items-center pr-2">
                    <i class="fas fa-info-circle text-black-50" style="cursor: pointer;width: 20px;margin-right: 10px;"
                      data-toggle="tooltip" data-placement="bottom" title="" data-original-title="${ todo.delai }"></i>
                    <label class="date-label my-2 text-black-50">${ todo.delai }</label>
                  </div>
                </div>
              </div>
            </div>
            </c:forEach>
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

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootlint/1.1.0/bootlint.min.js"></script>
  <script
    src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
  <script src="/inc/js/todo.js"></script>
</body>

</html>