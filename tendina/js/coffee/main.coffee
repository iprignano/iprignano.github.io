class TendinaExamples
  constructor: ->
    @initTendinaExamples()
    @initHljs()

  initTendinaExamples: ->
    $('#my-menu').tendina()

  initHljs: ->
    hljs.initHighlightingOnLoad()

$ ->
  new TendinaExamples