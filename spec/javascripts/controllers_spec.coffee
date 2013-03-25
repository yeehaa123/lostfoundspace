describe 'lost and found in space controllers', ->

  beforeEach ->
    @addMatchers
      toEqualData: (expected) ->
        angular.equals(@actual, expected)


  beforeEach(module('lfServices'))

  describe 'SlideListCtrl', ->
    scope = {}
    $httpBackend = {}

    beforeEach inject((_$httpBackend_, $rootScope, $controller) ->
      $httpBackend = _$httpBackend_
      $httpBackend.expectGET("slides").respond [
        title: "Nexus S",
        title: "Motorola DROID"
      ]
      scope = $rootScope.$new()
      ctrl = $controller(SlideListCtrl, $scope: scope))

    it 'should create slides model with 3 slides fetched from xhr', ->
      (expect scope.slides).toEqual []
      $httpBackend.flush()

      (expect scope.slides).toEqualData [
        title: "Nexus S",
        title: "Motorola DROID"]

    it 'should set the default value of orderProp model', ->
      (expect scope.orderProp).toBe 'age'


  describe 'SlideDetailCtrl', ->
    scope = {}
    $httpBackend = {}
    xyzSlideData = ->
      title: 'slide xyz'
      content: 'Bla Bla BLa'
      
    beforeEach inject((_$httpBackend_, $rootScope, $routeParams, $controller) ->
      $httpBackend = _$httpBackend_
      $httpBackend.expectGET("slides/1.json").respond xyzSlideData()
      $routeParams.slideId = '1'
      scope = $rootScope.$new()
      ctrl = $controller(SlideDetailCtrl, $scope: scope))
      
    it 'should fetch slide detail', ->
      (expect scope.slide).toEqualData {}
      $httpBackend.flush()
      (expect scope.slide).toEqualData xyzSlideData()
