<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html ng-app="photoUpload">
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="${contextPath}/resources/img/icon.ico" type="image/x-icon">
	<title>Image Uploader</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.5/angular.min.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.js"></script>
	<script src="https://www.gstatic.com/firebasejs/4.4.0/firebase.js"></script>
	<script>
		// Initialize Firebase
  		var config = {
    		apiKey: "AIzaSyDIAdj-QtzudPuxsscB-O3s5Fm73A1OI0A",
    		authDomain: "fir-uploader-63d6a.firebaseapp.com",
    		databaseURL: "https://fir-uploader-63d6a.firebaseio.com",
    		projectId: "fir-uploader-63d6a",
    		storageBucket: "fir-uploader-63d6a.appspot.com",
    		messagingSenderId: "412028514229"
  		};
  		firebase.initializeApp(config);
	</script>
</head>
<body>
	
<div class="container">
	<div class="col-md-1" style="top:8px">
		<a href="welcome"><img src="${contextPath}/resources/img/logo.png"	style="width:100%"></a>
	</div>
	<div class="col-md-7 col-sm-6">
		<h3>Welcome to Image Previewer</h3>
	</div>
	<div class="col-md-4" style="text-align:right">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
    		    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        		</form>
        		<h3>Hi, ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        		</h3>
    		</c:if>
    </div>	
</div>
<div class="container" ng-controller="GalleryCtrl">
	<div class="row" style="margin: 20px 0 40px 0">
		<div class="col-md-6 col-md-offset-3">
			<input type="text" placeholder="Search photo..." class="form-control" ng-model="search">
		</div>
		<div class="col-md-3 text-right">
			<a href="${contextPath}/admin" class="btn btn-sm btn-primary">Add More Images</a>
		</div>
	</div>
	<!-- image grid-->
	<div class="row">
		<div class="col-md-4" ng-repeat="url in urls | filter:search">
			<img src="{{url.imageUrl}}" class="img-responsive- img-thumbnail" style="width: 100%">
		</div>
	</div>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/node_modules/ng-file-upload/dist/ng-file-upload-shim.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/node_modules/ng-file-upload/dist/ng-file-upload.min.js"></script>
<script type="text/javascript" src="https://cdn.firebase.com/libs/angularfire/2.3.0/angularfire.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/script.js"></script>

</body>
</html>


