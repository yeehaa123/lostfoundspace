app = angular.module("lostfoundspace", ['lfServices'])

app.config ['$routeProvider', ($routeProvider) ->

  $routeProvider
    .when "/slides",

      templateUrl: "assets/slide-list.html"
      controller: "SlideListCtrl"

    .when "/matrix",
      templateUrl: "assets/slide-matrix.html"
      controller: "SlideListCtrl"

    .otherwise 
    
      redirectTo: "/slides"
]

services = angular.module('lfServices', ['ngResource', 'ngSanitize'])

services.factory "Slide", ["$resource",($resource) ->
  $resource("slides/:id", {id: "@id"}, {update: {method: "PUT"}})
]

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
    element.addClass('large') if scope.slide.content.length < 200

    if scope.slide.image_url
      element.css('background-image', "url(#{scope.slide.image_url})")
      element.addClass('hideContent')
      
    element.bind "click", ->
      if element.hasClass('current')
        element.removeClass('current')
      else
        $('slide').removeClass('current')
        element.addClass('current')

    element.bind "dblclick", ->
      if element.hasClass('hideContent')
        element.removeClass('hideContent')
        element.css('background-image', "")
      else if scope.slide.image_url
        element.css('background-image', "url(#{scope.slide.image_url})")
        element.addClass('hideContent')


    element.find('.zoom-in-button').bind "click", ->
      if element.hasClass('zoom')
        element.removeClass('zoom')
      else
        $('slide').removeClass('zoom')
        element.addClass('zoom')

app.directive "buttons", ->
  restrict: 'E'
  templateUrl: 'assets/control-buttons.html'

  link: (scope,element) ->
    $('.backward-btn').bind "click", ->
      slidesElement = $(document).find('slides')
      newLeft = parseInt(slidesElement.css('left')) + 500
      slidesElement.animate({'left': newLeft})

    $('.forward-btn').bind "click", ->
      slidesElement = $(document).find('slides')
      newLeft = parseInt(slidesElement.css('left')) - 500
      slidesElement.animate({'left': newLeft})

    $('.upward-btn').bind "click", ->
      slidesElement = $(document).find('#textSlides')
      newLeft = parseInt(slidesElement.css('top')) - 375
      slidesElement.animate({'top': newLeft})

    $('.downward-btn').bind "click", ->
      slidesElement = $(document).find('#textSlides')
      newLeft = parseInt(slidesElement.css('top')) + 375
      slidesElement.animate({'top': newLeft})
