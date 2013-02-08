$ ->
  hideRatings = ->
    $('#get-rating_block #ratings').hide()
    $('#get-rating_block #maximize').show()
    $('#get-rating_block #minimize').hide()
  showRatings = ->
    $('#get-rating_block #ratings').show()
    $('#get-rating_block #maximize').hide()
    $('#get-rating_block #minimize').show()

  $('body').on 'click', '#maximize, #minimize', (e) ->
    e.preventDefault()
    if $('#ratings:visible').length then hideRatings() else showRatings()

  $("#partners-slider").jcarousel(
    vertical: true
    wrap: "circular"
  )

  $("#nominees-slider").jcarousel(
    vertical: true
    wrap: "circular"
  )

  if $("#partners-slider").length < 6
    $("#partners-slider_prev, #partners-slider_next").hide()

  $("#partners-slider_prev").click ->
    $("#partners-slider").jcarousel "scroll", "-=1"
    false
  $("#partners-slider_next").click ->
    $("#partners-slider").jcarousel "scroll", "-=1"
    false

  $("#nominees-slider_prev").click ->
    $("#nominees-slider").jcarousel "scroll", "-=1"
    false
  $("#nominees-slider_next").click ->
    $("#nominees-slider").jcarousel "scroll", "-=1"
    false

  unless gon.locale == 'ru'
    $.datepicker.setDefaults $.datepicker.regional['en-GB']

  $('#videoModal').on 'hide', ->
    $(@).find("iframe").attr "src", $(@).find("iframe").attr("src")
  $('body').on 'click', '.video a', ->
    el = $(@).parents('figure')
    $('#videoModal #videoModalLabel').text el.data('title')
    $('#videoModal .iframe').html el.data('iframe')
