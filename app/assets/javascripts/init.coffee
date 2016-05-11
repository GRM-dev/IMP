update_html_current_locale = ->
  path = window.location.pathname
  lang = path.substring(0, path.lastIndexOf('/') + 1).split('/').join("")
  document.documentElement.lang = lang
  
$(document).on 'turbolinks:load', update_html_current_locale
window.update_locale = update_html_current_locale