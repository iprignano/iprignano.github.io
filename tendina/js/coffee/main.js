// Generated by CoffeeScript 1.7.1
var TendinaExamples;

TendinaExamples = (function() {
  function TendinaExamples() {
    this.initTendinaExamples();
    this.initHljs();
    this._bindEvents();
  }

  TendinaExamples.prototype.initTendinaExamples = function() {
    $('#my-menu').tendina();
    $('#my-menu-1').tendina({
      onHover: true,
      hoverDelay: 500
    });
    return $('#my-menu-2').tendina({
      activeMenu: $('.opeth')
    });
  };

  TendinaExamples.prototype.initHljs = function() {
    return hljs.initHighlightingOnLoad();
  };

  TendinaExamples.prototype.swapFakeContentText = function(el) {
    var $fakeContent, clickedText;
    clickedText = $(el).text();
    $fakeContent = $(el).parents('.example-menu-container').siblings('.fake-content');
    return $fakeContent.find('h2').text(clickedText);
  };

  TendinaExamples.prototype._bindEvents = function() {
    return $('.menu-example ul li > ul li a').on('click', (function(_this) {
      return function(event) {
        event.preventDefault();
        return _this.swapFakeContentText(event.currentTarget);
      };
    })(this));
  };

  return TendinaExamples;

})();

$(function() {
  return window.tendinaExamples = new TendinaExamples;
});