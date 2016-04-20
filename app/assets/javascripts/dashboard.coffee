dashboard_load = ->
  $('#widgets').sortable connectWith: '.column'
  $('.portlet').addClass('ui-widget ui-widget-content ui-helper-clearfix ui-corner-all').find('.portlet-header').addClass('ui-widget-header ui-corner-all').prepend('<span class="ui-icon ui-icon-minusthick"></span>').end().find '.portlet-content'
  $('.portlet-header .ui-icon').click ->
    $(this).toggleClass('ui-icon-minusthick').toggleClass 'ui-icon-plusthick'
    $(this).parents('.portlet:first').find('.portlet-content').toggle()
    return
  return

dashboard_resize = ->
  $('.body-dashboard').each ->
    getTotalHeight = $(document).height()
    getHeaderHeight = $('#header').height()
    $('.dashboard_menu').height getTotalHeight - getHeaderHeight
    return
  return

$(document).ready dashboard_resize
$(window).resize dashboard_resize
$(document).on('page:load', dashboard_resize)

$(document).ready dashboard_load
$(document).on('page:load', dashboard_load)
