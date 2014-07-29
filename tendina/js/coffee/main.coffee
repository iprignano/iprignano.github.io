class TendinaExamples
  constructor: ->
    @$smallHeaderLink = $('.small-header a')

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
      activeMenu: $('.opeth')
    )

  initHljs: ->
    hljs.initHighlightingOnLoad()

  swapFakeContentText: (el) ->
    clickedText  = $(el).text()
    $fakeContent = $(el).parents('.example-menu-container').siblings('.fake-content')

    $fakeContent.find('h2').text(clickedText)

  hideSmallTopbar: ->
    $('.small-header').removeClass 'active'

  showSmallTopbar: ->
    $('.small-header').addClass 'active'

  scrollSpy: ->
    sections = ['usage', 'examples', 'download']

    for section in sections
      if $(window).scrollTop() > $("##{section}").position().top
        @$smallHeaderLink.removeClass 'selected'
        @$smallHeaderLink.filter("[data-name='#{section}']").addClass 'selected'

  # Private methods
  _isMobile: ->
    /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)

  _bindEvents: ->
    $('.menu-example ul li > ul li a').on 'click', (event) =>
      event.preventDefault()
      @swapFakeContentText(event.currentTarget)

    $(window).on 'scroll', =>
      @scrollSpy() unless @_isMobile()

      if $(window).scrollTop() > $('#usage').position().top
        @showSmallTopbar()
      else
        @hideSmallTopbar()

    @$smallHeaderLink.on 'click', (event) =>
      @$smallHeaderLink.removeClass 'selected'
      $(event.currentTarget).addClass 'selected'

$ ->
  window.tendinaExamples = new TendinaExamples