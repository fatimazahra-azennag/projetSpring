<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>ENSIAS-DOC</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="inc/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
    <link rel="stylesheet" type="text/css" href="inc/styles/style_inscription.css">
    <link rel="icon" href="inc/icons/logo.ico">
</head>
<body>

    <c:import url="/WEB-INF/header.jsp"></c:import>

    <div class="principal">
        <div class="container min-vh-100">
            <div class="row py-5 align-items-center">
            
                <div class="col-md-5 pr-lg-5 mb-5 mb-md-0" >
                    <p class="logo"><a><img src="inc/images/logo.png" alt="ENSIAS-DOC" width="400" alt="ENSIAS-DOC" class="img-fluid mb-3 d-md-block"></a></p>
                    <img src="inc/images/login.png" alt="" class="img-fluid mb-3 d-none d-md-block">
                    

                </div>

                <div class="col-md-7 col-lg-6 ml-auto">
                    <form:form action="login" method = "POST" modelAttribute="user" >
                        <div class="row">
                            <h1>Espace étudiant</h1><br/><br/><br/>
                            <!-- Adresse email -->
                            <div class = "mb-4 ">
                            <div class="input-group col-lg-12 pl-0 ">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-envelope text-muted ${requestScope.form.errors.email==null?"":"err"}"></i>
                                    </span>
                                </div>
                                <form:input id="email" type="email" name="email" placeholder="Adresse Email" class="form-control bg-white border-left-0 border-md " value="${requestScope.user.email}" path="email"/><br/>
                                
                            </div>
                            
                            <!-- Messages des erreurs -->
                            <div class = "err mt-1 ml-2">
                            	<c:choose>
                            		<c:when test="${requestScope.form.errors.email!=null}">
										<i class="fas fa-exclamation-circle"></i> ${requestScope.form.errors.email}                            		
                            		</c:when>
                            	</c:choose>
        							
      						</div>
      						</div>

                            <!-- Mot de passe -->
                            <div class = "mb-4 ">
                            
                            
                            <div class="input-group col-lg-12 pl-0">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0">
                                        <i class="fa fa-lock text-muted ${requestScope.form.errors.password==null?"":"err"}""></i>
                                    </span>
                                </div>
                                <form:input id="password" type="password" name="password" placeholder="Mot de passe" class="form-control bg-white border-left-0 border-md" value="${requestScope.user.password}" path="password"/>
                            </div>
                            <!-- Messages des erreurs -->
                            <div class = "err mt-1 ml-2">
                            	<c:choose>
                            		<c:when test="${requestScope.form.errors.password!=null}">
										<i class="fas fa-exclamation-circle"></i> ${requestScope.form.errors.password}                            		
                            		</c:when>
                            	</c:choose>
        							
      						</div>
      						</div>

                            <!-- Submit Button -->
                            <div class="form-group col-lg-12 mx-auto mb-0">
                                <button type="submit" href="/ensiasdocs/home" class="btn btn-primary btn-block py-2">
                                    <span class="font-weight-bold">Se connecter</span>
                                </button>
                            </div>
                            
                            <!-- Already Registered -->
                            <div class="text-center w-100">
                                <br/>
                                <p class="text-muted font-weight-bold">Créer un nouveau compte ? <a href="register" class="text-primary ml-2">Sign up</a></p>
                            </div>

                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <c:import url="/WEB-INF/footer.jsp"></c:import>

</body>
</html>