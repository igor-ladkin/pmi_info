# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#search-form i.fa-cog').on 'click', ->
    hiddenForceField = $('#force')
    val = hiddenForceField.val()

    $(@).toggleClass('force')
    hiddenForceField.val(val == 'false' ? 'true' : 'false')

  $('#search-form').on 'submit', ->
    $('#search-form i.fa-cog').addClass('fa-spin')

  setTimeout(hideAlerts, 4000)

hideAlerts = ->
  $('#alerts a.close').click()

$(document).ready(ready)
$(document).on('page:load', ready)
