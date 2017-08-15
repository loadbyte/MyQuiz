<?php
session_start();
$_SESSION['uid'] = 1;
?>
<!DOCTYPE html>
<html ng-app="myApp">
<body ng-cloak="">
  <title>Myquiz</title>
  <meta name="Description" content="question Manager Web Application created with AngularJS and PHP">
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
  <link rel="stylesheet" href="css/custom.css" type="text/css" />
  <link rel="stylesheet" href="css/sb-admin-2.css" type="text/css" />
  <link rel="stylesheet" href="css/timeline.css" type="text/css" />
  <link rel="stylesheet" href="css/jquery.dataTables.min.css" type="text/css" />
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
  <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
  <div class="blog-masthead">
      <div class="container">
        <nav class="blog-nav">
		
          <a class="blog-nav-item active" href="#">MyQuiz</a>
          <a class="blog-nav-item pull-right" href="#"><i class="fa fa-sign-out fa-fw"></i> Logout </a>
         
			</nav>
      </div>
    </div>

<div class="container">
<div class="row">
 <div class="col-md-3">
                <p class="lead">&nbsp;</p>
                <div class="list-group">
                    <a href="#/exams" class="list-group-item active">Exams</a>
                    <a href="#/myresults" class="list-group-item">My Results</a>
                    
                    
				
                 
                </div>
            </div>
			<div class="col-md-9">
    <div class="page-content">
      <div ng-view="" id="ng-view"></div>
    </div>
</div>
</div>
</div>
 <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; MyQuiz 2015</p>
                </div>
            </div>
        </footer>

    </div>
	


<!-- Some Bootstrap Helper Libraries -->

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/underscore.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>

<!-- Libraries -->
<script src="js/angular.min.js"></script>
<script src="js/angular-resource.min.js"></script>
<script src="js/angular-datatables.min.js"></script>

<script src="js/ui-bootstrap-tpls-0.11.2.min.js"></script>
<script src="js/angular-route.min.js"></script>
<script src="js/angular-animate.min.js"></script>
<script src="js/lodash.min.js"></script>

<!-- AngularJS custom codes -->
<script src="app/app.js"></script>
<script src="app/data.js"></script>
<script src="app/directives.js"></script>
<script src="app/questionsCtrl.js"></script>

</body>
</html>