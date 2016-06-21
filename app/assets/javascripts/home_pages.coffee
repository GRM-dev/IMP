# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

fix_login = ->
  $('#log_into_dashboard').click ->
    page_wight = $(window).width()
    login_width = $('#login_modal').width()
    $('#login_modal').css('margin-left', page_wight/2 - login_width/2)
    return
  return

$(document).ready fix_login