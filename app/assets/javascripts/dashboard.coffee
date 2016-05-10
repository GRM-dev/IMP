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
    getTotalHeight = $(window).height()
    getHeaderHeight = $('#header').height()
    $('.dashboard_menu').height (getTotalHeight - getHeaderHeight)
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
  return
    
hide_widgets = ->
  $('#widgets_section').hide()
  
show_widgets = ->
  $('#widgets_section').show()
  
menu_active_class = (menu) ->
  $('.dashboard_menu').find('li').removeClass('active')
  $('.dashboard_menu').find('li').find('ul').find('li').addClass('deactive')
  parent = $(menu).parent()
  try_ = 3
  while !parent.is('li') && try_ > 0
    try_--
    parent = parent.parent()
  if (parent.hasClass("deactive"))
    parent.removeClass("deactive").addClass("active")
  parent.addClass('active')

show_subpage = (e) ->
  dashboard_spin_show()
  menu_active_class(e.target)
  $.ajax(type: e.data.rest_type, url: "/"+locale()+"/"+e.data.page).done (html) ->
    $('#dashboard_body').empty()
    $('#dashboard_body').append html
    try_ = 3
    parent = $(e.target)
    while !parent.is('button') && try_ > 0
      try_--
      parent = parent.parent()
    pid = parent.attr('id')
    if pid == "add_user_btn"
      get_mails()
    if pid == "show_users_btn"
      $('#table').DataTable()
    dashboard_spin_show(false)

menu_arr = 
  home:
    url: null
    target: null
    elems: null
    ajax_type: null
  profile:
    url: 'brak'
    target: 'brak'
    elems: null
    ajax_type: 'POST'
  labs:
    url: '.submenu-rooms'
    target: '#rooms_btn'
    elems: 
      add:
        url: 'building/lab/new'
        target: '#add_room_btn'
        ajax_type: 'GET'
      show:
        url: ''
        target: 'brak'
        ajax_type: 'POST'
      remove:
        url: ''
        target: 'brak'
        ajax_type: 'POST'
  users:
    url: '.submenu-users'
    target: '#users_btn'
    elems: 
      add:
        url: 'dashboard/users/invite_user_form'
        target: '#add_user_btn'
        ajax_type: 'POST'
      show:
        url: 'dashboard/users'
        target: '#show_users_btn'
        ajax_type: 'POST'
      perms:
        url: 'dashboard/users/permissions'
        target: '#users_permission'
        ajax_type: 'POST'
      remove:
        url: ''
        target: '#userremove'
        ajax_type: 'POST'
  logs:
    url: 'dashboard/logs'
    target: '#logs'
    elems: null
    ajax_type: 'POST'
  settings:
    url: 'dashboard/settings'
    target: '#settings'
    elems: null
    ajax_type: 'POST'
  reports:
    url: 'dashboard/reports'
    target: '#reports'
    elems: null
    ajax_type: 'POST'
  faq:
    url: 'dashboard/faq'
    target: '#faq'
    elems: null
    ajax_type: 'POST'
  logout:
    url: null
    target: null
    elems: null
    ajax_type: null
    
menu_ready = false
    
load_menu = ->
  if menu_ready
    return
  for k, menu_main_btn of menu_arr
    t = menu_main_btn.target
    if not t?
      continue
    url = menu_main_btn.url
    es = menu_main_btn.elems
    if not es?
      art = menu_main_btn.ajax_type
      $(document).on 'click', t, {page: url, rest_type: art}, show_subpage
    else
      $(document).on 'click', t, {list_elem: url}, slide_menu_elem
      for ke, menu_sub_btn of es
        t = menu_sub_btn.target
        url = menu_sub_btn.url
        art = menu_sub_btn.ajax_type
        $(document).on 'click', t, {page: url, rest_type: art}, show_subpage
  menu_ready = true

$(document).ready dashboard_resize
$(window).resize dashboard_resize
$(document).on 'page:load', dashboard_resize
$(document).on 'turbolinks:load', dashboard_resize

$(document).ready dashboard_load
$(document).on 'page:load', dashboard_load
$(document).on 'turbolinks:load', dashboard_load

$(document).ready load_menu
$(document).on 'page:load', load_menu
$(document).on 'turbolinks:load', load_menu

$(document).on 'turbolinks:request-start', dashboard_spin_show