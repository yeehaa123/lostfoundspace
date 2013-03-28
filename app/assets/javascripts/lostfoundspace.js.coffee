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
  transclude: true
  templateUrl: 'assets/slides.html'

  link: (scope, element) ->
    element.bind "dblclick", ->
      newLeft = parseInt(element.css('left')) - 500
      element.animate({'left': newLeft})

app.directive "slide", ->
  restrict: 'E'
  templateUrl: 'assets/slide.html'
  
  link: (scope, element) ->
    element.addClass('large') if scope.slide.content.length < 150
    if scope.slide.image_url
      element.css('background-image', "url(#{scope.slide.image_url})")
      element.addClass('hideContent')
    else
      # element.addClass('hideSlide')

app.directive "buttons", ->
  restrict: 'E'
  templateUrl: 'assets/control-buttons.html'

  link: (scope,element) ->
    $('.backward-btn').bind "click", ->
      slidesElement = $(document).find('slides').first()
      newLeft = parseInt(slidesElement.css('left')) + 500
      slidesElement.animate({'left': newLeft})

    $('.forward-btn').bind "click", ->
      slidesElement = $(document).find('slides').first()
      newLeft = parseInt(slidesElement.css('left')) - 500
      slidesElement.animate({'left': newLeft})
