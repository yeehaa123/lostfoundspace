@SlideListCtrl = ["$scope", "Slide", ($scope, Slide) ->
  Slide.query {}, (slides)->
    $scope.slides = slides
    $scope.imageSlides = _.filter slides, (slide) ->
      slide if slide.image_url
    $scope.textSlides = _.filter slides, (slide) ->
      slide if !slide.image_url

  $scope.orderProp = 'main_order'
  $scope.textSlideOrderProp = 'sub_order'
  
  $scope.setCurrentSlide = (slide) ->
    $scope.currentSlide = slide
    for s in $scope.slides
      s.currentSlide = ""
      slide.currentSlide = "current"
  
  $scope.saveCurrentSlide = (slide) ->
    console.log slide
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
      main_order: 99
      sub_order: 99
    }
    newSlide.$save()
    $scope.slides.push(newSlide)
]
