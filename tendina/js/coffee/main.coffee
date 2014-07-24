class TendinaExamples
  constructor: ->
    @initTendinaExamples()
    @initHljs()
    @_bindEvents()

  initTendinaExamples: ->
    $('#my-menu').tendina()
    $('#my-menu-1').tendina(
      onHover: true,
      hoverDelay: 500
    )
    $('#my-menu-2').tendina(
      activeMenu: $('.porcupine-tree')
    )

  initHljs: ->
    hljs.initHighlightingOnLoad()

  swapFakeContentText: (el) ->
    clickedText  = $(el).text()
    $fakeContent = $(el).parents('.example-menu-container').siblings('.fake-content')

    $fakeContent.find('h2').text(clickedText)

  # Private methods

  _bindEvents: ->
    $('.menu-example ul li > ul li a').on 'click', (event) =>
      event.preventDefault()
      @swapFakeContentText(event.currentTarget)

$ ->
  window.tendinaExamples = new TendinaExamples