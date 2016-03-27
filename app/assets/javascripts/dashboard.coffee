dashboard = ->
  $('body.dashboard').each ->
    getTotalHeight = $(window).height()
    getHeaderHeight = $('#header').height()
    $('.dashboard_menu').each ->
      $(this).height getTotalHeight - getHeaderHeight
      return
    return
  return

$(document).ready dashboard
$(window).resize dashboard