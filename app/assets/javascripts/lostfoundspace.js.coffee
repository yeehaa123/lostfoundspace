app = angular.module("lostfoundspace", ['lfServices'])

app.config ($routeProvider) ->

  $routeProvider
    .when "/slides",

      templateUrl: "assets/slide-list.html"
      controller: "SlideListCtrl"

    .when "/matrix",
      templateUrl: "assets/slide-matrix.html"
      controller: "SlideListCtrl"

    .otherwise 
    
      redirectTo: "/slides"

services = angular.module('lfServices', ['ngResource', 'ngSanitize'])

services.factory "Slide", ($resource) ->
  $resource("slides/:id", {id: "@id"}, {update: {method: "PUT"}})

app.directive "slides", ->
  restrict: 'E'
  transclude: true
  templateUrl: 'assets/slides.html'

app.directive "textslides", ->
  restrict: 'E'
  transclude: true
  templateUrl: 'assets/textslides.html'

app.directive "slide", ->
  restrict: 'E'
  templateUrl: 'assets/slide.html'
  
  link: (scope, element, attrs) ->
    element.addClass('large') if scope.slide.content.length < 150

    if scope.slide.image_url
      element.css('background-image', "url(#{scope.slide.image_url})")
      element.addClass('hideContent')
      
    element.bind "click", ->
      if element.hasClass('current')
        element.removeClass('current')
      else
        $('slide').removeClass('current')
        element.addClass('current')

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

    $('.upward-btn').bind "click", ->
      slidesElement = $(document).find('textslides').first()
      newLeft = parseInt(slidesElement.css('top')) - 375
      slidesElement.animate({'top': newLeft})

    $('.downward-btn').bind "click", ->
      slidesElement = $(document).find('textslides').first()
      newLeft = parseInt(slidesElement.css('top')) + 375
      slidesElement.animate({'top': newLeft})
