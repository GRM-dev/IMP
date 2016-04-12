dashboard = ->
  console.log('refresh invoked')
  $('.body-dashboard').each ->
    console.log('refresh_invoking')
    getTotalHeight = $(document).height()
    getHeaderHeight = $('#header').height()
    $('.dashboard_menu').height getTotalHeight - getHeaderHeight
    return
  return

$(document).ready dashboard
$(window).resize dashboard
$(document).on('page:load', dashboard)