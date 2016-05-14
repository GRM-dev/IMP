# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

get_mails = ->
  options = 
  	url: "users/user_mails.json"
  	placeholder: "Start writing email"
  	getValue: (elem) ->
  	  elem.email
  	list: 
  		match: 
  			enabled: true
  		onClickEvent: -> 
  		  $("#invite_user_btn").prop('disabled', false);
  		  data = $("#invitation-email").getSelectedItemData()
  		  set_data(data.id, $("#invitation-email").val())#data.email
  		  return
  		sort:
			  enabled: true
		template: 
  		type: "custom"
  		method: (value, item) ->
  			return item.visible_name+" <i>"+item.email+"</i> "+""
  $("#invitation-email").easyAutocomplete(options)
  $("#invitation-email").keyup ->
    change_data()
    $("#invite_user_btn").prop('disabled', false)
  
set_data = (id, mail) ->
  $('#selected_mail_id').val(id)
  $('#selected_mail_mail').val(mail)
  
change_data = ->
  set_data(0, $("#invitation-email").val())
  
add_user_perms_change_btn = ->
  $('#selected_users').on 'change', user_perms_change_opt
  effect_click_btn()
  
user_perms_change_opt = ->
  $('#save_perms_btn').prop('disabled', false);
  
effect_click_btn = ->
  validate = ->
    setTimeout (->
      $('#save_perms_btn').removeClass 'onclick'
      $('#save_perms_btn').addClass 'validate', 450, callback
      return
    ), 2250
    return

  callback = ->
    setTimeout (->
      $('#save_perms_btn').removeClass 'validate'
      return
    ), 1250
    return

  $('#save_perms_btn').click ->
    console.log "Test click button perms"
    $('#save_perms_btn').addClass 'onclick', 250, validate
    return
  return
  
window.db_get_mails = get_mails
window.db_add_user_perms_change_btn = add_user_perms_change_btn