app = angular.module("lostfoundspace", ['lfServices'])

app.config ($routeProvider) ->

  $routeProvider
    .when "/slides",

      templateUrl: "assets/slide-list.html"
      controller: "SlideListCtrl"

    .when "/slides/:slideId",

      templateUrl: "assets/slide-detail.html"
      controller: "SlideDetailCtrl"

    .otherwise 
    
      redirectTo: "/slides"


services = angular.module('lfServices', ['ngResource', 'ngSanitize'])

services.factory "Slide", ($resource) ->
  $resource("slides/:id", {id: "@id"}, {update: {method: "PUT"}})

app.directive "slides", ->
  restrict: 'E'

  link: (scope, element) ->
    element.bind "dblclick", ->
      newLeft = parseInt(element.css('left')) - 500
      element.animate({'left': newLeft})
      scope.nextSlide()

app.directive "slide", ->
  restrict: 'E'
  templateUrl: 'assets/slide.html'
  
  link: (scope, element) ->
    element.addClass('large') if scope.slide.content.length < 150

    # element.bind "mouseenter", ->
    #   element.toggleClass('current')
    # element.bind "mouseleave", ->
    #   element.toggleClass('current')
