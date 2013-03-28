@SlideListCtrl = ($scope, Slide) ->
  $scope.slides = Slide.query()
  $scope.orderProp = 'age'
  
  $scope.setCurrentSlide = (slide) ->
    $scope.currentSlide = slide
    for s in $scope.slides
      s.currentSlide = ""
      slide.currentSlide = "current"
  
  $scope.saveCurrentSlide = (slide) ->
    slide.$update()

  $scope.deleteCurrentSlide = (slide) ->
    slide.$delete slide, 
      (success)->
        $scope.slides = _.without($scope.slides, slide)
      (error) ->
        alert "fail"

  $scope.createNewSlide = () ->
    newSlide =  new Slide {
      title: "New Slide"
      subtitle: "New Subtitle"
      content: "New Content"
    }
    newSlide.$save()
    $scope.slides.push(newSlide)

@SlideDetailCtrl = ($scope, $routeParams, Slide) ->
  $scope.slide = Slide.get(id: + $routeParams.slideId + '.json')
  $scope.saveSlide = ->
    console.log(@slide.$update())
