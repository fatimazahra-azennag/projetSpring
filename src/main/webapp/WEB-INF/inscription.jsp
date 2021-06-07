
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
    <!--
    <div class="principal">
                        <div class="container min-vh-100">
                            <div class="row py-5 align-items-center">
                            
                                <div class="col-md-5 pr-lg-5 mb-5 mb-md-0" >
                                    <p class="logo"><a><img src="inc/images/logo.png" alt="ENSIAS-DOC" width="400" alt="ENSIAS-DOC" class="img-fluid mb-3 d-md-block"></a></p>
                                    <img src="inc/images/study.png" alt="" class="img-fluid mb-3 d-none d-md-block">
                                </div>
                
                                <div class="col-md-7 col-lg-6 ml-auto">
                                    <h2>Bonjour ${user.lastName} ${user.firstName},</h2><br/>
                                    <p class="first-connect">Vous faites deja partie de la famille <span class="first-connect">ENSIAS-DOC</span>. Pour se deconnecter, cliquez sur le boutton ci-dessous.
                                    </p>
                                    <a href="logout" class="btn btn-danger btn-lg active" role="button" title="Lien 1">Se deconnecter</a>
                                </div>
                            </div>
                        </div>
                    </div>
-->
    <c:choose>
        <c:when test="${!user_saved}">
    <div class="principal">
        <div class="container min-vh-100">
            <div class="row py-5 align-items-center">

                <div class="col-md-5 pr-lg-5 mb-5 mb-md-0" >
                    <p class="logo"><a><img src="inc/images/logo.png" alt="ENSIAS-DOC" width="400" alt="ENSIAS-DOC" class="img-fluid mb-3 d-md-block"></a></p>

                    <h1>Créer votre compte</h1>
                    <img src="inc/images/study.png" alt="" class="img-fluid mb-3 d-none d-md-block">

                </div>

                <div class="col-md-7 col-lg-6 ml-auto">

                    <form:form action="register" method="post" modelAttribute="user" >
                        <div class="row">

                            <!-- Prénom -->

                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0 icones-form">
                                        <i class="fa fa-user text-muted ${errors.hasFieldErrors("firstName")?"err":""}"></i>
                                    </span>
                                </div>
                                <form:label path="firstName"/>
                                <form:input id="prenom" type="text" name="prenom" value = "" placeholder="Prénom" class="form-control bg-white border-left-0 border-md champs-form"  path="firstName"/>

                            </div>


                            <!-- Nom -->

                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0 icones-form">
                                        <i class="fa fa-user text-muted ${errors.hasFieldErrors("lastName")?"err":""}"></i>
                                    </span>
                                </div>
                                <form:label path="lastName"/>
                                <form:input id="nom" type="text" name="nom"  value = "${user.lastName}" placeholder="Nom" class="form-control bg-white border-left-0 border-md champs-form" path="lastName"/>

                            </div>
                            <!-- Adresse email -->

                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0 icones-form">
                                        <i class="fa fa-envelope text-muted ${errors.hasFieldErrors("email")?"err":""}"></i>
                                    </span>
                                </div>
                                <form:label path="email"/>
                                <form:input id="email" type="email"  value = "${user.email}" name="email" placeholder="Adresse Email" class="form-control bg-white border-left-0 border-md champs-form" path="email"/>

                            </div>



                            <!-- Numéro de téléphone -->

                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0 icones-form">
                                        <i class="fa fa-phone-square text-muted ${errors.hasFieldErrors("num")?"err":""} "></i>
                                    </span>
                                </div>
                                <form:label path="num"/>
                                <form:input id="phone" type="tel" name="phone"  value = "${user.num}" placeholder="Numéro de téléphone" class="form-control bg-white border-md border-left-0 pl-3 champs-form" path="num"/>

                            </div>




                            <!-- Niveau d'étude -->

                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0 icones-form">
                                        <i class="fas fa-graduation-cap text-muted ${errors.hasFieldErrors("niv")?"err":""} "></i>
                                    </span>
                                </div>
                                <form:label path="niv"/>
                                <form:select id="niveau"  value = "${user.niv}" name="niveau" class="form-control custom-select bg-white border-left-0 border-md champs-form" path="niv" >

                                    <option value="" disabled ${(user.niv==null)?"selected":""}>Niveau d'étude</option>
                                    <option value="1A" ${(user.niv=="1A")?"selected":""}>1er année</option>
                                    <option value="2A" ${(user.niv=="2A")?"selected":""}>2ème année</option>
                                    <option value="3A" ${(user.niv=="3A")?"selected":""}>3ème année</option>
                                </form:select>

                            </div>

                            <!-- Filière -->

                            <div class="input-group col-lg-12 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0 icones-form">
                                        <i class="far fa-map text-muted ${errors.hasFieldErrors("user_filiere")?"err":""}"></i>
                                    </span>
                                </div>
                                <form:label path="user_filiere"/>
                                <form:select id="filiere" name="filiere"  value = "${user.user_filiere.filiere_name}" class="form-control custom-select bg-white border-left-0 border-md champs-form" path="user_filiere.filiere_name">
                                    <option value="" disabled ${user.user_filiere.filiere_name==null?"selected":""}>Choix de filière</option>
                                    <option value="GL" ${user.user_filiere.filiere_name=="GL"?"selected":""}>Génie Logiciel</option>
                                    <option value="IWIM" ${user.user_filiere.filiere_name=="IWIM"?"selected":""}>Ingénierie du Web et Informatique Mobile</option>
                                    <option value="eMBI" ${user.user_filiere.filiere_name=="eMBI"?"selected":""}>e-Management et Business Intelligence</option>
                                    <option value="SSI" ${user.user_filiere.filiere_name=="SSI"?"selected":""}>Sécurité des Systèmes d'Information</option>
                                    <option value="ISEM" ${user.user_filiere.filiere_name=="ISEM"?"selected":""}>Ingénierie des Systèmes Embarqués, Mobiles</option>
                                    <option value="IeL" ${user.user_filiere.filiere_name=="IeL"?"selected":""}>Ingénierie e-Logistique</option>
                                    <option value="2IA" ${user.user_filiere.filiere_name=="2IA"?"selected":""}>Ingénierie e-Logistique</option>
                                    <option value="IF" ${user.user_filiere.filiere_name=="IF"?"selected":""}>Ingénierie Digitale pour la Finance</option>
                                </form:select>

                            </div>



                            <!-- Mot de passe -->

                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    		<span class="input-group-text bg-white px-4 border-md border-right-0 icones-form">
                                        		<i class="fa fa-lock text-muted" ${errors.hasFieldErrors("password")?"err":""}></i>
                                    		</span>
                                </div>
                                <form:label path="password"/>
                                <form:input id="password" type="password"  value = "${user.password}" name="password" placeholder="Mot de passe" class="form-control bg-white border-left-0 border-md champs-form" path="password"/>

                            </div>


                            <!-- Confiramation du mot de passe -->


                            <div class="input-group col-lg-6 mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-white px-4 border-md border-right-0 icones-form ${errors.hasFieldErrors("confirm_password")?"err":""} ">
                                        <i class="fa fa-lock text-muted"></i>
                                    </span>
                                </div>
                                <form:input id="passwordConfirmation" type="password" name="passwordConfirmation" placeholder="Confirmation du mot de passe" class="form-control bg-white border-left-0 border-md champs-form " path="confirm_password"/>

                            </div>


                            <!-- Submit Button -->
                            <div class="form-group col-lg-12 mx-auto mb-0">
                                <button class="btn btn-primary btn-block py-2 rounded" type = "submit">
                                    <span class="font-weight-bold">Créer un compte</span>
                                </button>
                            </div>
                            <!-- Already Registered -->
                            <div class="text-center w-100">
                                <br/>
                                <p class="text-muted font-weight-bold">Vous avez déjà un compte ? <a href="/login" class="text-primary ml-2">Login</a></p>
                            </div>

                        </div>
                    </form:form>
                </div>
        </c:when>
        <c:otherwise>
            <div class="principal">
                <div class="container">
                    <div class="row py-5 align-items-center">

                        <div class="col-md-5 pr-lg-5 mb-5 mb-md-0" >
                            <p class="logo"><a><img src="inc/images/logo.png" alt="ENSIAS-DOC" width="400" alt="ENSIAS-DOC" class="img-fluid mb-3 d-md-block"></a></p>
                            <img src="inc/images/study.png" alt="" class="img-fluid mb-3 d-none d-md-block">
                        </div>

                        <div class="col-md-7 col-lg-6 ml-auto">
                            <h2>Bonjour ${user.lastName} ${user.firstName},</h2><br/>
                            <p class="first-connect">Bienvenue dans votre espace étudiant, vous faites maintenant partie de la famille <span class="first-connect">ENSIAS-DOC</span>. Afin d'accéder à votre compte et de
                                bénéficier d'une expérience inédite dans l'e-learning, veuillez se connecter en cliquant sur le boutton ci-dessous.
                            </p>
                            <a href="login" class="btn btn-success btn-lg active" role="button" title="Lien 1">Se connecter</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>


            </div>
        </div>
    </div>

    <c:import url="/WEB-INF/footer.jsp"></c:import>

</body>
</html>