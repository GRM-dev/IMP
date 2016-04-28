# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

get_mails = ->
  
  availableTags = [
    "ActionScript@h.v",
    "AppleScript@g.f"
    ]
      
  options = 
  	url: "users/user_mails.json"
  	placeholder: "Start writing email"
  	getValue: (elem) ->
  	  elem.visible_name+elem.email
  	list: 
  		match: 
  			enabled: true
  	template: 
  		type: "custom"
  		method: (value, item) ->
  			return item.visible_name+" <i>"+item.email+"</i> "+""
      
  $("#email").easyAutocomplete(options)
      
window.get_mails = get_mails