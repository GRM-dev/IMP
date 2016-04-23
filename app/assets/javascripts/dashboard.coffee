dashboard_load = ->
  $('#widgets').sortable connectWith: '.column'
  if !$('.portlet').hasClass('ui-widget-content')
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

sp_add_user = ->
  console.log 'Add User click'
  $('#widgets_section').hide()
  
sp_add_room = ->
  console.log 'Add Room click'
  $('#widgets_section').hide()
  


$(document).ready dashboard_resize
$(window).resize dashboard_resize
$(document).on('page:load', dashboard_resize)
$(document).on('turbolinks:load', dashboard_resize)

$(document).ready dashboard_load
$(document).on('page:load', dashboard_load)
$(document).on('turbolinks:load', dashboard_load)

$(document).on 'click', "#add_room_btn", sp_add_room
$(document).on 'click', "#add_user_btn", sp_add_user