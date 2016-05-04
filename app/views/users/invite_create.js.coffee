$('#user-add-title').html('<%= flash.notice %>')
$('#user-add-body').html('<%= flash.notice %>')
$('#user-add-modal').modal()

inner_modal_close = ->
  $('#user-add-modal').modal('hide')

$(document).on 'click', ".modal-backdrop", inner_modal_close