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

slide_menu_elem = (e) ->
  le = $(e.data.list_elem)
  if le.css('display') == 'block'
    le.slideUp 'slow'
  else
    le.slideDown 'slow'
    
hide_widgets = ->
  $('#widgets_section').hide()
  
show_widgets = ->
  $('#widgets_section').show()
  
menu_active_class = (menu) ->
  $('.dashboard_menu').find('li').removeClass('active')
  $('.dashboard_menu').find('li').find('ul').find('li').addClass('deactive')
  if ($(menu).parent().hasClass("deactive"))
    $(menu).parent().removeClass("deactive").addClass("active")
  $(menu).parent().addClass('active')

show_subpage = (e) ->
  dashboard_spin_show()
  menu_active_class(e.target)
  $.ajax(type: e.data.rest_type, url: "/"+locale()+"/"+e.data.page).done (html) ->
    $('#dashboard_body').empty()
    $('#dashboard_body').append html
    if e.target.id == "add_user_btn"
      get_mails()
    dashboard_spin_show(false)

$(document).ready dashboard_resize
$(window).resize dashboard_resize
$(document).on 'page:load', dashboard_resize
$(document).on 'turbolinks:load', dashboard_resize

$(document).ready dashboard_load
$(document).on 'page:load', dashboard_load
$(document).on 'turbolinks:load', dashboard_load

$(document).on 'turbolinks:request-start', dashboard_spin_show

$(document).on 'click', "#users_btn", {list_elem: ".submenu-users"}, slide_menu_elem
$(document).on 'click', "#show_users_btn", {page: "dashboard/users", rest_type: "POST"}, show_subpage
$(document).on 'click', "#add_user_btn", {page: "dashboard/users/invite_user_form", rest_type: "POST"}, show_subpage
$(document).on 'click', "#users_permission", {page: "dashboard/users/permissions", rest_type: "POST"}, show_subpage

$(document).on 'click', "#rooms_btn", {list_elem: ".submenu-rooms"}, slide_menu_elem
$(document).on 'click', "#add_room_btn", {page: "building/lab/new", rest_type: "POST"}, show_subpage

$(document).on 'click', "#logs", {page: "dashboard/logs", rest_type: "POST"}, show_subpage
$(document).on 'click', "#settings", {page: "dashboard/settings", rest_type: "POST"}, show_subpage
$(document).on 'click', "#reports", {page: "dashboard/reports", rest_type: "POST"}, show_subpage
$(document).on 'click', "#faq", {page: "dashboard/faq", rest_type: "POST"}, show_subpage