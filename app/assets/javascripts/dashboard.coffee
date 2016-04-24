locale = ->
  return $("html").attr("lang")
  
dashboard_load = ->
  $('#widgets').sortable connectWith: '.column'
  if !$('.portlet').hasClass('ui-widget-content')
    $('.portlet').addClass('ui-widget ui-widget-content ui-helper-clearfix').find('.portlet-header').prepend('<span class="ui-icon ui-icon-minusthick"></span>').end().find '.portlet-content'
    $('.portlet-header .ui-icon').click ->
      $(this).toggleClass('ui-icon-minusthick').toggleClass 'ui-icon-plusthick'
      $(this).parents('.portlet:first').find('.portlet-content').toggle()
      return
    return
    
dashboard_spin_show = ->
  $("#dashboard").spin({
   lines: 15
   length: 31
   width: 15
   radius: 36
   scale: 1
   corners: 1 
   color: '#000'
   opacity: 0.25
   rotate: 0
   direction: 1
   speed: 0.9
   trail: 49
   fps: 20
   zIndex: 2e9 
   className: 'spinner'
   top: $(document).height()/2 + 'px'
   left: '50%'
   shadow: false
   hwaccel: true
   position: 'absolute'
  });
  
dashboard_resize = ->
  $('.body-dashboard').each ->
    getTotalHeight = $(document).height()
    getHeaderHeight = $('#header').height()
    $('.dashboard_menu').height getTotalHeight - getHeaderHeight
    return
  return

slide_elem = (elem) ->
  console.log 'slide'
  if elem.css('display') == 'block'
    elem.slideUp 'slow'
  else
    elem.slideDown()
    
hide_widgets = ->
  $('#widgets_section').hide()

sp_rooms = ->
  console.log 'Room click'
  slide_elem $('.submenu-rooms')
  
sp_add_room = ->
  console.log 'Add Room click'
  hide_widgets()
  $.ajax(url: "/"+locale()+'/building/lab/new').done (html) ->
    $('#dashboard').empty()
    $('#dashboard').append html

sp_users = -> 
  console.log 'User click'
  slide_elem $('.submenu-users')
  
sp_add_user = ->
  console.log 'Add User click'
  hide_widgets()


$(document).ready dashboard_resize
$(window).resize dashboard_resize
$(document).on 'page:load', dashboard_resize
$(document).on 'turbolinks:load', dashboard_resize

$(document).ready dashboard_load
$(document).on 'page:load', dashboard_load
$(document).on 'turbolinks:load', dashboard_load

$(document).on 'turbolinks:request-start', dashboard_spin_show

$(document).on 'click', "#rooms_btn", sp_rooms
$(document).on 'click', "#users_btn", sp_users
$(document).on 'click', "#add_room_btn", sp_add_room
$(document).on 'click', "#add_user_btn", sp_add_user