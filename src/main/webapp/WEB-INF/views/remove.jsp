<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html ng-app="photoUpload">
<head>
	<meta charset="UTF-8">
	<title>Image Uploader</title>
	<link rel="shortcut icon" href="${contextPath}/resources/img/icon.ico" type="image/x-icon">
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
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
	<div class="col-md-1 col-sm-2 col-xs-2" style="top:8px">
		<a href="welcome"><img src="${contextPath}/resources/img/logo.png"	style="width:100%"></a>
	</div>
	<div class="col-md-7 col-sm-6 col-xs-6">
		<h3>Welcome to Image Previewer</h3>
	</div>
	<div class="col-md-4 col-sm-4 col-xs-4" style="text-align:right">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
    		    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        		</form>
        		<h3>Hi, ${pageContext.request.userPrincipal.name} | <a href="" onclick="document.forms['logoutForm'].submit()">Logout</a>
        		</h3>
    		</c:if>
    </div>	
</div>

<div class="container" ng-controller="ManageCtrl">
	<div class="row">
		<div class="text-center col-md-6 col-md-offset-3"><h2>Manage Images</h2></div>
		<div class="col-md-3 text-right" style="top:20px;">
			<a href="${contextPath}/welcome" class="btn btn-sm btn-success" >Back to Gallery</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1">
			<div class="row">
				<div class="col-md-2">
					<h3 class="text-center">Image</h3>
				</div>
				<div class="col-md-8">
					<h3 class="text-center">Image Name</h3>
				</div>
				<div class="col-md-2">
					<h3 class="text-center">Action</h3>
				</div>
			</div>
		</div>
		
		<div class="col-md-10 col-md-offset-1">
			<div class="row imgcontainer" ng-repeat="url in urls">
				<div class="col-md-2">
					<a href="" data-toggle="modal" data-target="#example{{$index}}">
      					<img src="{{url.imageUrl}}" class="img-responsive- img-thumbnail image">
    				</a>
					<div class="container">
    					<div  class="modal fade" id="example{{$index}}">
        						<div class="mdl modal-content col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-8 col-xs-offset-2" data-dismiss="modal" aria-hidden="true">
          							<img  src="{{url.imageUrl}}">
        						</div>
        						<div class="col-md-4 col-md-offset-4 mdl" style="top: 130px;">
        							<button class="btn btn-sm btn-danger" ng-click="deleteFile(url)" data-dismiss="modal" aria-hidden="true">Delete Image</button>
        						</div>
    					</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="text-center">
						{{url.imageName}}
					</div>
				</div>
				<div class="col-md-2">
					<div class="text-center">
						<button class="btn btn-sm btn-danger" ng-click="deleteFile(url)">Delete Image</button>
					</div>
				</div>
			</div>
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


