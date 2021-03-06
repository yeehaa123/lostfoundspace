// Generated by CoffeeScript 1.5.0
(function() {

  describe('Lost and Found App', function() {
    describe('Slides List View', function() {
      beforeEach(function() {
        return browser().navigateTo('/');
      });
      it('should filter the slides as user types into search box', function() {
        (expect(repeater('.slides section').count())).toBe(10);
        input('query').enter('Slide 1');
        (expect(repeater('.slides section').count())).toBe(2);
        input('query').enter('Moe');
        return (expect(repeater('.slides section').count())).toBe(0);
      });
      it('should display the current filter value with an element with id "status"', function() {
        (expect(element('#status').text())).toMatch(/Current filter: \s*$/);
        input('query').enter('Slide');
        return (expect(element('#status').text())).toMatch(/Current filter: Slide\s*$/);
      });
      it('should be possible to control slide order via the drop down select box', function() {
        input('query').enter('Slide 1');
        (expect(repeater('.slides section', 'Slide List').column('slide.title'))).toEqual(["Slide 1", "Slide 10"]);
        select('orderProp').option('Alphabetical');
        return (expect(repeater('.slides section', 'Slide List').column('slide.title'))).toEqual(["Slide 1", "Slide 10"]);
      });
      it('should display the current filter value with an element with id "orderStatus"', function() {
        return (expect(element('#orderStatus').text())).toMatch(/Current filter: age\s*$/);
      });
      it('should render slide specific links', function() {
        input('query').enter('Slide 2');
        element('.slides a').click();
        return (expect(browser().location().url())).toBe('/slides/2');
      });
      return it('should redirect index.html to index.html#/slides', function() {
        return (expect(browser().location().url())).toBe('/slides');
      });
    });
    return describe('Slide detail view', function() {
      beforeEach(function() {
        return browser().navigateTo('/#/slides/1');
      });
      return it('should display placeholder page with slideId', function() {
        return (expect(binding('slide.title'))).toBe('Slide 1');
      });
    });
  });

}).call(this);
