app = angular.module('adretail',[])

app.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

app.controller 'JobsController', ($scope, $http) ->
  $scope.formData = {}
  $scope.resultData = {}
  
  $scope.processForm = ->
    response = $http.post '/sequences', $scope.formData
    response.success (data) ->
      $scope.resultData = {
        sequence: data.sequence
      }
    response.error (data, status) ->
      if status is 422
        $scope.resultData = {
          error: data.error
        }
