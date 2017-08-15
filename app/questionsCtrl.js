app.controller('myresultsCtrl', function ($scope, $filter, Data, $routeParams,$location,$q) {
	console.log("myresultsCtrl:" );
	$scope.showviewresult = false;	
	var vm = this;
	var deferred = $q.defer();
	Data.get('myresults').then(function(data){
			$scope.results = data.data;
			if(data.status == "success"){
				$scope.showviewresult = true;
				console.log("myresult loaded" );
				deferred.resolve($scope.results);
			} else{
				$scope.message ="Oops Something went wrong!";
			}
		});
	deferred.promise.then(function(data) {
        console.log('got the data from promise', data);
		vm.results = data;
    }, function(error) {
        console.log('failure ins async()', error);
    });
	$scope.open = function (exam_tk) {
		$location.path("/examresult/"+exam_tk);
	}
});


app.controller('resultCtrl', function ($scope, $modal, $filter, Data, $routeParams,$location,shareDataService) {
	console.log("resultCtrl:" );
	$scope.score = 0;
	console.log("examtaken: " + $routeParams.examtaken);
	if($routeParams.examtaken)
		$scope.exam_taken_id = $routeParams.examtaken;
	$scope.exam_title = '';
	$scope.showviewresult = false;
	
	Data.get('exams/'+$scope.exam_taken_id).then(function(data){
        var exam_ids  = data.data;
		if(data.status == "success"){
			console.log(" ex id: "+exam_ids[0].exam_id);
			$scope.exam_id  = exam_ids[0].exam_id;
			$scope.score = exam_ids[0].score;
			$scope.exam_title  = exam_ids[0].exam_name;
			Data.get('examscore/'+$scope.exam_id).then(function(data){
				var exam_score  = data.data;
				$scope.maxscore = exam_score[0].maxscore;
			});
			Data.get('rsoptions/'+$scope.exam_taken_id).then(function(data){
				$scope.questions = data.data;
				if(data.status == "success"){
					$scope.showviewresult = true;
				} else{
					$scope.message ="Oops Something went wrong!";
				}
			});
		}else if(data.status == "warning"){
			$scope.message = "You are authorized to see this result!";
		}
    });
	//$scope.questions = shareDataService.getQuestions();
	console.log("questions: " + $scope.questions);
	
});
app.controller('examsCtrl', function ($scope, $modal, $filter, Data, $routeParams,$location) {
console.log("examsCtrl:" );
	$scope.exams = {};
	Data.get('exams').then(function(data){
		$scope.exams = data.data;
	});
	$scope.columns = [
                    {text:"ID",predicate:"id",sortable:true,dataType:"number"},
                    {text:"Exam Name",predicate:"name",sortable:true},
                    {text:"Description",predicate:"Desc",sortable:true},
                    {text:"Status",predicate:"status",sortable:true}
                   
                ];
	$scope.takeExam = function (ex) {
		var exam = {};
		
	   console.log("Confirmed exam");
	   exam.exam_id = ex.exam_id;
		console.log("takeexam: " + exam.exam_id);
		Data.post('exam_taken', exam).then(function (result) {
			$scope.exam_taken_id  = result.data;
			$location.path("/questions/"+$scope.exam_taken_id);
		});
        
	};
	

});
app.controller('questionsCtrl', function ($scope, $modal, $filter, Data, $routeParams,$location,shareDataService) {
$scope.showviewresult = false;
console.log("questionsCtrl:" );
    $scope.question = {};
	console.log("examtaken: " + $routeParams.examtaken);
	if($routeParams.examtaken)
		$scope.exam_taken_id = $routeParams.examtaken;
	
	$scope.exam_title = '';
	Data.get('exams/'+$scope.exam_taken_id).then(function(data){
        var exam_ids  = data.data;
		if(data.status == "success"){
			console.log(" ex id: "+exam_ids[0].exam_id);
			$scope.exam_id  = exam_ids[0].exam_id;
			Data.get('exam_details/'+$scope.exam_id).then(function(data){
				var exam_details = data.data;
				$scope.exam_title  = exam_details[0].exam_name;
			});
			$scope.exam_title  = exam_ids[0].exam_name;
			 Data.get('questions/'+$scope.exam_id).then(function(data){
				$scope.questions = data.data;
				if(data.status == "success"){
					$scope.showviewresult = true;
				} else{
					$scope.message ="Oops Something went wrong!";
				}
				shareDataService.setQuestions($scope.questions);
			});
		}else if(data.status == "warning"){
			$scope.message = "You are not authorized to see this!";
		}
    });
   
   $scope.changeQuestionStatus = function(question){
        console.log(question);
    };
   $scope.open = function (p,size) {
        var modalInstance = $modal.open({
          templateUrl: 'partials/question.html',
          controller: 'questionCtrl',
          size: size,
          resolve: {
            item: function () {
				p.exam_taken_id = $scope.exam_taken_id;
              return p;
            }
          }
        });
        modalInstance.result.then(function(selectedObject) {
            console.log("modal close " + selectedObject);
			if(!selectedObject)
				p.status = 0;
			else {
				p.status = 1;
				p.answerd_val = selectedObject;
			}
        });
    };
    
 $scope.columns = [
                    {text:"ID",predicate:"ques_id",sortable:true,dataType:"number"},
                    {text:"Question",predicate:"question",sortable:true},
                    {text:"Status",predicate:"status",sortable:true}
                   
                ];
	$scope.completeExam = function () {
		var exam = {};
		exam.ex_tk_id = $scope.exam_taken_id;
		Data.get('exams/'+$scope.exam_taken_id).then(function(data){
			var exam_ids  = data.data;
			var comp = exam_ids[0].completed;
			if( comp == 0){
				Data.post('exam_comp', exam).then(function (result) {
					$location.path("/examresult/"+$scope.exam_taken_id);
				});
			} else {
				alert("Exam Session expired or Already completed!");
			}
		});
	};
	
});

app.controller('questionCtrl', function ($scope, $modalInstance, item, Data) {
console.log("questionCtrl:" );
	$scope.question = angular.copy(item);
	if(item.answerd_val){
		$scope.answered = item.answerd_val;
		console.log("answered val: " + $scope.answered );
	}

      Data.get('options/'+item.ques_id).then(function(data){
        $scope.options = data.data;
    });
        $scope.cancel = function () {
            $modalInstance.dismiss('Close');
        };
        $scope.title = 'Answer Question';
        $scope.buttonText = 'Save Answer'

        var original = item;
        $scope.isClean = function() {
            return angular.equals(original, $scope.question);
        }
		$scope.saveAnswer = function () {
			console.log("option " + $scope.answered);
			var exam = {};
			
			if($scope.answered){
				exam.ex_tk_id = item.exam_taken_id;
				exam.ques_id = item.ques_id;
				exam.weight = item.weight;
				exam.option_id = parseInt($scope.answered);
				Data.post('answer', exam).then(function (result) {
                    if(result.status != 'error'){
                        var x = $scope.answered;
						$modalInstance.close(x);
                    }else{
                        $modalInstance.close();
                    }
                });
			} else {
				var x = "";
				$modalInstance.close(x);
			}
			
			
		};

});

app.service('shareDataService', function() {
  var questions = {};

  var setQuestions = function(newObj) {
		console.log("setquestions");
      questions = newObj;
  }

  var getQuestions = function(){
		console.log("getquestions");
      return questions;
  }

 return {
    setQuestions: setQuestions,
    getQuestions: getQuestions
  };


});
