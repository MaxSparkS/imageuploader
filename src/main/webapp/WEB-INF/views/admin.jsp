<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>



<!DOCTYPE html>
<html ng-app="photoUpload">
<head>
	<meta charset="UTF-8">
	<title>Image Uploader</title>
	<link rel="shortcut icon" href="${contextPath}/resources/img/icon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
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
<div class="container" style="top:0">
	<div class="col-md-1" style="top:8px">
		<a href="welcome"><img src="${contextPath}/resources/img/logo.png" style="width:100%"></a>
	</div>
	<div class="col-md-7">
		<h3>Welcome to Image Previewer</h3>
	</div>
	<div class="col-md-4" style="text-align:right">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
    		    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        		</form>
        		<h3>Hi, ${pageContext.request.userPrincipal.name} | <a href="" onclick="document.forms['logoutForm'].submit()">Logout</a>
        		</h3>
    		</c:if>
    </div>	
</div>


<div class="container" ng-controller="MainCtrl">
	<div class="row uploadbar">
		<h2 class="text-center">Image Uploader</h2>
		<div class="col-md-8 col-md-offset-2">
			<div class="progress">
				<div class="progress-bar" role="rogressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" id="uploadbar">
					{{percentage}}% Complete
				</div>
			</div>
			<div class="text-center">
				<button ngf-select="selectFile($files)" accept="image/img" class="btn btn-success">Choose Image</button>
				<a href="welcome" class="btn btn-success">Go To Gallery</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<h3>Image:</h3>
			<div ng-show="displayMsg">
				<p class="text-center">{{msg}}</p>
			</div>
			<div class="row" ng-repeat="file in fileList">
				<div class="col-md-12">
					<img ngf-thumbnail="file || './thumb.jpg'" width="100%">
				</div>
				<div class="col-md-12">
					<div class="row" style="margin-top: 10px">
						<div class="col-md-10 col-md-offset-1">
							<input type="text" name="tags" class="form-control" placeholder="Add name here..." ng-model="nameOfFile.name">
						</div>
						
					</div>
				</div>

				<div class="col-md-12" style="top:10px">
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<input type="text" name="tags" class="form-control" placeholder="Add tags here..." ng-model="tags.name">
						</div>
					</div>
				</div>
				
				<div class="col-md-12" style="top:10px">
					<div class="row">
							<div class="col-md-3 col-md-offset-9" style="top:10px">
								<button class="btn btn-sm btn-success" ng-click="uploadFile(file)">Upload</button>
								<button class="btn btn-sm btn-danger" ng-click="removeFile(file)">Delete</button>
							</div>
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