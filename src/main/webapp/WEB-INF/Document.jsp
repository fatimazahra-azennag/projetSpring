<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
    <head>
        <title>ENSIAS-DOC</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
      <link rel="stylesheet" href="/inc/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
      <link rel="stylesheet" type="text/css" href="/inc/styles/style_inscription.css">
      <link rel="stylesheet" type="text/css" href="/inc/styles/style_home.css">
      <link rel="stylesheet" type="text/css" href="/inc/styles/style_module.css">
      <link rel="icon" href="/inc/icons/logo.ico">
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/duotone.css" integrity="sha384-R3QzTxyukP03CMqKFe0ssp5wUvBPEyy9ZspCB+Y01fEjhMwcXixTyeot+S40+AjZ" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/fontawesome.css" integrity="sha384-eHoocPgXsiuZh+Yy6+7DsKAerLXyJmu2Hadh4QYyt+8v86geixVYwFqUvMU8X90l" crossorigin="anonymous"/>

    <link rel="icon" href="logo.ico">
  </head>
    </head>
    <body>
        <c:import url="/WEB-INF/header.jsp"></c:import>
        <div>Doc</div>

	<div class="min-vh-100" style="margin-top:90px;height:500px;"><embed src="/files/${doc.doc_id}" width="100%" height="100%" type="${doc.docMime}"></div>
 <c:import url="/WEB-INF/footer.jsp"></c:import>
    </body>
</html>