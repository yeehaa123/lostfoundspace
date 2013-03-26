@SlideListCtrl = ($scope, Slide) ->
  $scope.slides = Slide.query()
  $scope.orderProp = 'age'
  
  $scope.setCurrentSlide = (slide) ->
    $scope.currentSlide = slide
    for s in $scope.slides
      s.currentSlide = ""
      slide.currentSlide = "current"
  
  $scope.saveCurrentSlide = (slide) ->
    console.log(slide.$update())

  $scope.deleteCurrentSlide = (slide) ->
    slide.$delete()
    $scope.slides = _.without($scope.slides, slide)

@SlideDetailCtrl = ($scope, $routeParams, Slide) ->
  $scope.slide = Slide.get(id: + $routeParams.slideId + '.json')
  $scope.saveSlide = ->
    console.log(@slide.$update())
