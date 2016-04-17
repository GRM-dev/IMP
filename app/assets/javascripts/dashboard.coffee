dashboard = ->
  $('.body-dashboard').each ->
    getTotalHeight = $(document).height()
    getHeaderHeight = $('#header').height()
    $('.dashboard_menu').height getTotalHeight - getHeaderHeight
    return
  return

$(document).ready dashboard
$(window).resize dashboard
$(document).on('page:load', dashboard)