<!DOCTYPE html >
<html ng-app="taskManagerApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AngularJS Ticket Manager</title>
<link href='./css/style.css' rel="stylesheet" type="text/css"></link>
<link href='./css/css/font-awesome.css' rel="stylesheet" type="text/css"></link>
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<script data-require="angular.js@*" data-semver="1.2.13" src="http://code.angularjs.org/1.2.13/angular.js"></script>
  <script data-require="angular-animate@*" data-semver="1.2.13" src="http://code.angularjs.org/1.2.13/angular-animate.js"></script>
<script type="text/javascript" src="./js/app.js"></script>
</head>
<body>

<div ng-controller="ticketManagerController">
<h2 class="page-title">HelpDesk App</h2>
<h4 style="align:center"><img src="http://www.weborion.in/wp-content/themes/weborion/images/logo.jpg" /> </h4>
	
	<div id="task-panel" class="fadein fadeout showpanel panel"  ng-show="toggle">	
		<div class="panel-heading">
			<i class="panel-title-icon fa fa-tasks"></i>
			<span class="panel-title">Recent Tickets</span>
			<div class="panel-heading-controls">
				<button ng-click="toggle = !toggle" class="btn-panel">Add New Ticket</button>
				<button class="btn-panel" confirmed-click="archiveTickets()" ng-confirm-click="Would you like to archive completed tasks?">Clear completed tasks</button>
			</div>
		</div>
		<div class="panel-body">
			<div class="task" ng-repeat="task in tasks">
				<span ng-if="task.taskPriority=='HIGH'" class="priority priority-red">
					{{task.taskPriority}}
				</span>
				<span ng-if="task.taskPriority=='MEDIUM'" class="priority priority-yellow">
					{{task.taskPriority}}
				</span>
				<span ng-if="task.taskPriority=='LOW'" class="priority priority-green">
					{{task.taskPriority}}
				</span>
				<div class="action-checkbox">
					<input id="{{task.taskId}}" type="checkbox" value="{{task.taskId}}" ng-checked="selection.indexOf(task.taskId) > -1" ng-click="toggleSelection(task.taskId)" />
	  				<label for="{{task.taskId}}"></label>		
				</div>
				<div ng-if="task.taskStatus=='COMPLETED'">				
					<a href="#" class="checkedClass">
						{{task.taskName}}
					<span class="action-status">{{task.taskStatus}}</span>
					</a>
				</div>
				<div ng-if="task.taskStatus=='ACTIVE'">				
					<a href="#" class="uncheckedClass">
						{{task.taskName}}
						<span class="action-status">{{task.taskStatus}}</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div id="add-task-panel" class="fadein fadeout addpanel panel" ng-hide="toggle">
		<div class="panel-heading">
			<i class="panel-title-icon fa fa-plus"></i>
			<span class="panel-title">Add Ticket</span>
			<div class="panel-heading-controls">
				<button ng-click="toggle = !toggle" class="btn-panel">Show All Tickets</button>
			</div>
		</div>
		<div class="panel-body">
			<div class="task" >
				<table class="add-task">
					<tr>
						<td>Ticket Name:</td>
						<td><input type="text" ng-model="taskName"/></td>
					</tr>
					<tr>
						<td>Ticket Description:</td>
						<td><input type="text" ng-model="taskDesc"/></td>
					</tr>
					<tr>
						<td>Ticket Status:</td>
						<td>
							<select ng-model="taskStatus" ng-options="status as status for status in statuses">
								<option value="">-- Select --</option>						
						     	</select>
						</td>
					</tr>
					<tr>
						<td>Ticket Priority:</td>
						<td>
							<select ng-model="taskPriority" ng-options="priority as priority for priority in priorities">
								<option value="">-- Select --</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><br/><button ng-click="addTicket()" class="btn-panel-big">Add New Ticket</button></td>
					</tr>
				</table>								
			</div>
		</div>
	</div>
</div>
</body>
</html> 
