describe 'Lost and Found App', ->

  describe 'Slides List View', ->

    beforeEach ->
      browser().navigateTo('/')

    it 'should filter the slides as user types into search box', ->

      (expect repeater('.slides section').count()).toBe 10

      input('query').enter 'Slide 1'
      (expect repeater('.slides section').count()).toBe 2
      
      input('query').enter 'Moe'
      (expect repeater('.slides section').count()).toBe 0

    it 'should display the current filter value with an element with id "status"', ->
      (expect element('#status').text()).toMatch /Current filter: \s*$/

      input('query').enter 'Slide'
      (expect element('#status').text()).toMatch /Current filter: Slide\s*$/

    it 'should be possible to control slide order via the drop down select box', ->
      input('query').enter 'Slide 1'
      
      (expect repeater('.slides section', 'Slide List').column('slide.title'))
        .toEqual(["Slide 1", "Slide 10"])

      select('orderProp').option('Alphabetical')
      (expect repeater('.slides section', 'Slide List').column('slide.title'))
        .toEqual(["Slide 1", "Slide 10"])

    it 'should display the current filter value with an element with id "orderStatus"', ->
      (expect element('#orderStatus').text()).toMatch /Current filter: age\s*$/

    it 'should render slide specific links', ->
      input('query').enter 'Slide 2'
      element('.slides a').click()
      (expect browser().location().url()).toBe('/slides/2')

    it 'should redirect index.html to index.html#/slides', ->
      (expect browser().location().url()).toBe('/slides')

  describe 'Slide detail view', ->

    beforeEach ->
      browser().navigateTo('/#/slides/1')

    it 'should display placeholder page with slideId', ->
      (expect binding('slide.title')).toBe 'Slide 1'
