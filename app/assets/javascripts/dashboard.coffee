locale = ->
  return $("html").attr("lang")
  
dashboard_load = ->
  $('#widgets').sortable connectWith: '.column'
  if !$('.portlet').hasClass('ui-widget-content')
    $('.portlet').addClass('ui-widget ui-widget-content ui-helper-clearfix').find('.portlet-header')
      .prepend('<span class="ui-icon ui-icon-minusthick"></span>').end().find '.portlet-content'
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
    
dashboard_spin_show = (show = true)->
  if show
    hide_widgets()
    $("#dashboard_body").spin({
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
      fps: 40
      zIndex: 2e9
      className: 'spinner'
      top: $(document).height()/2 + 'px'
      left: '50%'
      shadow: false
      hwaccel: true
      position: 'absolute'
    });
  else
    $("#dashboard").spin(false)

slide_menu_elem = (elem) ->
  if elem.css('display') == 'block'
    elem.slideUp 'slow'
  else
    elem.slideDown()
    
hide_widgets = ->
  $('#widgets_section').hide()
  
show_widgets = ->
  $('#widgets_section').show()
  
menu_active_class = (menu) ->
  $('.dashboard_menu').find('li').removeClass('active')
  if ($(menu).hasClass("menu_button"))
    $(menu).removeClass('deactive').addClass('active')
  $(menu).parents().addClass('active')

sp_rooms = ->
  slide_menu_elem $('.submenu-rooms')
  
sp_add_room = ->
  dashboard_spin_show()
  menu_active_class("#add_room_btn")
  $.ajax(url: "/"+locale()+'/building/lab/new').done (html) ->
    $('#dashboard_body').empty()
    $('#dashboard_body').append html
    dashboard_spin_show(false)

sp_users = ->
  slide_menu_elem $('.submenu-users')
  
sp_show_users = ->
  dashboard_spin_show()
  menu_active_class("#show_users_btn")
  $.ajax(type: "POST", url: "/"+locale()+'/dashboard/users').done (html) ->
    $('#dashboard_body').empty()
    $('#dashboard_body').append html
    dashboard_spin_show(false)
  
sp_add_user = ->
  dashboard_spin_show()
  menu_active_class("#add_user_btn")
  $.ajax(type: "POST", url: "/"+locale()+'/users/invite_user_form').done (html) ->
    $('#dashboard_body').empty()
    $('#dashboard_body').append html
    get_mails()
    dashboard_spin_show(false)
  
sp_logs = ->
  $('#dashboard_body').empty()
  dashboard_spin_show()
  menu_active_class("#logs")
  dashboard_spin_show(false)
  
sp_settings = ->
  $('#dashboard_body').empty()
  dashboard_spin_show()
  menu_active_class("#settings")
  dashboard_spin_show(false)
  
sp_reports = ->
  $('#dashboard_body').empty()
  dashboard_spin_show()
  menu_active_class("#reports")
  dashboard_spin_show(false)
  

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
$(document).on 'click', "#show_users_btn", sp_show_users
$(document).on 'click', "#add_user_btn", sp_add_user
$(document).on 'click', "#logs", sp_logs
$(document).on 'click', "#settings", sp_settings
$(document).on 'click', "#reports", sp_reports