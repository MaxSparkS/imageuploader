angular.module('photoUpload', ['ngRoute', 'ngFileUpload', 'firebase'])

.controller('MainCtrl' , ['$scope', '$firebaseStorage','$firebaseArray', function($scope, $firebaseStorage, $firebaseArray){
	var uploadbar = document.getElementById("uploadbar");
	$scope.tags = {};
	$scope.nameOfFile = {};
	$scope.displayMsg = true;
	$scope.msg = "No Image selected. Please select a image to upload."

	//Remove file from FileList
	$scope.removeFile = function(file){
		var index = $scope.fileList.indexOf(file);
		$scope.fileList.splice(index, 1);
		if($scope.fileList.length < 1){
			$scope.displayMsg = true;
		}
	};

	$scope.selectFile = function (file) {
		$scope.fileList = file;
		console.log($scope.fileList);
		$scope.displayMsg = false;
	};

	$scope.uploadFile = function(file){
		var file = file;
		var tags = $scope.tags.name;
		var fileName = $scope.nameOfFile.name;
		if (tags == undefined) {
			tags = null;
		}

		//Create a firebase storage reference
		var storageRef = firebase.storage().ref('Photos/' + fileName + '.jpg');
		var storage = $firebaseStorage(storageRef);

		//Upload image 
		var uploadTask = storage.$put(file);

		//Update progress bar

		uploadTask.$progress(function(snapshot) {
			var percentageUpload = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
			$scope.percentage = percentageUpload.toFixed(0);
			uploadbar.style.width = $scope.percentage + '%';
		});

		//Upload Complete 

		uploadTask.$complete(function(snapshot){
			console.log(snapshot);
			var imageUrl = snapshot.downloadURL;
			var imageName = snapshot.metadata.name;

			//storage image URL adn details into firebase database
			var ref = firebase.database().ref('Images');
			var urls = $firebaseArray(ref);

			//add data to firebase
			urls.$add({
				imageUrl: imageUrl,
				imageName: imageName,
				tags: tags
			}).then(function(ref){
				var id = ref.key;
				console.log("Image added to database successfully with ref key - "+id);
				urls.$indexFor(id);
			});


			//Uploading Error
			uploadTask.$error(function(error){
				console.log(error);
			});

			//Remove fileList when uploadin complete
			$scope.removeFile(file);
			$scope.msg="Photo uploaded successfully, select another image";
		});



	};
	 
}])

.controller('GalleryCtrl' , ['$scope', '$firebaseArray', function($scope, $firebaseArray){
	//create firebase database ref

	var ref = firebase.database().ref('Images');
	var urls = $firebaseArray(ref);
	$scope.urls = urls;
}])