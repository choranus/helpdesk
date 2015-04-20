var ticketManagerModule = angular.module('ticketManagerApp', ['ngAnimate']);

ticketManagerModule.controller('ticketManagerController', function ($scope,$http) {
	
	var urlBase="http://localhost:8080/TicketManagerApp";// URL
	$scope.toggle=true;
	$scope.selection = [];
	$scope.statuses=['ACTIVE','COMPLETED'];
	$scope.priorities=['HIGH','LOW','MEDIUM'];
	$http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
	
	//get all issues and display initially
	$http.get(urlBase+'/tickets').
    	success(function(data) {
	        $scope.tickets = data;
	        for(var i=0;i<$scope.tickets.length;i++){
	            if($scope.tickets[i].ticketStatus=='COMPLETED'){
	           	 $scope.selection.push($scope.tickets[i].ticketId);
	        }
	        }
    });
	
	//add a new Isssue
	$scope.addTicket = function addTicket() {
		if($scope.ticketName=="" || $scope.ticketDesc=="" || $scope.ticketPriority == "" || $scope.ticketStatus == ""){
			alert("Insufficient Data! Please provide values for ticket name, description, priortiy and status");
		}
		else{
		 $http.post(urlBase + '/tickets/insert/' +$scope.ticketName+'/'+$scope.ticketDesc+'/'+$scope.ticketPriority+'/'+$scope.ticketStatus).
		  success(function(data) {
			 alert("Ticket added");
			 $scope.tickets = data;	
			 $scope.ticketName="";
			 $scope.ticketDesc="";
			 $scope.ticketPriority="";
			 $scope.ticketStatus="";
			 $scope.toggle='!toggle';			 
		    });
		}
	};
		
	// toggle selection for a given ticket by ticket id
	  $scope.toggleSelection = function toggleSelection(ticketId) {
	    var idx = $scope.selection.indexOf(ticketId);

	    // is currently selected
	    if (idx > -1) {
	      $http.post(urlBase + '/tickets/' +ticketId+'/ACTIVE').
		  success(function(data) {
			 alert("Ticket unmarked");
			 $scope.tickets = data;		       
		    });
	      $scope.selection.splice(idx, 1);
	    }

	    // is newly selected
	    else {
	      $http.post(urlBase + '/tickets/' +ticketId+'/COMPLETED').
		  success(function(data) {
			 alert("Ticket marked completed");
			 $scope.tickets = data;
		    });
	      $scope.selection.push(ticketId);
	    }
	  };
	  
	
	// Archive Completed Tickets
	  $scope.archiveTickets = function archiveTickets() {
		  $http.post(urlBase + '/tickets/archive/' + $scope.selection).
		  success(function(data) {
			  $scope.tickets = data;
		       alert("Successfully Archived");
		    });
	  };
	
});

//Angularjs Directive for confirm dialog box
ticketManagerModule.directive('ngConfirmClick', [
	function(){
         return {
             link: function (scope, element, attr) {
                 var msg = attr.ngConfirmClick || "Are you sure want to remove this issue ?";
                 var clickAction = attr.confirmedClick;
                 element.bind('click',function (event) {
                     if ( window.confirm(msg) ) {
                         scope.$eval(clickAction);
                     }
                 });
             }
         };
 }]);
